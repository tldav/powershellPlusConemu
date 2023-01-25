# PowerShell + ConEmu

A collection of helpful powershell modules and shorcuts, as well as conemu installation and configuration.

## Installation

1. Clone the [repository](https://github.com/tldav/powershellPlusConemu)
2. Open powershell terminal with admin/elevated privelages
3. Navigate to powershellPlusConemu/installationScripts and run installAllModules.ps1
4. Read over the information prompt
5. Enter `y` to continue or `n` to exit

Any module can be installed independently by running the respective ps1 file in the installationScripts directory.

The first time you open ConEmu, it is recommended that you do NOT do so with elevated permissions. It is also recommended that you change the Minimize/Restore hotkey in Settings > General to something that will not interfere with other software or system shortcuts.

## Modules

#### Start Real World Environment

Function: `Start-RWEnvironment`
| Alias: `rwp`
