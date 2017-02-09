param(
[String] $refDocPath = "docs-ref-autogen",
[String] $conceptDocPath = "docs-ref-conceptual",
[String] $titleMappingFileName = "titleMapping.json"
)

function Insert-RefTOC
{
  param([System.Collections.Generic.List[System.String]] $finalLines,
        [String] $refTocFile,
        [String] $topRefGroupName,
        [String] $prefix)

  $refLines = Get-Content $refTocFile
  $firstLine = $true
  foreach($line in $refLines)
  {
    if($firstLine)
    {
      $firstLine = $false
      $originalTitle = Find-TocTitle $line
      $line = $line.Replace($originalTitle, $topRefGroupName)
    }
    $finalLines.Add($prefix + $line)
  }
}

function Find-TocTitle
{
  param([String] $line)

  if([String]::IsNullOrWhiteSpace($line))
  {
    return $null
  }
  $leftPos = $line.IndexOf('[');
  $rightPos = $line.IndexOf(']');
  if($leftPos -ge 0 -and $rightPos -gt $leftPos)
  {
    return $line.Substring($leftPos + 1, $rightPos - $leftPos -1)
  }
  return $null
}

function Initialize-TitleMap
{
  param([String] $titleMappingFileName)

  if([String]::IsNullOrEmpty($titleMappingFileName))
  { return }

  $titleMappingSrc = Get-Content -Raw -Path $titleMappingFileName | ConvertFrom-Json
  foreach ($item in $titleMappingSrc.PSObject.Members) {

    $itemKey = $item.Name
    $TocTitle = $item.PSObject.Properties.Value.TocTitle
    $PageTitle = $item.PSObject.Properties.Value.PageTitle
    $newObj = New-Object System.Object
    $newObj | Add-Member -type NoteProperty -name "TocTitle" -value $TocTitle
    $newObj | Add-Member -type NoteProperty -name "PageTitle" -value $PageTitle

    $Script:titleMap.Add($itemKey,$newObj)
  }
}

function Replace-ContentTitle
{
  foreach($name in $Script:titleMap.Keys)
  {
    Write-Host "titleMap Key: " $name

    #find pycliyml file
    if($name -eq 'az')
    {
      $ymlFilePath = "index"
    }
    else
    {
      $ymlFilePath = $name.SubString(3).Split(' ') -join '/'
    }
    $ymlFilePath = "$refDocPath/$ymlFilePath.pycliyml"
    if(Test-Path $ymlFilePath)
    {
      Write-Host "Replacing title for $ymlFilePath"
      $lines = Get-Content $ymlFilePath
      $finalLines = New-Object System.Collections.Generic.List[System.String]
      $originalNameLine = "name: " + $name
      foreach($line in $lines)
      {
        if($line.StartsWith("name: "))
        {
          #Write-Host "Replacing This Line: " $line
          $pageTitle = $Script:titleMap.Get_Item($name).PageTitle
          $line = "name: '$pageTitle - $name'"
          #Write-Host "With this: " $line
        }
        $finalLines.Add($line)
      }
      Set-Content $ymlFilePath $finalLines
    }
  }
}

function Replace-TocTitle
{
  param([System.Collections.Generic.List[System.String]] $finalLines)

  if($Script:titleMap.Count -gt 0)
  {
    Write-Host "Start replacing toc title"
    Write-Host "Lines " + $finalLines.Count

    for($index = 0; $index -lt $finalLines.Count; ++$index)
    {
      $line = $finalLines[$index]
      $originalToc = Find-TocTitle $line

      if($originalToc -ne $null)
      {
        $originalToc = $originalToc.Trim()
        Write-Host "Original TOC Title '"$originalToc"'"
        if($Script:titleMap.ContainsKey($originalToc))
        {
          $mapItem = $Script:titleMap.Get_Item($originalToc)
          $tocTitle = $mapItem.TocTitle
          Write-Host "New Title" $tocTitle

          $line = $line.Replace($originalToc, $tocTitle)
          $line = $line.TrimEnd(')') + ' "' + $originalToc + '")' 

          Write-Host "With this: " $line

          $finalLines[$index] = $line
        }
      }
    }
  }
  Write-Host "Finishing replacing toc title"
}

Write-Host "Start merging TOC in folder: $refDocPath and $conceptDocPath"

$conceptTocFile = [System.IO.Path]::Combine($conceptDocPath, "TOC.md")
if(-not (Test-Path $conceptTocFile))
{
  Write-Host "Conceptual toc file $conceptTocFile doesn't exist" 
  exit(1) 
}

$conceptLines = Get-Content $conceptTocFile
$refTocFile = [System.IO.Path]::Combine($refDocPath, "refTOC.md")
$titleMap = @{}
$finalTocLines = New-Object System.Collections.Generic.List[System.String]
$includeRefDoc = $false
$level = 0
foreach($line in $conceptLines)
{
  if([System.String]::IsNullOrWhiteSpace($line))
  { break }

  $curLevel = 0
  $index = 0;
  while($index -lt $line.Length -and $line[$index] -eq '#')
  {
    ++$index
    ++$curLevel
  }
  if($curLevel -eq 0)
  {
    Write-Host "Unexpected toc content: $line"
    exit(1)
  }

  if($level -eq 0 -and $curLevel -ne 1)
  {
    Write-Host "First toc line must be start with only one #: $line"
    exit(1)
  }
  
  if($curLevel -gt $level + 1)
  {
    Write-Host "Invalid toc line: $line"
    exit(1)
  }

  $level = $curLevel
  if($line.IndexOf("refTOC.md", [System.StringComparison]::OrdinalIgnoreCase) -ge 0)
  {
    $includeRefDoc = $true
    $prefixIndent = "#"*($level-1)
    $topRefGroupName = Find-TocTitle $line
    Insert-RefTOC $finalTocLines $refTocFile $topRefGroupName $prefixIndent
  }
  else
  {
    #fix the link to point correct conceptual doc, leave absolute link alone
    $line = $line -replace '\][ ]*\([ ]*([a-zA-Z])','](_CONCEPTDOCPATH_$1'
    $line = $line.Replace("_CONCEPTDOCPATH_", "../$conceptDocPath/")
    $finalTocLines.Add($line)
  }
}

Initialize-TitleMap $titleMappingFileName
Replace-ContentTitle
Replace-TocTitle $finalTocLines

$tocFile = [System.IO.Path]::Combine($refDocPath, "TOC.md")
Set-Content $tocFile $finalTocLines

Write-Host "Complete merging TOC"
