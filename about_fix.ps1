$content = [System.IO.File]::ReadAllText("d:\groww\car\about.html", [System.Text.Encoding]::UTF8)

# 1. Move stats block
$statsBlockRegex = '(?s)\s*<!-- SECTION 5: STATS -->\s*<section class="about-section stats-section">.*?</section>'
$philosophyRegex = '<!-- SECTION 2: PHILOSOPHY -->'

if ($content -match $statsBlockRegex) {
    $statsBlock = $matches[0]
    $content = $content -replace $statsBlockRegex, ''
    $content = $content -replace $philosophyRegex, "$statsBlock`n`n    $philosophyRegex"
}

# 2. Fix Light Mode visibility
$oldHeroTitle = '(?s)\.hero-title\s*\{\s*background: linear-gradient\(to bottom, var\(--text-primary\) 0%, var\(--accent\) 100%\) !important;\s*-webkit-background-clip: text !important;\s*color: transparent !important;\s*text-shadow: none !important;\s*\}'

$newHeroTitle = '.hero-title {
            background: none !important;
            -webkit-text-fill-color: initial !important;
            -webkit-background-clip: initial !important;
            color: #000 !important;
            text-shadow: 0 4px 15px rgba(0,0,0,0.15) !important;
        }'

$content = $content -replace $oldHeroTitle, $newHeroTitle

$darkHeroTitle = '(?s)body\.dark-mode \.hero-title\s*\{\s*background: linear-gradient\(to bottom, #fff 40%, var\(--accent\) 100%\) !important;\s*-webkit-background-clip: text !important;\s*\}'
$darkHeroTitleNew = 'body.dark-mode .hero-title {
            background: linear-gradient(to bottom, #fff 40%, var(--accent) 100%) !important;
            -webkit-background-clip: text !important;
            -webkit-text-fill-color: transparent !important;
            color: transparent !important;
            text-shadow: none !important;
        }'
$content = $content -replace $darkHeroTitle, $darkHeroTitleNew

$content = $content -replace '<p style="font-size: 1\.25rem; color: var\(--text-black\);', '<p style="font-size: 1.25rem; color: #000; font-weight: 500;'

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("d:\groww\car\about.html", $content, $utf8NoBom)
Write-Host "Task 12 completed successfully."
