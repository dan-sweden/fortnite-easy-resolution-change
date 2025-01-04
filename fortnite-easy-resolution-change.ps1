<# 
.SYNOPSIS
Fortnite Easy Resolution Change Script

.DESCRIPTION
This script allows you to change the resolution settings in the GameUserSettings.ini file for Fortnite. 
For example, it can be configured to auto-start with Windows for seamless resolution management.

.SCRIPTNAME
fortnite-easy-resolution-change

.AUTHOR
Dan Johansson

.USAGE
.\fortnite-easy-resolution-change.ps1 <Resolution>
Example: .\fortnite-easy-resolution-change.ps1 1920x1080

#>

param (
    [string]$resolution
)

function Get-GameUserSettingsPath {
    $appdataPath = $env:LOCALAPPDATA
    if (-not $appdataPath) {
        throw "LOCALAPPDATA environment variable is not set."
    }
    return Join-Path $appdataPath "FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini"
}

function Remove-ReadOnly {
    param ($filePath)
    $attributes = (Get-Item $filePath).Attributes
    Set-ItemProperty $filePath -Name Attributes -Value ($attributes -band -bnot [System.IO.FileAttributes]::ReadOnly)
}

function Set-ReadOnly {
    param ($filePath)
    $attributes = (Get-Item $filePath).Attributes
    Set-ItemProperty $filePath -Name Attributes -Value ($attributes -bor [System.IO.FileAttributes]::ReadOnly)
}

function Change-Resolution {
    param ($resolution)
    if ($resolution -notmatch '^\d+x\d+$') {
        throw "Invalid resolution format. Please use the format 'WidthxHeight'."
    }
    $resX, $resY = $resolution -split 'x'
    $directory = Get-GameUserSettingsPath

    try {
        Remove-ReadOnly -filePath $directory

        $content = Get-Content -Path $directory
        $newContent = $content -replace "ResolutionSizeX=\d+", "ResolutionSizeX=$resX"
        $newContent = $newContent -replace "ResolutionSizeY=\d+", "ResolutionSizeY=$resY"
        
        Set-Content -Path $directory -Value $newContent

        Set-ReadOnly -filePath $directory
    } catch {
        Write-Output "Error: $($_.Exception.Message)"
    }
}

if (-not $resolution -or $resolution -notmatch '^\d+x\d+$') {
    Write-Output "Usage: .\script.ps1 <Resolution>"
    exit 1
}

Change-Resolution -resolution $resolution
