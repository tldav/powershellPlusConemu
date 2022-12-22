function overrideGciAlias {
  $isGcicInstalled = [bool] (Get-Command -ErrorAction Ignore Get-ChildItemColor)
  $areAliasesSet = Select-String -Path $profile -Pattern "Set-Alias ls Get-ChildItemColor -option AllScope -Force"
  if ($isGcicInstalled -and -not $areAliasesSet ) {
    Add-Content $profile "`nif ([bool] (Get-Command -ErrorAction Ignore Get-ChildItemColor)) {"
    Add-Content $profile "`tSet-Alias ls Get-ChildItemColor -option AllScope -Force"
    Add-Content $profile "`tSet-Alias dir Get-ChildItemColor -option AllScope -Force"
    Add-Content $profile "`tSet-Alias gci Get-ChildItemColor -option AllScope -Force"
    Add-Content $profile "}`n"
  }
}

Export-ModuleMember overrideGciAlias