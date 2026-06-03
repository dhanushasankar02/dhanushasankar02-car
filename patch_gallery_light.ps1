$path = "d:\groww\car\gallery.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# Add explicit light mode text colors for the Global Expeditions ("View Collection") section
if ($content -notmatch 'body\.light-mode \.exp-card') {
    $fix = '        /* Light Mode Visibility Fixes */
        body.light-mode .exp-card h2,
        body.light-mode .exp-card p,
        body.light-mode .exp-card span,
        body.light-mode .exp-card .login-btn {
            color: var(--text-primary) !important;
        }
        body.light-mode .series-overlay h2,
        body.light-mode .series-overlay span {
            color: #fff !important; /* Ensure it stays white on images */
            text-shadow: 0 2px 8px rgba(0,0,0,0.8);
        }
        body.light-mode .parallax-horizon h2 {
            color: #fff !important;
            text-shadow: 0 4px 12px rgba(0,0,0,0.8);
        }'
    
    $content = $content -replace '        /\* Breakpoint: 480px \*/', "$fix`n`n        /* Breakpoint: 480px */"
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($path, $content, $utf8NoBom)
Write-Host "Gallery light mode fixes applied."
