function writeToFile([string]$target, [string]$file) {
  try {
    $content = Get-Content $file
    Set-Content -Path $target -Value $content
    Write-Host -ForegroundColor Cyan "`t$file installed successfully`n"
  }
  catch {
    Write-Host -ForegroundColor Red "`n`tUnable to install $file."
  }
}

Export-ModuleMember writeToFile