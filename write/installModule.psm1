Import-Module "../write/createDirectory.psm1" -Force
Import-Module "../write/writeToFile.psm1" -Force

function installModule([string]$module) {
  $profileDir = $profile.substring(0, $profile.indexOf("\Microsoft.PowerShell_profile.ps1"))
  $allModulesDir = "$profileDir\Modules"
  $moduleDir = "$allModulesDir\$module"
  $moduleToInstall = "$moduleDir\$module.psm1"
  createDirectory $allModulesDir "Modules" "$profileDir\Modules"
  createDirectory $moduleDir "$module" "$allModulesDir\$module"
  writeToFile $moduleToInstall "..\Modules\$module.psm1"

}

Export-ModuleMember installModule