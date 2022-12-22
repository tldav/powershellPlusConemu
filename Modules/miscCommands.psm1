# Function
function Invoke-PrintTerminalColors {
  [System.Enum]::GetValues('ConsoleColor') |
  ForEach-Object { Write-Host $_ -ForegroundColor $_ }
}
function Set-LocationToClipboard {
  $target = Get-Clipboard
  if ($target -clike "C:\*" -and (Test-Path $target -ErrorAction SilentlyContinue)) {
    Set-Location $target
  }
  else {
    Write-Host -ForegroundColor Cyan "`nDirectory not found ¯\_(ツ)_/¯`n"
  }
}
function Copy-WorkingDirectory {
  $path = (Get-Location).Path
  $path | Set-Clipboard
  "`nCopied path to clipboard:"
  $path
  ""
}
function Invoke-ItemWorkingDirectory {
  Invoke-Item .
}
function Invoke-InvokeItem([string]$dir) {
  Invoke-Item $dir
}

## Git
function Invoke-GitStatus {
  git status
}
function Invoke-GitAddAll {
  git add .
}
function invoke-GitPull {
  git pull
}
function Invoke-GitPush {
  git push
}
function Invoke-GitPushUpstreamOrigin {
  $remoteBranches = git branch -r
  $currentBranch = git branch --show-current

  if ($remoteBranches -contains "  origin/$currentBranch") {
    "$currentBranch is already connected to remote. Use git push, instead."
  }
  else {
    ""
    "Setting upstream and pushing to $currentBranch..."
    ""
    git push -u origin $currentBranch
  }
}
function Invoke-GitCommitM([string]$message) {
  git commit -m $message
}
## Gradle
function Invoke-GradleCleanDeployment {
  ./gradlew clean deployment
}
function Invoke-GradleCleanDebug {
  ./gradlew clean debug
}
function Invoke-GradleCleanRegression {
  ./gradlew clean regression
}
function Invoke-GradleCleanSmoke {
  ./gradlew clean smoke
}
function Invoke-GradleCleanTest {
  ./gradlew clean test
}

# Set-Alias ls Get-ChildItemColor -option AllScope -Force
# Set-Alias dir Get-ChildItemColor -option AllScope -Force
# Set-Alias gci Get-ChildItemColor -option AllScope -Force
Remove-Item alias:gp -Force # remove default alias for Get-ItemProperty
Remove-Item alias:gcm -Force # remove default alias for Get-Command

# Alias
New-Alias -Name touch -Value New-Item
New-Alias -Name printColors -Value Invoke-PrintTerminalColors
New-Alias -Name cdp -Value Set-LocationToClipboard
New-Alias -Name cwd -Value Copy-WorkingDirectory
New-Alias -Name e. -Value Invoke-ItemWorkingDirectory
New-Alias -Name e -Value Invoke-InvokeItem
New-Alias -Name gs -Value Invoke-GitStatus
New-Alias -Name ga. -Value Invoke-GitAddAll
New-Alias -Name gpl -Value Invoke-GitPull
New-Alias -Name gp -Value Invoke-GitPush
New-Alias -Name gpuo -Value Invoke-GitPushUpstreamOrigin
New-Alias -Name gcm -Value Invoke-GitCommitM
New-Alias -Name gcd -Value Invoke-GradleCleanDeployment
New-Alias -Name gcdb -Value Invoke-GradleCleanDebug
New-Alias -Name gcr -Value Invoke-GradleCleanRegression
New-Alias -Name gct -Value Invoke-GradleCleanTest


Export-ModuleMember *-* -Alias *