Import-Module "../validate/isAdmin.psm1"

if (-not (isAdmin)) {
  exit
}

Import-Module "../validate/isUserProceeding.psm1"

if (-not (isUserProceeding)) {
  exit
}

Import-Module "../write/writeToFile.psm1"
Import-Module "../write/createDirectory.psm1"
Import-Module "../write/installModule.psm1"
Import-Module "../validate/isPathValid.psm1"

if (-not (isPathValid "C:\Program Files\ConEmu\ConEmu64.exe")) {
  try {
    choco install conemu -y
  }
  catch {
    Write-Host -ForegroundColor red "`n`tSomething went wrong.`n"
  }
  Write-Host -ForegroundColor Cyan "`n`tConEmu installed successfully.`n"
}

writeToFile "C:\Program Files\ConEmu\ConEmu.xml" "..\ConEmu.xml"
installModule "startRWEnvironment"
