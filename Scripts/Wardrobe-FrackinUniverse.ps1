$ErrorActionPreference = "Inquire"

###############
## Variables ##
###############

$previousVersion = "5.6.221"

###############
## Functions ##
###############

. .\Util.ps1

############
## Script ##
############

# Download latest release
Write-Host "Downloading Frackin Universe from GitHub using StarboundModDownloader..." -ForegroundColor Yellow

# Download GitHub source code for latest release.
dotnet $PSScriptRoot\..\ModDownloader\StarboundModDownloader.dll github -i https://github.com/sayterdarkwynd/FrackinUniverse/ -s --overwrite -v $previousVersion -o FrackinUniverse.zip

If ($LastExitCode -ne 0) {
  Write-Host "Cancelled because download failed." -ForegroundColor Yellow
  WaitAndExit 1
}

# Delete previous unzipped folder.
DeleteFolder "FrackinUniverse"

# Unzip
Write-Host "Unzipping will take quite a while because Frackin Universe is over 250 MB!" -ForegroundColor Yellow
Unzip "FrackinUniverse.zip" "FrackinUniverse"
$folder = GetFirstSubfolder "FrackinUniverse"

# Delete zip
DeleteFile "FrackinUniverse.zip"

# Fetch wearables
Write-Host "Fetching files from $folder using WardrobeItemFetcher..." -ForegroundColor Yellow
dotnet $PSScriptRoot\..\WardrobeItemFetcher\WardrobeItemFetcher.dll -i $PSScriptRoot\FrackinUniverse\$folder -o $PSScriptRoot\..\Wardrobe-FrackinUniverse\wardrobe\frackinUniverse.json --overwrite

# Delete unzipped folder.
DeleteFolder "FrackinUniverse"

# Done
Write-Host "Done updating Wardrobe items file for Frackin Universe!" -ForegroundColor Green
Write-Host "Don't forget to update the version in the _metadata." -ForegroundColor Green
WaitAndExit 0
