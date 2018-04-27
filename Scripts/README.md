# Wardrobe Add-on Scripts

This folder contains various scripts that can be used to update the Wardrobe add-ons more easily.

These scripts are set up for use on Windows, but considering the applications used by the scripts it shouldn't be too difficult to port them.

## Setting up

* Install the [.NET Core Runtime](https://www.microsoft.com/net/download/Windows/run) if you don't have it already.  
The .NET Core Runtime is used by the mod downloader and item fetcher.

* Download this [Starbound Mod Downloader](https://github.com/Silverfeelin/Starbound-ModDownloader/releases) and place the files in the folder `ModDownloader`.  
The mod downloader is used to download the latest release from either PlayStarbound or GitHub.

* Download the framework-dependent [Wardrobe Item Fetcher](https://github.com/Silverfeelin/Starbound-WardrobeItemFetcher/releases) and place the files in the folder `WardrobeItemFetcher`.  
The item fetcher can fetch all wearable items from a folder or zip file.  
The framework-dependent release is the release that doesn't have an OS in the file name.

## Running

To run a script, simply right click a file and select `Run with PowerShell`. Every script is a little bit different, but they're all just as easy to run.

For example, to download the latest release of Frackin' Universe from GitHub and update the add-on, simply run the script `Wardrobe-FrackinUniverse.ps1`.

The script will log the downloaded version, which you may want to use to update the add-on `_metadata` file.

## Things the scripts do

> Feel free to skip over this if you're not interested. This is just here for the sake of transparency.

Depending on the mod, release type and location, the scripts will do slightly different things. All scripts are set up to accomplish one simple task; update the wearables `.json` file for a mod.

### GitHub

If the mod is available on GitHub, the script will download the latest release from the repository. This can be a pak uploaded by the author or the source code.

### PlayStarbound

If the mod is available on PlayStarbound, the script will download the latest release from the site.

You'll need to provide your `xf2_session` cookie when running the script. The downloader tool needs this to be able to access the latest download link for the mod, but will not persist it.

GitHub is preferred over PlayStarbound because there's no user input necessary to download the mod.

You can find out more information about the session cookie on the [Mod Downloader Overview](https://github.com/Silverfeelin/Starbound-ModDownloader#finding-your-xf2_session-cookie.)

### Zip / Pak File

If the mod is distributed as a zip or pak file, the Wardrobe Item Fetcher will find wearables directly from the file without unpacking it.

The downloaded file is removed automatically unless the script is aborted or fails.

### Directory

Although mods are generally distributed as zip or pak file, the Wardrobe Item Fetcher does support directories.

This option can be used for add-ons that can't automatically be updated as of right now (relevant for mods distributed as `.rar` or `.tar.gz` files, for example).
