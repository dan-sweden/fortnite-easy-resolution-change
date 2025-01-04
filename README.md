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
