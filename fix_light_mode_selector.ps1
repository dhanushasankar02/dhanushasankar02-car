$files = Get-ChildItem -Path "d:\groww\car" -Filter "*.html"

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    if ($content -match 'body\.light-mode') {
        $content = $content -replace 'body\.light-mode', 'body:not(.dark-mode)'
        $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
        [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
        Write-Host "Updated $($file.Name)"
    }
}
Write-Host "Done globally replacing body.light-mode"
