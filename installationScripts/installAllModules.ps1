Import-Module "../validate/isAdmin.psm1"

if (-not (isAdmin)) {
  exit
}

./installStartRWEnvironment.ps1
./installPShellPrompt.ps1
./installOpenGradleTestReport.ps1
./installGciColor.ps1
./installMiscCommands.ps1
./installPruneGitBranches.ps1