# Contributed by: Donavyn Haley -> https://github.com/DonavynHaley

function Invoke-PruneGitBranches {
  Write-Host "Pruning Remote..." -ForegroundColor Green

  $AllBranches = git branch -a
  $BranchesToSave = New-Object Collections.Generic.List[String]
  $BranchesToRemove = New-Object Collections.Generic.List[String]
  
  foreach ($Branch in $AllBranches) {
    $ShouldKeepBranch = [bool](($Branch.Contains("remotes")) `
                                -or ($Branch.Contains("develop")) `
                                -or ($Branch.Contains("main")) `
                                -or ($Branch.Contains("master")) `
                                -or ($Branch.Contains("trunk")))
    if ($ShouldKeepBranch) {
      $BranchEnd = $Branch.split("/")[-1]
      $BranchesToSave.Add($BranchEnd)
      Write-Host "Save ${Branch}" -ForegroundColor Blue
    }
  }

  foreach ($Branch in $AllBranches) {
    $BranchEnd = $Branch.split("/")[-1]
    if (!$Branch.Contains("remotes") -And !$BranchesToSave.Contains($BranchEnd)) {
      $BranchesToRemove.Add($Branch)
      Write-Host "Remove ${Branch}" -ForegroundColor Red
    }
  }

  $Continue = Read-Host -Prompt "Continue? (y/n)"
  if ('y' -ne $Continue) {
    Write-Host "No branches deleted. Exiting script" -ForegroundColor Red
    break;
  }

  foreach ($Branch in $BranchesToRemove) {
    git branch -D $Branch.Trim()
  }
}

New-Alias -Name pruneGit -Value Invoke-PruneGitBranches

Export-ModuleMember *-* -Alias pruneGit