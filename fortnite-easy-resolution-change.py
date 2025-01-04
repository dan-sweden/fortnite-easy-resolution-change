""" 
Script Name: fortnite-easy-resolution-change 
Author: Dan Johansson 
Usage: python script.py <Resolution> 
Example: python script.py 1920x1080 

Description: This script allows you to change the resolution settings in the GameUserSettings.ini file for Fortnite. 
For example, it can be configured to auto-start with Windows for seamless resolution management.

Functions: 
- get_game_user_settings_path: Retrieves the path to the GameUserSettings.ini file. 
- remove_read_only: Removes the read-only attribute from a file. 
- set_read_only: Sets the read-only attribute to a file. 
- change_resolution: Changes the resolution in the GameUserSettings.ini file. 

Usage: - Run the script with the desired resolution as an argument, in the format 'WidthxHeight'. 
"""

import os
import re
import sys

def get_game_user_settings_path():
    appdata_path = os.getenv('LOCALAPPDATA')
    if appdata_path is None:
        raise EnvironmentError("LOCALAPPDATA environment variable is not set.")
    return os.path.join(appdata_path, "FortniteGame", "Saved", "Config", "WindowsClient", "GameUserSettings.ini")

def remove_read_only(file_path):
    permissions = os.stat(file_path).st_mode
    os.chmod(file_path, permissions | 0o200)

def set_read_only(file_path):
    permissions = os.stat(file_path).st_mode
    os.chmod(file_path, permissions & ~0o200)
def change_resolution(resolution):
    if 'x' not in resolution:
        raise ValueError("Invalid resolution format. Please use the format 'WidthxHeight'.")
    ResX, ResY = resolution.split('x')
    ResX, ResY = resolution.split('x')
    DIRECTORY = get_game_user_settings_path()

    try:
        remove_read_only(DIRECTORY)
        
        with open(DIRECTORY, 'r') as file:
            content = file.read()

        new_content = re.sub(r"ResolutionSizeX=\d+", f"ResolutionSizeX={ResX}", content)
        new_content = re.sub(r"ResolutionSizeY=\d+", f"ResolutionSizeY={ResY}", new_content)
        
        with open(DIRECTORY, "w") as file:
            file.write(new_content)
            
        set_read_only(DIRECTORY)

    except FileNotFoundError:
        print(f"Error: File '{DIRECTORY}' does not exist.")
    except IOError:
        print("Error: A problem occurred while reading or writing the file.")
    except ValueError:
        print("Error: Please enter valid integer values for the resolutions.")
    except Exception:
        # This catch block is intended to catch any other unforeseen errors.
        print("Error: Remember to put the 'x' between the two numbers, without spaces")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <Resolution>")
    resolution = sys.argv[1]
    if not re.match(r'^\d+x\d+$', resolution):
        print("Error: Invalid resolution format. Please use the format 'WidthxHeight'.")
        sys.exit(1)
    change_resolution(resolution)
    change_resolution(sys.argv[1])
