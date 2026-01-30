# Build Script for File Copier
# This script compiles FileCopier.ps1 into a standalone .exe

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   File Copier - Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if ps2exe is installed
$ps2exeInstalled = Get-Module -ListAvailable -Name ps2exe

if (-not $ps2exeInstalled) {
    Write-Host "ps2exe module is not installed." -ForegroundColor Yellow
    Write-Host "Installing ps2exe module..." -ForegroundColor Yellow
    Write-Host ""
    
    try {
        Install-Module -Name ps2exe -Scope CurrentUser -Force
        Write-Host "ps2exe module installed successfully!" -ForegroundColor Green
        Write-Host ""
    } catch {
        Write-Host "ERROR: Failed to install ps2exe module" -ForegroundColor Red
        Write-Host "Please run this command manually as Administrator:" -ForegroundColor Yellow
        Write-Host "Install-Module -Name ps2exe -Scope CurrentUser" -ForegroundColor White
        Write-Host ""
        Pause
        exit 1
    }
}

# Import the module
Import-Module ps2exe

# Check if FileCopier.ps1 exists
if (-not (Test-Path ".\FileCopier.ps1")) {
    Write-Host "ERROR: FileCopier.ps1 not found in current directory!" -ForegroundColor Red
    Write-Host "Please make sure you're running this script from the project directory." -ForegroundColor Yellow
    Write-Host ""
    Pause
    exit 1
}

Write-Host "Building FileCopier.exe..." -ForegroundColor Green
Write-Host ""

try {
    # Compile the script
    Invoke-ps2exe `
        -inputFile ".\FileCopier.ps1" `
        -outputFile ".\FileCopier.exe" `
        -title "File Copier" `
        -version "1.0.0" `
        -product "File Copier" `
        -copyright "MIT License" `
        -noConsole `
        -requireAdmin:$false
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "   Build Complete!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Output: FileCopier.exe" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "You can now distribute FileCopier.exe as a standalone application." -ForegroundColor White
    Write-Host ""
    
} catch {
    Write-Host ""
    Write-Host "ERROR: Build failed!" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
}

Pause
