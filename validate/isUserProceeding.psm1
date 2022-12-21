function printWarning {
  Write-Host -ForegroundColor Red "`n`tPlease read before proceeding:`n"
  Write-Host -ForegroundColor Cyan "`tRun PowerShell elevated to install this module`n"
  Write-Host -ForegroundColor Cyan "`tRunning this script will change a few settings in ConEmu."
  Write-Host -ForegroundColor Cyan "`tIf you have several custom settings in ConEmu,"
  Write-Host -ForegroundColor Cyan "`tconsider making a backup ConEmu.xml file before running this script.`n"
  Write-Host -ForegroundColor Cyan "`tIf conemu isn't installed, this script will install it."
  Write-Host -ForegroundColor Cyan "`tIf it's installed outside of the default location, it may reinstall.`n"
}

function promptUser {
  do {
    $promptWarning = Read-Host -Prompt "`tWould you like to continue? [y/n]" 
    $userInput = $promptWarning.ToLower().Trim()
    if ($userInput -eq "n") {
      Write-Host -ForegroundColor Red "`n`tCancelling installation and exiting...`n"
    }
  } while ($userInput -ne "y" -and $userInput -ne "n")
  return $userInput
}

function isYes([string]$answer) {
  if ($answer -eq "n") {
    return $False
  }
  else {
    return $True
  }
}

function isUserProceeding {
  printWarning
  return isYes(promptUser)
}

Export-ModuleMember isUserProceeding

