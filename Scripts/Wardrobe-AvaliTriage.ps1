$ErrorActionPreference = "Inquire"
. .\Util.ps1

###############
## Variables ##
###############

$previousVersion = "2.4.2"

############
## Script ##
############

# Download latest release
Write-Host "Downloading Avali (Triage) from GitHub using StarboundModDownloader..." -ForegroundColor Yellow

# Download GitHub source code for latest release.
dotnet $PSScriptRoot\..\ModDownloader\StarboundModDownloader.dll github -i https://github.com/Avali-Triage-Team/Avali/ -s --overwrite -v $previousVersion -o AvaliTriage.zip

If ($LastExitCode -ne 0) {
  Write-Host "Cancelled because download failed." -ForegroundColor Yellow
  WaitAndExit 1
}

# Fetch wearables
Write-Host "Fetching files from AvaliTriage.zip using WardrobeItemFetcher..." -ForegroundColor Yellow
dotnet $PSScriptRoot\..\WardrobeItemFetcher\WardrobeItemFetcher.dll -i "AvaliTriage.zip" -o $PSScriptRoot\..\Wardrobe-AvaliTriage\wardrobe\avaliTriage.json --overwrite

# Delete zip
DeleteFile "AvaliTriage.zip"

# Done
Write-Host "Done updating Wardrobe items file for Avali (Triage)!" -ForegroundColor Green
Write-Host "Don't forget to update the version in the _metadata." -ForegroundColor Green
WaitAndExit 0
