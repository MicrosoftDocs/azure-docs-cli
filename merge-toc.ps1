param(
[String] $refDocPath = "docs-ref-autogen",
[String] $conceptDocPath = "docs-ref-conceptual",
[String] $tocTitleMappingFileName = ""
)

Write-Host "Start merging TOC in folder: $refDocPath and $conceptDocPath"

$conceptTocFile = [System.IO.Path]::Combine($conceptDocPath, "TOC.md")
if(-not (Test-Path $conceptTocFile))
{
  Write-Host "Conceptual toc file $conceptTocFile doesn't exist" 
  exit(1) 
}

$conceptLines = Get-Content $conceptTocFile
$refTocFile = [System.IO.Path]::Combine($refDocPath, "refTOC.md")

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
    return $line.Substring($leftPos, $rightPos - $leftPos + 1)
  }
  return $null
}

function Replace-TocTitle
{
  param([System.Collections.Generic.List[System.String]] $finalLines,
        [String] $tocTitleMappingFileName)
  if(![String]::IsNullOrEmpty($tocTitleMappingFileName))
  {
    Write-Host "Start replacing toc title with mapping file: $tocTitleMappingFileName"
    $titleMappingSrc = Get-Content -Raw -Path $tocTitleMappingFileName | ConvertFrom-Json
    $tocTitleMap = @{}
    foreach($map in $titleMappingSrc | Get-Member -MemberType Properties)
    {
      $tocTitleMap["[" + $map.Name + "]"] = "[" + $titleMappingSrc.$($map.Name) + "]"
    }
    for($index = 0; $index -lt $finalLines.Count; ++$index)
    {
      $line = $finalLines[$index]
      $originalToc = Find-TocTitle $line
      if([String] -ne $null)
      {
        if($tocTitleMap.ContainsKey($originalToc))
        {
          $finalLines[$index] = $line.Replace($originalToc, $tocTitleMap[$originalToc])
        }
      }
    }
  }
  Write-Host "Finishing replacing toc title"
}

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

Replace-TocTitle $finalTocLines $tocTitleMappingFileName

$tocFile = [System.IO.Path]::Combine($refDocPath, "TOC.md")
Set-Content $tocFile $finalTocLines

Write-Host "Complete merging TOC"
