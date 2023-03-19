# Start Real World Environment

`rwp` &rarr; Run from root directory of a project.

Helpful for starting a developer environment requiring several running processes and command line interfaces. Creates grouped console tabs for each project section and automatically starts required servers. To maximize efficiency, it's ideal to only use the **GENERAL** tab for directory navigation, as each console per group has an intended purpose.

The top console for each section is intended for running integration tests. Use commands `gcd`, `gcdb`, etc. The middle console is ideal for running unit tests and will only exist if a "tests" folder is detected. The bottom console is for running/restarting servers and will only exist if a local server is required. The top and middle consoles are also great for opening editors with `ij .` and `code .` respectively (assuming you're using intellij and vscode).

You can navigate between console tab groups using `ctrl + tab` and navigate between consoles in a group using `alt + up` and `alt + down`

This module makes the following assumptions:

1. You're in the root directory of the project you want to start.
2. All servers are started using either `npm start` or `mvn spring-boot:run`. The server run command can be modified in startRWEnvironment.psm1
3. Your project follows a specific directory structure:
  * root/application/app1, root/application/app2, etc.
  * root/service/service1, root/service/service2, etc.
  * a console group will be opened for ALL directories under application and service.

![Start Real World Environment Sample GIF](./rwp_sample.gif)