# File Copier

A simple, powerful Windows GUI utility for copying files with advanced filtering options.

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)

## Features

- **Filter by file extension** - Copy only the files you need
- **Flexible source selection** - Search from any root folder, even on different drives
- **Folder prefix filtering** - Only search folders with specific name prefixes (e.g., "ADF_")
- **Exclude patterns** - Skip folders you don't want to search
- **Real-time logging** - See exactly what's happening as it copies
- **Native Windows GUI** - Clean, simple interface using Windows Forms
- **Zero dependencies** - Just PowerShell (built into Windows)

## Quick Start

### Option 1: Run the Script (No Installation)

1. Download `FileCopier.ps1`
2. Right-click the file and select "Run with PowerShell"
3. If you get an execution policy error, run this in PowerShell as Administrator:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

### Option 2: Use the Compiled .exe

1. Download `FileCopier.exe` from the [Releases](../../releases) page
2. Double-click to run
3. No installation needed!

## How to Use

1. **File Extension**: Enter the extension you want to copy (e.g., `.p3d`, `.txt`, `.png`)
2. **Source Folder**: Click "Browse..." to select where to search from
3. **Destination Folder**: Click "Browse..." to select where to copy files to
4. **Folder Prefix Filter** (Optional): Only search folders that start with this text (e.g., `ADF_`)
5. **Exclude Folder Names** (Optional): Skip folders with these names (comma-separated, e.g., `temp, backup, old`)
6. Click **Copy Files** and watch the magic happen!

## Use Cases

### Example 1: Extract Arma 3 Models
- Extension: `.p3d`
- Source: `C:\Steam\steamapps\common\Arma 3\Addons`
- Folder Prefix: `ADF_`
- Result: Copies all .p3d files from folders starting with "ADF_"

### Example 2: Backup Project Files
- Extension: `.psd`
- Source: `D:\Projects`
- Exclude: `temp, old, backup`
- Result: Copies all Photoshop files, skipping temp/old/backup folders

### Example 3: Collect All Scripts
- Extension: `.ps1`
- Source: `C:\Users\YourName\Documents`
- Result: Finds and copies all PowerShell scripts from your documents

## Building from Source

Want to compile the script into a standalone .exe? Here's how:

### Prerequisites

Install `ps2exe` module (one-time setup):
```powershell
Install-Module -Name ps2exe -Scope CurrentUser
```

### Compile to .exe

```powershell
# Navigate to the script directory
cd path\to\FileCopier

# Compile the script
Invoke-ps2exe -inputFile .\FileCopier.ps1 -outputFile .\FileCopier.exe -title "File Copier" -version "1.0.0" -company "Your Name" -product "File Copier" -copyright "MIT License" -iconFile .\icon.ico -noConsole
```

**Note**: If you don't have an icon file, just remove the `-iconFile .\icon.ico` part.

### Simpler Compile (No Options)

```powershell
Invoke-ps2exe .\FileCopier.ps1 .\FileCopier.exe -noConsole
```

The `-noConsole` flag hides the PowerShell console window so only the GUI appears.

## Contributing

Contributions are welcome! Here's how to help:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes to `FileCopier.ps1`
4. Test it: Just run the .ps1 file to see your changes
5. Commit: `git commit -m 'Add some amazing feature'`
6. Push: `git push origin feature/amazing-feature`
7. Open a Pull Request

### Development Tips

- The entire application is in one file: `FileCopier.ps1`
- Uses Windows Forms (built into .NET Framework)
- No external dependencies needed for development
- Changes take effect immediately - just save and run

## Common Issues

### "Cannot be loaded because running scripts is disabled"

Run this in PowerShell as Administrator:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Antivirus Flags the .exe

Some antivirus software flags ps2exe-compiled executables as suspicious. This is a false positive. You can:
- Add an exception in your antivirus
- Run the .ps1 script directly instead
- Build it yourself from source to verify it's safe

## License

MIT License - see [LICENSE](LICENSE) for details

## Author

Created by IsoBones

## Acknowledgments

- Built with PowerShell and Windows Forms
- Inspired by the need for simple, powerful file management utilities

---

**Found this useful?** Give it a star on GitHub!
