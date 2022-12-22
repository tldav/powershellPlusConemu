Import-Module "../validate/isAdmin.psm1"

if (-not (isAdmin)) {
  exit
}

Import-Module "../write/writeProfileReqs"

$isGcicInstalled = [bool] (Get-Command -ErrorAction Ignore Get-ChildItemColor)

if (-not $isGcicInstalled) {
  try {
    choco install get-childitemcolor -y
  }
  catch {
    Write-Host -ForegroundColor red "`n`tSomething went wrong.`n"
    exit
  }
  Write-Host -ForegroundColor Cyan "`n`tGet-ChildItemColor installed successfully."
  Write-Host -ForegroundColor Cyan "`tAfter terminal restart, 'ls', 'dir', and 'gci' will print files and directories in color`n"
}

overrideGciAlias
