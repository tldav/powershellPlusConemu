function ITConsole([string]$groupName, [string]$fullPath) {
  $integrationTestsExist = Test-Path -Path "$fullPath/test/"
  $unitTestsExist = Test-Path -Path "$fullPath/source/tests"
  if ($integrationTestsExist) {
    powershell -new_console:t:"$groupName-IT" -new_console:P:"ayu-mirage" -new_console:d:"$fullPath\test"
  }
  if (-not $integrationTestsExist -and -not $unitTestsExist) {
    powershell -new_console:t:$groupName -new_console:P:"ayu-mirage" -new_console:d:"$fullPath"
  }
}

function UTConsole([string]$groupName, [string]$fullPath) {
  $unitTestsExist = Test-Path -Path "$fullPath/source/tests"
  $integrationTestsExist = Test-Path -Path "$fullPath/test/"

  if ($unitTestsExist -and -not $integrationTestsExist) {
    powershell -new_console:t:"$groupName-UT" -new_console:P:"dracula" -new_console:d:"$fullPath\source"
  }
  if ($unitTestsExist -and $integrationTestsExist) {
    powershell -new_console:t:"$groupName-UT" -new_console:P:"dracula" -new_console:sV -new_console:d:"$fullPath\source"
  }
}

function serverConsole([string]$groupName, [string]$fullPath) {
  $sourceExists = Test-Path -Path "$fullPath/source"
  if ($sourceExists) {
    powershell -NoExit -new_console:t:"$groupName-SRV" -new_console:P:"gruvbox-dark" -new_console:sV -new_console:d:"$fullPath\source" -c "npm start" -n
  }
}

function newTabGroup([string]$groupName, [string]$fullPath) {
  $tabName = "$groupName".ToUpper()
  ITConsole $tabName $fullPath
  UTConsole $tabName $fullPath
  serverConsole $tabName $fullPath
}

function designateConsoleGroups([string]$section) {
  $currentDir = Get-Location
  $sectionDirs = Get-ChildItem "$currentDir/$section" -Directory
  foreach ($childDir in $sectionDirs) {
    if ($section -eq "application") {
      $tabName = "${childDir}app"
    }
    else {
      $tabName = $childDir
    }
    $fullPath = $childDir | Select-Object -ExpandProperty FullName
    newTabGroup $tabName $fullPath
  }
}

function Start-RWEnvironment() {
  $currentDir = Get-Location
  $isRWPRoot = (Test-Path -Path "$currentDir/application") -and (Test-Path -Path "$currentDir/service")
  if (-not $isRWPRoot) {
    return Write-Host -ForegroundColor red "You are not in the root directory of a project"
  }
  designateConsoleGroups application
  designateConsoleGroups service
}

New-Alias -Name rwp -Value Start-RWEnvironment

Export-ModuleMember *-* -Alias rwp

<# UNHANDLED SCENARIOS:

  source folder with no server to run
    unlikely for service section
    possible for application section
      RWP unlikely to implement mobile/desktop/other app type, however
#>