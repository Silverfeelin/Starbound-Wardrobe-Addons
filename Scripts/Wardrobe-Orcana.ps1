$ErrorActionPreference = "Inquire"
. .\Util.ps1

###############
## Variables ##
###############

$previousVersion = "2.4.2"
$session = ReadInput "xf2_session"

$downloader = "$PSScriptRoot\..\ModDownloader\StarboundModDownloader.dll"
$fetcher = "$PSScriptRoot\..\WardrobeItemFetcher\WardrobeItemFetcher.dll"

############
## Script ##
############

# Download latest release
Write-Host "Downloading The Orcana from PlayStarbound using StarboundModDownloader..." -ForegroundColor Yellow

# Download GitHub source code for latest release.
dotnet $downloader psb -i https://community.playstarbound.com/resources/the-orcana.2747/ -s $session --overwrite -v $previousVersion -o Orcana.zip

If ($LastExitCode -ne 0) {
  Write-Host "Cancelled because download failed." -ForegroundColor Yellow
  WaitAndExit 1
}

# Fetch wearables
Write-Host "Fetching files from Orcana.zip using WardrobeItemFetcher..." -ForegroundColor Yellow
dotnet $fetcher -i "Orcana.zip" -o $PSScriptRoot\..\Wardrobe-Orcana\wardrobe\orcana.json --overwrite

# Delete zip
DeleteFile "Orcana.zip"

# Done
Write-Host "Done updating Wardrobe items file for The Orcana!" -ForegroundColor Green
Write-Host "Don't forget to update the version in the _metadata." -ForegroundColor Green
WaitAndExit 0
