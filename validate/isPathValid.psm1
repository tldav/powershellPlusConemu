function isPathValid([string]$path) {
  return Test-Path -Path $path
}

Export-ModuleMember isPathValid