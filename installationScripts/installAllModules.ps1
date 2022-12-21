Import-Module "../validate/isAdmin.psm1"

if (-not (isAdmin)) {
  exit
}

./installPShellPrompt.ps1
./installOpenGradleTestReport.ps1
./installGciColorShortcuts.ps1
./installStartRWEnvironment.ps1