Import-Module "../write/installModule.psm1"

installModule "pShellPrompt"

if (-not (Select-String -Path $profile -Pattern "function prompt {") ) {
  Add-Content $Profile "`n`nfunction prompt {"
  Add-Content $Profile "`tloadPrompt"
  Add-Content $Profile "}"
}