# PowerShell + ConEmu

A collection of helpful powershell modules and shortcuts, as well as conemu installation and configuration.

## Installation

1. Clone the [repository](https://github.com/tldav/powershellPlusConemu)
2. Open PowerShell terminal with admin/elevated privileges
3. Navigate to powershellPlusConemu/installationScripts and run installAllModules.ps1
4. Read over the information prompt
5. Enter `y` to continue or `n` to exit

Any module can be installed independently by running the respective ps1 file in the installationScripts directory.

The first time you open ConEmu, it is recommended that you do NOT do so with elevated permissions. It is also recommended that you change the Minimize/Restore hotkey in Settings > General to something that will not interfere with other software or system shortcuts.

## Modules

#### Start Real World Environment

Refer to RWE_README.md for details.

#### GCI Color

Adds color to directories and files when using `gci`, `ls`, etc.

#### PowerShell Prompt

Customizes the PowerShell prompt to contain more information and formats it similarly to bash.

## Shortcuts and Commands

#### Misc Commands

Command: `ij <directory>`\
Open directory in intellij via terminal, similar to using `code <directory>` for vscode.

Command: `sbr`\
Alias for `mvn spring-boot:run`

Command: `cwd`\
Copies working directory from terminal to clipboard

Command: `cdp`\
Navigates to directory currently set to clipboard

Command: `e <directory>`\
Opens directory in file explorer. This is a shortcut for `explorer .`, `explorer directory/directory`, `ii .`, etc.

Command: `printColors`\
Lists all colors used by current PowerShell color scheme. This is mostly helpful for editing custom themes.

Command: `chromeDriverStopAll`\
Kills all running instances of chromedriver.exe. This is especially helpful when chromedriver requires an update but cannot be deleted/replaced due to running instances.

Command: `chromeStopAll`\
While using chromedriver, many instances of chrome itself will start running. Using this can free up memory for those who use a browser other than chrome.

#### Gradle Commands

The following commands must be used in the root folder of a gradle project. You'll know if you're in the right place if the directory includes files named gradlew, gradlew.bat, etc.

gradle clean deployment: `gcd`\
gradle clean debug: `gcdb`\
gradle clean regression: `gcr`\
gradle clean smoke: `gcs`\
gradle clean test: `gct`

open gradle test results: `report`

If you're using `clean` when running gradle tests, `report` will work by default. If you are not using `clean`, you will need to pass the test suite results you would like to view as a parameter `report deployment`, `report debug`, etc.

#### Git Commands

git status: `gs`\
git push: `gp`\
git pull: `gpl`

git commit -m: `gcm`\
Type the message after in quotation marks e.g., gcm "this is a commit message"

git add . : `ga.`\
This only works for the current directory and lower. I.e., cannot append ../../ to navigate upward and add from there.
