# fortnite-easy-resolution-change
Script Name: fortnite-easy-resolution-change 
Author: Dan Johansson 

Description: This script allows you to change the resolution settings in the GameUserSettings.ini file for Fortnite. 
For example, it can be configured to auto-start with Windows for seamless resolution management.
There are one Python script and one powershell. Both does same thing.

Python:
Usage: python script.py <Resolution> 
Example: python script.py 1920x1080 

Powershell:
Usage: python script.ps1 <Resolution> 
Example: python script.ps1 1920x1080 

Functions: 
- get_game_user_settings_path: Retrieves the path to the GameUserSettings.ini file. 
- remove_read_only: Removes the read-only attribute from a file. 
- set_read_only: Sets the read-only attribute to a file. 
- change_resolution: Changes the resolution in the GameUserSettings.ini file. 

Usage: - Run the script with the desired resolution as an argument, in the format 'WidthxHeight'. 

# Autostart
You can autostart a PowerShell script with an argument in Windows 11 using either the Startup Folder.

Using the Startup Folder:
1/ Open the Run dialog box: Press Windows key + R.

2/ Open the Startup folder: Type shell:startup and press Enter.

3/ Copy and edit fortnite-easy-resolution-change-startup.cmd or create a new text file: Right-click in the folder, select New, then Text Document.

4/ Edit the text file: Open the text file in Notepad and paste the following command, replacing the path with your script's path and adding your argument:

powershell "C:\path\to\powershell\script.ps1 WidthxHeight"

5/ Save and rename the file: Save the file, close Notepad, and rename the file to fortnite-easy-resolution-change-startup.cmd

6/ Ensure file extensions are visible: If you don't see the .cmd extension, make sure your file explorer settings show file extensions