$ErrorActionPreference = "Inquire"
. .\Util.ps1

###############
## Variables ##
###############

$previousVersion = "v1.0.11"

$downloader = "$PSScriptRoot\..\ModDownloader\StarboundModDownloader.dll"
$fetcher = "$PSScriptRoot\..\WardrobeItemFetcher\WardrobeItemFetcher.dll"

$url = "https://github.com/Unknown-Anomaly/Peglaci"
$pattern = ".*\.pak"
$name = "Peglaci"
$file = "Peglaci.pak"

############
## Script ##
############

# Download latest release
Write-Host "Downloading $name from GitHub using StarboundModDownloader..." -ForegroundColor Yellow

# Download GitHub source code for latest release.
dotnet $downloader github -i $url -p $pattern --overwrite -v $previousVersion -o $file

If ($LastExitCode -ne 0) {
  Write-Host "Cancelled because download failed." -ForegroundColor Yellow
  WaitAndExit 1
}

# Fetch wearables
Write-Host "Fetching files from $file using WardrobeItemFetcher..." -ForegroundColor Yellow
dotnet $fetcher -i $file -o $PSScriptRoot\..\Wardrobe-Peglaci\wardrobe\peglaci.json --overwrite

# Delete zip
DeleteFile $file

# Done
Write-Host "Done updating Wardrobe items file for $name!" -ForegroundColor Green
Write-Host "Don't forget to update the version in the _metadata." -ForegroundColor Green
WaitAndExit 0
