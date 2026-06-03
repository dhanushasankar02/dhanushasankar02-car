$content = [System.IO.File]::ReadAllText("d:\groww\car\index.html", [System.Text.Encoding]::UTF8)

$find1 = '(?s)<div style="display: flex; align-items: center; gap: 1\.5rem;">\s*<div>\s*<strong style="display: block;">Alexander Thorne</strong>\s*<span style="font-size: 0\.8rem; color: var\(--accent\); text-transform: uppercase;">Tech Entrepreneur</span>\s*</div>\s*</div>'
$replace1 = '<div style="text-align: right;"><strong style="display: block;">Alexander Thorne</strong><span style="font-size: 0.8rem; color: var(--accent); text-transform: uppercase;">Tech Entrepreneur</span></div>'

$find2 = '(?s)<div style="display: flex; align-items: center; gap: 1\.5rem;">\s*<div>\s*<strong style="display: block;">Helena Rossi</strong>\s*<span style="font-size: 0\.8rem; color: var\(--accent\); text-transform: uppercase;">F1 Pilot</span>\s*</div>\s*</div>'
$replace2 = '<div style="text-align: right;"><strong style="display: block;">Helena Rossi</strong><span style="font-size: 0.8rem; color: var(--accent); text-transform: uppercase;">F1 Pilot</span></div>'

$content = $content -replace $find1, $replace1
$content = $content -replace $find2, $replace2

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("d:\groww\car\index.html", $content, $utf8NoBom)
Write-Host "Task 11 completed successfully."
