# PowerShell + ConEmu

A collection of helpful powershell modules and shortcuts, as well as conemu installation and configuration.

<span style="color:red">**Please review [RWE_README.md](./RWE_README.md) before attempting to use that module.**</span>

## Installation

1. Clone the [repository](https://github.com/tldav/powershellPlusConemu)
2. Open PowerShell terminal with admin/elevated privileges
3. Navigate to powershellPlusConemu/installationScripts and run installAllModules.ps1
4. Read over the information prompt
5. Enter `y` to continue or `n` to exit

Any module can be installed independently by running the respective ps1 file in the installationScripts directory.

**The first time you open ConEmu, it is recommended that you do NOT do so with elevated permissions. It is also recommended that you change the Minimize/Restore hotkey in Settings > General to something that will not interfere with other software or system shortcuts.**

## Modules

#### Start Real World Environment

Refer to RWE_README.md for details.

#### GCI Color

Adds color to directories and files when using `gci`, `ls`, etc.

#### PowerShell Prompt

Customizes the PowerShell prompt to contain more information and formats it similarly to bash.

## Shortcuts and Commands

#### Misc Commands

`sbr` &rarr; Alias for `mvn spring-boot:run`&nbsp;\
`cwd` &rarr; Copy working directory to clipboard\
`cdp` &rarr; Navigate to directory set to clipboard

`ij <directory>` &rarr; Open directory in intellij\
 &nbsp;&nbsp;&nbsp;&nbsp;_Similar to using `code <directory>` for vscode._

`e <directory>` &rarr; Opens directory in file explorer\
&nbsp;&nbsp;&nbsp;&nbsp;_Shortcut for `explorer .`, `explorer directory/directory`, `ii .`, etc._

`printColors` &rarr; List colors for current PowerShell theme\
&nbsp;&nbsp;&nbsp;&nbsp;_Helpful for making/editing custom themes._

`chromeDriverStopAll` &rarr; Kill all instances of chromedriver.exe\
&nbsp;&nbsp;&nbsp;&nbsp;_Especially helpful when chromedriver requires an update but cannot be deleted/replaced due to running instances._

`chromeStopAll` &rarr; Kill all instances of chrome.exe\
&nbsp;&nbsp;&nbsp;&nbsp;_While using chromedriver, many instances of chrome itself will start running. This can be used to lower memory use for those who do not use chrome as their primary browser._

#### Gradle Commands

The following commands must be used in the root folder of a gradle project. You'll know if you're in the right place if the directory includes files named gradlew, gradlew.bat, etc.

`gcd` &rarr; gradle clean deployment\
`gcdb` &rarr; gradle clean debug\
`gcr` &rarr; gradle clean regression\
`gcs` &rarr; gradle clean smoke\
`gct` &rarr; gradle clean test

`report` &rarr; open gradle test results\
&nbsp;&nbsp;&nbsp;&nbsp;_If you're using `clean` when running gradle tests, `report` will work by default. If you are not using `clean`, you will need to pass the test suite results you would like to view as a parameter `report deployment`, `report debug`, etc._

#### Git Commands

`gs` &rarr; git status\
`gp` &rarr; git push\
`gpl` &rarr; git pull

`gcm` &rarr; git commit -m\
&nbsp;&nbsp;&nbsp;&nbsp;_Type the message after in quotation marks e.g., gcm "this is a commit message"_

`ga.` &rarr; git add .\
&nbsp;&nbsp;&nbsp;&nbsp;_Only works for the current directory and lower. I.e., cannot append ../../ to navigate upward and add from there._
