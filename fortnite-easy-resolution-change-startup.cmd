@REM # Autostart
@REM You can autostart a PowerShell script with an argument in Windows 11 using either the Startup Folder.

@REM Using the Startup Folder:
@REM 1/ Open the Run dialog box: Press Windows key + R.
@REM 2/ Open the Startup folder: Type shell:startup and press Enter.
@REM 3/ Create a new text file: Right-click in the folder, select New, then Text Document.
@REM 4/ Edit the text file: Open the text file in Notepad and paste the following command, replacing the path with your script's path and adding your argument:
@REM powershell "C:\path\to\powershell\script.ps1" -Argument "YourArgument"
@REM 5/ Save and rename the file: Save the file, close Notepad, and rename the file to fortnite-easy-resolution-change-startup.cmd
@REM 6/ Ensure file extensions are visible: If you don't see the .cmd extension, make sure your file explorer settings show file extensions


@REM This is the main part of the script. It will run the PowerShell script with the argument.
powershell "C:\path\to\powershell\fortnite-easy-resolution-change.ps1" -Argument "2560x1080"