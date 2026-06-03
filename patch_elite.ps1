$path = "d:\groww\car\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# First, restore the accidentally deleted lines if they are missing
if ($content -notmatch 'body\.light-mode \.fleet-content \{') {
    $fix = '        body.light-mode .fleet-card {
            background: var(--bg-secondary);
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        body.light-mode .fleet-content {
            background: linear-gradient(to top, var(--bg-secondary) 0%, rgba(255,255,255,0.9) 70%, transparent 100%);
        }

        body.light-mode .fleet-content h3, 
        body.light-mode .fleet-content p,
        body.light-mode .fleet-content a,
        body.light-mode .fleet-content span {
            color: var(--text-primary) !important;
        }

        body.light-mode .stats-strip {
            background: var(--bg-secondary);'

    $content = $content -replace '        body\.light-mode \.fleet-card \{\s*background: var\(--bg-secondary\);\s*box-shadow: 0 10px 30px rgba\(0,0,0,0\.05\);\s*\}\s*border-color: rgba\(0,0,0,0\.05\);\s*\}', $fix
}

# Also ensure "Elite Collection" span above the grid is visible in light mode.
$eliteSpan = '<span style="color: var(--accent); font-weight: 500; text-transform: uppercase; letter-spacing: 4px;">Elite Collection</span>'
$newEliteSpan = '<span style="color: var(--text-primary); font-weight: 500; text-transform: uppercase; letter-spacing: 4px;">Elite Collection</span>'
$content = $content -replace [regex]::Escape($eliteSpan), $newEliteSpan

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($path, $content, $utf8NoBom)
Write-Host "Restored and updated."
