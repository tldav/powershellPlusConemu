function isContentWritten([string]$file, [string]$content) {
  return Select-String -Path $file -Pattern $content
}

function overrideGciAlias {
  $isGcicInstalled = [bool] (Get-Command -ErrorAction Ignore Get-ChildItemColor)
  $areAliasesSet = isContentWritten $profile "Set-Alias ls Get-ChildItemColor -option AllScope -Force"
  if ($isGcicInstalled -and -not $areAliasesSet ) {
    Add-Content $profile "`nif ([bool] (Get-Command -ErrorAction Ignore Get-ChildItemColor)) {"
    Add-Content $profile "`tSet-Alias ls Get-ChildItemColor -option AllScope -Force"
    Add-Content $profile "`tSet-Alias dir Get-ChildItemColor -option AllScope -Force"
    Add-Content $profile "`tSet-Alias gci Get-ChildItemColor -option AllScope -Force"
    Add-Content $profile "}`n"
  }
}

function overrideGitAlias {
  $profileDir = $profile.substring(0, $profile.indexOf("\Microsoft.PowerShell_profile.ps1"))
  $module = "$profileDir\Modules\miscCommands\miscCommands.psm1"
  $isGcmInstalled = isContentWritten $module "# install gcm alias"
  $isGCMdefaultRemoved = isContentWritten $profile "Set-Alias gcm Invoke-GitCommitM -option AllScope -Force"

  if ($isGcmInstalled -and -not $isGCMdefaultRemoved) {
    Add-Content $profile "`nif ([bool] (Get-Command -ErrorAction Ignore Invoke-GitCommitM)) {"
    Add-Content $profile "`tSet-Alias gcm Invoke-GitCommitM -option AllScope -Force"
    Add-Content $profile "}`n"
  }

  $isGpiInstalled = Select-String -Path $module -Pattern "function Invoke-GitPush {"
  $isGPIdefaultRemoved = Select-String -Path $profile -Pattern "Set-Alias gp Invoke-GitPush -option AllScope -Force"
  if ($isGpiInstalled -and -not $isGPIdefaultRemoved) {
    Add-Content $profile "`nif ([bool] (Get-Command -ErrorAction Ignore Invoke-GitPush)) {"
    Add-Content $profile "`tSet-Alias gp Invoke-GitPush -option AllScope -Force"
    Add-Content $profile "}`n"
  }
}


Export-ModuleMember overrideGciAlias, overrideGitAlias