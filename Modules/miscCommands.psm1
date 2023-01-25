function Invoke-PrintTerminalColors {
  [System.Enum]::GetValues("ConsoleColor") | ForEach-Object { Write-Host $_ -ForegroundColor $_ }
}

function Copy-WorkingDirectory {
  $path = (Get-Location).Path
  $path | Set-Clipboard
  "`nCopied path to clipboard:`n"
  "$path`n"
}

function Set-LocationToClipboard {
  $target = Get-Clipboard
  if ($target -clike "C:\*" -and (Test-Path $target -ErrorAction SilentlyContinue)) {
    Set-Location $target
  }
  else {
    Write-host -ForegroundColor Cyan "`nDirectory not found`n"
  }
}

function Invoke-ItemWorkingDirectory {
  Invoke-Item .
}
function Invoke-InvokeItem([string]$dir) {
  Invoke-Item $dir
}

function Stop-ChromeDriverExeAll {
  taskkill /IM chromedriver.exe /F
}
function Stop-ChromeExeAll {
  taskkill /IM chrome.exe /F
}

## Git
function Invoke-GitStatus {
  git status
}
function Invoke-GitAddAll {
  git add .
}
function Invoke-GitPull {
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
# install gcm alias
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

## Spring boot w/ maven
function Start-MavenSpringBoot {
  mvn spring-boot:run
}

## Intellij
function Open-DirectoryIntellij([string]$dir) {
  idea64.exe $dir
}


# Alias
New-Alias -Name touch -Value New-Item
New-Alias -Name printColors -Value Invoke-PrintTerminalColors
New-Alias -Name cdp -Value Set-LocationToClipboard
New-Alias -Name cwd -Value Copy-WorkingDirectory
New-Alias -Name e. -Value Invoke-ItemWorkingDirectory
New-Alias -Name e -Value Invoke-InvokeItem
New-Alias -Name chromeDriverStopAll -Value Stop-ChromeDriverExeAll
New-Alias -Name chromeStopAll -Value Stop-ChromeExeAll
New-Alias -Name gs -Value Invoke-GitStatus
New-Alias -Name ga. -Value Invoke-GitAddAll
New-Alias -Name gpl -Value Invoke-GitPull
New-Alias -Name gpuo -Value Invoke-GitPushUpstreamOrigin
New-Alias -Name gcd -Value Invoke-GradleCleanDeployment
New-Alias -Name gcdb -Value Invoke-GradleCleanDebug
New-Alias -Name gcr -Value Invoke-GradleCleanRegression
New-Alias -Name gct -Value Invoke-GradleCleanTest
New-Alias -Name sbr -Value Start-MavenSpringBoot
New-Alias -Name ij -Value Open-DirectoryIntellij


Export-ModuleMember *-* -Alias *