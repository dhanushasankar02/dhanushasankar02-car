$content = [System.IO.File]::ReadAllText("d:\groww\car\index.html", [System.Text.Encoding]::UTF8)

$statsBlockRegex = '(?s)\s*<!-- 4\. SPEED STATS: DYNAMIC COUNTERS -->\s*<div class="stats-strip">.*?</div>\s*</div>\s*</div>'
$fleetRegex = '<!-- 2\. THE FLEET: INTERACTIVE GRID -->'

if ($content -match $statsBlockRegex) {
    $statsBlock = $matches[0]
    $content = $content -replace $statsBlockRegex, ''
    
    $statsBlock = $statsBlock -replace '<span class="stat-num" data-val="([^"]+)">0</span>', '<div style="display: flex; justify-content: center; align-items: baseline; margin-bottom: 0.5rem;"><span class="stat-num" data-val="$1" style="margin-bottom: 0; display: inline-block;">0</span><span style="font-size: 4rem; font-weight: 950; color: var(--accent); line-height: 1; margin-left: 5px;">+</span></div>'
    
    $content = $content -replace $fleetRegex, "$statsBlock`n`n    $fleetRegex"
    
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText("d:\groww\car\index.html", $content, $utf8NoBom)
    Write-Host "Task 8 completed successfully."
} else {
    Write-Host "Could not find stats block."
}
