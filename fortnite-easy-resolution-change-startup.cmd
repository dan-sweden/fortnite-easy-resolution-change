@REM # Autostart
@REM You can autostart a PowerShell script with an argument in Windows 11 using either the Startup Folder.

@REM Using the Startup Folder:
@REM 1/ Open the Run dialog box: Press Windows key + R.
@REM 2/ Open the Startup folder: Type shell:startup and press Enter.
@REM 3/ Copy this file to the Startup folder.


@REM This is the main part of the script. It will run the PowerShell script with the argument.
powershell "C:\path\to\powershell\fortnite-easy-resolution-change.ps1" -Argument "2560x1080"