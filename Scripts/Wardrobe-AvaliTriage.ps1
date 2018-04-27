$ErrorActionPreference = "Inquire"

###############
## Variables ##
###############

$previousVersion = "2.4.2"

###############
## Functions ##
###############

. .\Util.ps1

############
## Script ##
############

# Download latest release
Write-Host "Downloading Avali (Triage) from GitHub using StarboundModDownloader..." -ForegroundColor Yellow

# Download GitHub source code for latest release.
dotnet $PSScriptRoot\..\ModDownloader\StarboundModDownloader.dll github -i https://github.com/Avali-Triage-Team/Avali/ -s --overwrite -v $previousVersion -o AvaliTriage.zip

If ($LastExitCode -ne 0) {
  Write-Host "Cancelled because download failed." -ForegroundColor Yellow
  WaitAndExit(1)
}

# Delete previous unzipped folder.
DeleteFolder("AvaliTriage")

# Unzip
Unzip "AvaliTriage.zip" "AvaliTriage"
$folder = GetFirstSubfolder("AvaliTriage")

# Delete zip
DeleteFile("AvaliTriage.zip")

# Fetch wearables
Write-Host "Fetching files from $folder" -ForegroundColor Yellow
dotnet $PSScriptRoot\..\WardrobeItemFetcher\WardrobeItemFetcher.dll -i $PSScriptRoot\AvaliTriage\$folder -o $PSScriptRoot\..\Wardrobe-AvaliTriage\wardrobe\avaliTriage.json --overwrite

# Delete unzipped folder.
DeleteFolder("AvaliTriage")

# Done
Write-Host "Done updating Wardrobe items file for Avali (Triage)!" -ForegroundColor Green
Write-Host "Don't forget to update the version in the _metadata." -ForegroundColor Green
WaitAndExit(0)
