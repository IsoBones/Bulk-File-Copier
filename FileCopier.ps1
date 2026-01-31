# File Copier - A simple GUI utility for copying files with filters
# Author: IsoBones & Contributors
# License: MIT

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'File Copier'
$form.Size = New-Object System.Drawing.Size(600, 585)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false

# Create a font for labels
$labelFont = New-Object System.Drawing.Font("Segoe UI", 9)
$titleFont = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)

$yPos = 20

# ============ File Extension ============
$lblExtension = New-Object System.Windows.Forms.Label
$lblExtension.Location = New-Object System.Drawing.Point(20, $yPos)
$lblExtension.Size = New-Object System.Drawing.Size(560, 20)
$lblExtension.Text = 'File Extension (e.g., .mp3, .txt, .png):'
$lblExtension.Font = $titleFont
$form.Controls.Add($lblExtension)

$yPos += 25

$txtExtension = New-Object System.Windows.Forms.TextBox
$txtExtension.Location = New-Object System.Drawing.Point(20, $yPos)
$txtExtension.Size = New-Object System.Drawing.Size(560, 25)
$txtExtension.Text = '.txt'
$txtExtension.Font = $labelFont
$form.Controls.Add($txtExtension)

$yPos += 40

# ============ Source Folder ============
$lblSource = New-Object System.Windows.Forms.Label
$lblSource.Location = New-Object System.Drawing.Point(20, $yPos)
$lblSource.Size = New-Object System.Drawing.Size(560, 20)
$lblSource.Text = 'Source Folder (root folder to search from):'
$lblSource.Font = $titleFont
$form.Controls.Add($lblSource)

$yPos += 25

$txtSource = New-Object System.Windows.Forms.TextBox
$txtSource.Location = New-Object System.Drawing.Point(20, $yPos)
$txtSource.Size = New-Object System.Drawing.Size(450, 25)
$txtSource.Font = $labelFont
$form.Controls.Add($txtSource)

$btnBrowseSource = New-Object System.Windows.Forms.Button
$btnBrowseSource.Location = New-Object System.Drawing.Point(480, $yPos)
$btnBrowseSource.Size = New-Object System.Drawing.Size(100, 25)
$btnBrowseSource.Text = 'Browse...'
$btnBrowseSource.Font = $labelFont
$form.Controls.Add($btnBrowseSource)

$yPos += 40

# ============ Destination Folder ============
$lblDestination = New-Object System.Windows.Forms.Label
$lblDestination.Location = New-Object System.Drawing.Point(20, $yPos)
$lblDestination.Size = New-Object System.Drawing.Size(560, 20)
$lblDestination.Text = 'Destination Folder (where to copy files):'
$lblDestination.Font = $titleFont
$form.Controls.Add($lblDestination)

$yPos += 25

$txtDestination = New-Object System.Windows.Forms.TextBox
$txtDestination.Location = New-Object System.Drawing.Point(20, $yPos)
$txtDestination.Size = New-Object System.Drawing.Size(450, 25)
$txtDestination.Font = $labelFont
$form.Controls.Add($txtDestination)

$btnBrowseDestination = New-Object System.Windows.Forms.Button
$btnBrowseDestination.Location = New-Object System.Drawing.Point(480, $yPos)
$btnBrowseDestination.Size = New-Object System.Drawing.Size(100, 25)
$btnBrowseDestination.Text = 'Browse...'
$btnBrowseDestination.Font = $labelFont
$form.Controls.Add($btnBrowseDestination)

$yPos += 40

# ============ Folder Prefix Filter (Optional) ============
$lblPrefix = New-Object System.Windows.Forms.Label
$lblPrefix.Location = New-Object System.Drawing.Point(20, $yPos)
$lblPrefix.Size = New-Object System.Drawing.Size(560, 20)
$lblPrefix.Text = 'Folder Prefix Filter (optional - i.e. project_):'
$lblPrefix.Font = $titleFont
$form.Controls.Add($lblPrefix)

$yPos += 25

$txtPrefix = New-Object System.Windows.Forms.TextBox
$txtPrefix.Location = New-Object System.Drawing.Point(20, $yPos)
$txtPrefix.Size = New-Object System.Drawing.Size(560, 25)
$txtPrefix.Font = $labelFont
$txtPrefix.Text = ''
$form.Controls.Add($txtPrefix)

$yPos += 40

# ============ Exclude Patterns (Optional) ============
$lblExclude = New-Object System.Windows.Forms.Label
$lblExclude.Location = New-Object System.Drawing.Point(20, $yPos)
$lblExclude.Size = New-Object System.Drawing.Size(560, 20)
$lblExclude.Text = 'Exclude Folder Names (optional - comma separated):'
$lblExclude.Font = $titleFont
$form.Controls.Add($lblExclude)

$yPos += 25

$txtExclude = New-Object System.Windows.Forms.TextBox
$txtExclude.Location = New-Object System.Drawing.Point(20, $yPos)
$txtExclude.Size = New-Object System.Drawing.Size(560, 25)
$txtExclude.Font = $labelFont
$txtExclude.Text = ''
$form.Controls.Add($txtExclude)

$yPos += 40

# ============ Preserve Folder Structure Checkbox ============
$chkPreserveStructure = New-Object System.Windows.Forms.CheckBox
$chkPreserveStructure.Location = New-Object System.Drawing.Point(20, $yPos)
$chkPreserveStructure.Size = New-Object System.Drawing.Size(560, 25)
$chkPreserveStructure.Text = 'Preserve folder structure (recreate subfolders in destination)'
$chkPreserveStructure.Font = $labelFont
$chkPreserveStructure.Checked = $false
$form.Controls.Add($chkPreserveStructure)

$yPos += 35

# ============ Copy Button ============
$btnCopy = New-Object System.Windows.Forms.Button
$btnCopy.Location = New-Object System.Drawing.Point(20, $yPos)
$btnCopy.Size = New-Object System.Drawing.Size(560, 35)
$btnCopy.Text = 'Copy Files'
$btnCopy.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$btnCopy.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$btnCopy.ForeColor = [System.Drawing.Color]::White
$btnCopy.FlatStyle = 'Flat'
$form.Controls.Add($btnCopy)

$yPos += 45

# ============ Output Log ============
$lblLog = New-Object System.Windows.Forms.Label
$lblLog.Location = New-Object System.Drawing.Point(20, $yPos)
$lblLog.Size = New-Object System.Drawing.Size(560, 20)
$lblLog.Text = 'Output Log:'
$lblLog.Font = $titleFont
$form.Controls.Add($lblLog)

$yPos += 25

$txtLog = New-Object System.Windows.Forms.TextBox
$txtLog.Location = New-Object System.Drawing.Point(20, $yPos)
$txtLog.Size = New-Object System.Drawing.Size(560, 100)
$txtLog.Multiline = $true
$txtLog.ScrollBars = 'Vertical'
$txtLog.ReadOnly = $true
$txtLog.Font = New-Object System.Drawing.Font("Consolas", 8)
$txtLog.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)
$form.Controls.Add($txtLog)

# ============ Browse Button Events ============
$btnBrowseSource.Add_Click({
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderBrowser.Description = "Select the source folder to search"
    $folderBrowser.ShowNewFolderButton = $false
    
    if ($folderBrowser.ShowDialog() -eq 'OK') {
        $txtSource.Text = $folderBrowser.SelectedPath
    }
})

$btnBrowseDestination.Add_Click({
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderBrowser.Description = "Select the destination folder"
    $folderBrowser.ShowNewFolderButton = $true
    
    if ($folderBrowser.ShowDialog() -eq 'OK') {
        $txtDestination.Text = $folderBrowser.SelectedPath
    }
})

# ============ Helper Function to Write to Log ============
function Write-Log {
    param([string]$Message)
    $txtLog.AppendText("$Message`r`n")
    $txtLog.SelectionStart = $txtLog.Text.Length
    $txtLog.ScrollToCaret()
    $txtLog.Refresh()
    [System.Windows.Forms.Application]::DoEvents()
}

# ============ Copy Button Event ============
$btnCopy.Add_Click({
    # Clear log
    $txtLog.Clear()
    
    # Validate inputs
    $extension = $txtExtension.Text.Trim()
    $sourceFolder = $txtSource.Text.Trim()
    $destFolder = $txtDestination.Text.Trim()
    $folderPrefix = $txtPrefix.Text.Trim()
    $excludePatterns = $txtExclude.Text.Trim()
    
    if ([string]::IsNullOrWhiteSpace($extension)) {
        Write-Log "ERROR: Please enter a file extension"
        [System.Windows.Forms.MessageBox]::Show("Please enter a file extension (e.g., .txt)", "Error", 'OK', 'Error')
        return
    }
    
    if ([string]::IsNullOrWhiteSpace($sourceFolder) -or -not (Test-Path -Path $sourceFolder)) {
        Write-Log "ERROR: Source folder is invalid or doesn't exist"
        [System.Windows.Forms.MessageBox]::Show("Please select a valid source folder", "Error", 'OK', 'Error')
        return
    }
    
    if ([string]::IsNullOrWhiteSpace($destFolder)) {
        Write-Log "ERROR: Please specify a destination folder"
        [System.Windows.Forms.MessageBox]::Show("Please select a destination folder", "Error", 'OK', 'Error')
        return
    }
    
    # Ensure extension starts with a dot
    if (-not $extension.StartsWith('.')) {
        $extension = ".$extension"
    }
    
    # Create destination folder if it doesn't exist
    if (-not (Test-Path -Path $destFolder)) {
        Write-Log "Creating destination folder: $destFolder"
        New-Item -ItemType Directory -Path $destFolder -Force | Out-Null
    }
    
    Write-Log "=========================================="
    Write-Log "File Copier Started"
    Write-Log "=========================================="
    Write-Log "Extension: $extension"
    Write-Log "Source: $sourceFolder"
    Write-Log "Destination: $destFolder"
    
    if (-not [string]::IsNullOrWhiteSpace($folderPrefix)) {
        Write-Log "Folder Prefix Filter: $folderPrefix"
    }
    
    if (-not [string]::IsNullOrWhiteSpace($excludePatterns)) {
        Write-Log "Exclude Patterns: $excludePatterns"
    }
    
    Write-Log "=========================================="
    Write-Log ""
    
    # Disable button during operation
    $btnCopy.Enabled = $false
    $btnCopy.Text = "Copying..."
    
    try {
        # Parse exclude patterns
        $excludeList = @()
        if (-not [string]::IsNullOrWhiteSpace($excludePatterns)) {
            $excludeList = $excludePatterns -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
        }
        
        # Get all files with the extension
        $allFiles = @()
        
        if ([string]::IsNullOrWhiteSpace($folderPrefix)) {
            # No prefix filter - search all folders
            Write-Log "Searching for *$extension files in all folders..."
            $allFiles = Get-ChildItem -Path $sourceFolder -Filter "*$extension" -Recurse -File -ErrorAction SilentlyContinue
        } else {
            # Search only in folders with the specified prefix
            Write-Log "Searching for folders starting with '$folderPrefix'..."
            $filteredFolders = Get-ChildItem -Path $sourceFolder -Directory -Recurse -ErrorAction SilentlyContinue | 
                               Where-Object { $_.Name -like "$folderPrefix*" }
            
            if ($filteredFolders.Count -eq 0) {
                Write-Log "No folders found with prefix '$folderPrefix'"
            } else {
                Write-Log "Found $($filteredFolders.Count) folder(s) with prefix '$folderPrefix'"
                Write-Log "Searching for *$extension files in these folders..."
                
                foreach ($folder in $filteredFolders) {
                    $filesInFolder = Get-ChildItem -Path $folder.FullName -Filter "*$extension" -Recurse -File -ErrorAction SilentlyContinue
                    $allFiles += $filesInFolder
                }
            }
        }
        
        # Apply exclude patterns
        if ($excludeList.Count -gt 0) {
            Write-Log "Applying exclude patterns..."
            $beforeCount = $allFiles.Count
            $allFiles = $allFiles | Where-Object {
                $filePath = $_.FullName
                $shouldExclude = $false
                foreach ($pattern in $excludeList) {
                    if ($filePath -like "*\$pattern\*" -or $filePath -like "*\$pattern") {
                        $shouldExclude = $true
                        break
                    }
                }
                -not $shouldExclude
            }
            $excludedCount = $beforeCount - $allFiles.Count
            Write-Log "Excluded $excludedCount file(s) based on patterns"
        }
        
        Write-Log ""
        
        if ($allFiles.Count -eq 0) {
            Write-Log "No files found matching criteria"
            [System.Windows.Forms.MessageBox]::Show("No files found matching the criteria", "Complete", 'OK', 'Information')
        } else {
            Write-Log "Found $($allFiles.Count) file(s) to copy"
            Write-Log ""
            
            $preserveStructure = $chkPreserveStructure.Checked
            if ($preserveStructure) {
                Write-Log "Preserving folder structure"
                Write-Log ""
            }
            
            $copiedCount = 0
            $errorCount = 0
            
            foreach ($file in $allFiles) {
                try {
                    if ($preserveStructure) {
                        # Calculate relative path from source folder
                        $relativePath = $file.FullName.Substring($sourceFolder.Length).TrimStart('\')
                        $relativeDir = Split-Path -Path $relativePath -Parent
                        
                        # Create destination subfolder if needed
                        if (-not [string]::IsNullOrWhiteSpace($relativeDir)) {
                            $destSubFolder = Join-Path -Path $destFolder -ChildPath $relativeDir
                            if (-not (Test-Path -Path $destSubFolder)) {
                                New-Item -ItemType Directory -Path $destSubFolder -Force | Out-Null
                            }
                            $finalDest = Join-Path -Path $destSubFolder -ChildPath $file.Name
                        } else {
                            $finalDest = Join-Path -Path $destFolder -ChildPath $file.Name
                        }
                        
                        Copy-Item -Path $file.FullName -Destination $finalDest -Force
                        $copiedCount++
                        Write-Log "[$copiedCount/$($allFiles.Count)] Copied: $relativePath"
                    } else {
                        # Flat copy - all files go directly to destination
                        Copy-Item -Path $file.FullName -Destination $destFolder -Force
                        $copiedCount++
                        Write-Log "[$copiedCount/$($allFiles.Count)] Copied: $($file.Name)"
                    }
                } catch {
                    $errorCount++
                    Write-Log "ERROR copying $($file.Name): $_"
                }
            }
            
            Write-Log ""
            Write-Log "=========================================="
            Write-Log "Copy Complete!"
            Write-Log "Successfully copied: $copiedCount file(s)"
            if ($errorCount -gt 0) {
                Write-Log "Errors: $errorCount file(s)"
            }
            Write-Log "=========================================="
            
            [System.Windows.Forms.MessageBox]::Show("Successfully copied $copiedCount file(s)", "Complete", 'OK', 'Information')
        }
    } catch {
        Write-Log ""
        Write-Log "FATAL ERROR: $_"
        [System.Windows.Forms.MessageBox]::Show("An error occurred: $_", "Error", 'OK', 'Error')
    } finally {
        # Re-enable button
        $btnCopy.Enabled = $true
        $btnCopy.Text = "Copy Files"
    }
})

# Show the form
[void]$form.ShowDialog()