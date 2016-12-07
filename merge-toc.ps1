param(
[String] $refDocPath = "docs-ref-autogen",
[String] $conceptDocPath = "docs-ref-conceptual"
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
$refLines = Get-Content $refTocFile

$finalTocLines = New-Object System.Collections.Generic.List[System.String]

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
  $line = $line.Replace("](", "](..\" + $conceptDocPath + "\");
  $finalTocLines.Add($line)
}

$indent = ""
if($level -ne 0)
{
  $indent = "#"
}

foreach($line in $refLines)
{
  $line = $line.TrimEnd()
  if(-not $line.EndsWith(".md)", [System.StringComparison]::OrdinalIgnoreCase))
  {
    $finalTocLines.Add($indent + $line)
  }
}

$tocFile = [System.IO.Path]::Combine($refDocPath, "TOC.md")

Set-Content $tocFile $finalTocLines

Write-Host "Complete merging TOC"