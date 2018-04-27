Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip([string]$zip, [string]$out)
{
  Write-Host "Unzipping $zip..." -ForegroundColor Yellow
  [System.IO.Compression.ZipFile]::ExtractToDirectory($zip, $out)
  Write-Host "Unzipped." -ForegroundColor Yellow
}

function GetFirstSubfolder([string]$folder)
{
  Return (Get-ChildItem -Path $folder -Directory | Select-Object -First 1)
}

function DeleteFolder([string]$folder)
{
  If (Test-Path $folder)
  {
    Write-Host "Deleting folder $folder..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $folder
    Write-Host "Deleted folder." -ForegroundColor Yellow
  }
}

function DeleteFile([string]$file)
{
  Write-Host "Deleting file $file..." -ForegroundColor Yellow
  Remove-Item -Force $file
  Write-Host "Deleted file." -ForegroundColor Yellow
}

function WaitAndExit([int]$code)
{
  Write-Host "Press any key to exit..." -ForegroundColor Yellow
  [void][System.Console]::ReadKey($true)
  Exit $code
}
