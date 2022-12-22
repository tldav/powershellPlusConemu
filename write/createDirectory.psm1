Import-Module "../validate/isPathValid.psm1" -Force

function createDirectory([string]$dirToCreate, [string]$dirName, [string]$parentDir) {
  if (-not (isPathValid $dirToCreate)) {
    try {
      New-Item -Name $name -ItemType "directory" -Path $parentDir
    }
    catch {
      Write-Host -ForegroundColor Red "`n`tUnable to create directory $name in $parentDir."
    }
  }
}

Export-ModuleMember createDirectory