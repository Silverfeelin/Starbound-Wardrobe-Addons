Add-Type -AssemblyName System.IO.Compression.FileSystem

# Unzips the zip file to the target folder.
function Unzip([string]$zip, [string]$path)
{
  Write-Host "Unzipping $zip..." -ForegroundColor Yellow
  [System.IO.Compression.ZipFile]::ExtractToDirectory($zip, $path)
  Write-Host "Unzipped." -ForegroundColor Yellow
}

# Returns the first folder found in the given folder.
function GetFirstSubfolder([string]$folder)
{
  Return (Get-ChildItem -Path $folder -Directory | Select-Object -First 1)
}

# Forcibly and recursively deletes a folder.
function DeleteFolder([string]$folder)
{
  If (Test-Path $folder)
  {
    Write-Host "Deleting folder $folder..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $folder
    Write-Host "Deleted folder." -ForegroundColor Yellow
  }
}

# Forcibly deletes a file.
function DeleteFile([string]$file)
{
  Write-Host "Deleting file $file..." -ForegroundColor Yellow
  Remove-Item -Force $file
  Write-Host "Deleted file." -ForegroundColor Yellow
}

# Prompts and returns user input.
function ReadInput([string]$message)
{
  return Read-Host -Prompt $message
}

# Waits for any key before exiting with the given code.
function WaitAndExit([int]$code)
{
  Write-Host "Press any key to exit..." -ForegroundColor Yellow
  [void][System.Console]::ReadKey($true)
  Exit $code
}
