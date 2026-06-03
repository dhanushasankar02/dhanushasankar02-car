$files = Get-ChildItem -Path "d:\groww\car" -Filter *.html

foreach ($file in $files) {
    # Read as UTF8
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    # Task 6: Nav bar- remove the home icon in the home menu option and provide home dropdown icon
    $content = $content -replace '<a href="index\.html"><i class="fas fa-home"></i> Home</a>', '<a href="index.html">Home <i class="fas fa-chevron-down" style="font-size: 0.8em; margin-left: 5px;"></i></a>'
    
    # Task 7: Nav bar- brand color should be consistent in light and dark mode
    $content = $content -replace '(?s)\s*body\.dark-mode \.brand-name\s*\{[^}]*\}', ''
    $content = $content -replace '(?s)\s*\.dark \.brand-name\s*\{[^}]*\}', ''
    
    # Write back as UTF8 without BOM
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
}
Write-Host "Task 6 and 7 completed."
