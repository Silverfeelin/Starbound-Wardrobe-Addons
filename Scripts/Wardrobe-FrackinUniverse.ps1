$ErrorActionPreference = "Inquire"
. .\Util.ps1

###############
## Variables ##
###############

$previousVersion = "5.6.221"

$downloader = "$PSScriptRoot\..\ModDownloader\StarboundModDownloader.dll"
$fetcher = "$PSScriptRoot\..\WardrobeItemFetcher\WardrobeItemFetcher.dll"

############
## Script ##
############

# Download latest release
Write-Host "Downloading Frackin Universe from GitHub using StarboundModDownloader..." -ForegroundColor Yellow

# Download GitHub source code for latest release.
dotnet $downloader github -i https://github.com/sayterdarkwynd/FrackinUniverse/ -s --overwrite -v $previousVersion -o FrackinUniverse.zip

If ($LastExitCode -ne 0) {
  Write-Host "Cancelled because download failed." -ForegroundColor Yellow
  WaitAndExit 1
}

# Fetch wearables
Write-Host "Fetching files from FrackinUniverse.zip using WardrobeItemFetcher..." -ForegroundColor Yellow
dotnet $fetcher -i "FrackinUniverse.zip" -o $PSScriptRoot\..\Wardrobe-FrackinUniverse\wardrobe\frackinUniverse.json --overwrite

# Delete zip
DeleteFile "FrackinUniverse.zip"

# Done
Write-Host "Done updating Wardrobe items file for Frackin Universe!" -ForegroundColor Green
Write-Host "Don't forget to update the version in the _metadata." -ForegroundColor Green
WaitAndExit 0
