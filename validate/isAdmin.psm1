function isAdmin {

  $isUserAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

  if (-not $isUserAdmin) {
    Write-Host -ForegroundColor Red "`n`tThis script requires elevated permissions."
    Write-Host -ForegroundColor Red "`tPlease exit the terminal and open as admin or run elevated`n"
  }
  return $isUserAdmin
}

Export-ModuleMember isAdmin