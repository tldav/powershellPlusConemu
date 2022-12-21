function openDefaultReport {
  $currentPath = Get-Location
  $targetDir = Get-ChildItem -Path .\build\reports\tests\
  $path = "$currentPath\build\reports\tests\"
  $suiteCount = (Get-ChildItem $path | Measure-Object).Count;

  if ($suiteCount -gt 1) {
    return Write-Host -ForegroundColor red "Too many test reports found. Please specify the target report by passing the suite name as an argument."
  }

  Start-Process chrome "$path$targetDir\index.html"
}

function Open-Report([string]$suite) {
  $currentPath = Get-Location
  $suiteArray = @("deployment", "debug", "regression")

  if (-not((Test-Path "$currentPath/build.gradle")) -eq $true) {
    return Write-Host -ForegroundColor red "You are not in the root directory of a gradle project."
  }
  if (-not(Test-Path -Path "$currentPath\build")) {
    return Write-Host -ForegroundColor red "No build folder detected."
  } 

  if ($suite.Trim().length -lt 1) {
    openDefaultReport
    return;
  }

  switch ($suite) {
    { $_ -in "d", "deploy", "gcd" } {
      $suite = $suiteArray[0]
      Break
    }
    { $_ -in "db", "bug" } {
      $suite = $suiteArray[1]
      Break
    }
    { $_ -in "r", "reg" } {
      $suite = $suiteArray[2]
    }
  }

  $target = "\build\reports\tests\$suite\index.html";

  if (-not($suiteArray -contains $suite)) {
    return Write-Host -ForegroundColor red 'Test suite not found.'
  }
  if (-not(Test-Path -Path "$currentPath\build\reports\tests\$suite")) {
    return Write-Host -ForegroundColor red $suite.ToUpper() "Tests have not been executed."
  }

  $path = "$currentPath$target"
  Start-Process chrome $path
}

New-Alias -Name report -Value Open-Report

Export-ModuleMember *-* -Alias report