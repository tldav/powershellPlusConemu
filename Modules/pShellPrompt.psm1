function loadPrompt {
  Write-Host "$ENV:USERNAME" -NoNewline -ForegroundColor DarkYellow
  # Write-Host "@$ENV:COMPUTERNAME" -NoNewline -ForegroundColor DarkMagenta <- use this instead of below if you want to display your machine name instead of "TEK"
  Write-Host "@TEK" -NoNewline -ForegroundColor DarkMagenta
  Write-Host " " -NoNewline -ForegroundColor DarkGray
  Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor Magenta
  Write-Host " " -NoNewline -ForegroundColor DarkGray
  Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\', '\\'), "~") -NoNewline -ForegroundColor Green
  Write-Host " " -NoNewline -ForegroundColor DarkGray

  $global:LASTEXITCODE = $realLASTEXITCODE
  Write-VcsStatus
  Write-Host ""
  return "$ "
}
Export-ModuleMember loadPrompt