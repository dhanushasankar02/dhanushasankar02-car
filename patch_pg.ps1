$content = [System.IO.File]::ReadAllText("d:\groww\car\pricing.html", [System.Text.Encoding]::UTF8)

# 1. Move stats block (6. GROWTH STATS) to 2nd section
$statsRegex = '(?s)\s*<!-- 6\. GROWTH STATS -->\s*<div class="growth-strip">.*?</div>'
$tierCardsRegex = '<!-- 2\. TIER CARDS \(INDUSTRIAL REDESIGN\) -->'

if ($content -match $statsRegex) {
    $statsBlock = $matches[0]
    $content = $content -replace $statsRegex, ''
    $content = $content -replace $tierCardsRegex, "$statsBlock`n`n    $tierCardsRegex"
}

# 2. Add proper .cta-btn CSS and replace h2-btn
$ctaCss = '.cta-btn {
            display: inline-block;
            margin-top: 1rem;
            padding: 1.2rem 3rem;
            background: var(--accent);
            color: #000;
            font-weight: 800;
            text-decoration: none;
            border-radius: 50px;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
            border: 2px solid var(--accent);
            text-align: center;
        }
        .cta-btn:hover {
            transform: scale(1.05);
            background: transparent;
            color: var(--accent);
        }'

$content = $content -replace '        /\* 2\. Tier Cards - Redesigned \*/', "$ctaCss`n`n        /* 2. Tier Cards - Redesigned */"

# Replace the links in the tier cards
$content = $content -replace '<a href="#" class="h2-btn" style="display: block; text-align: center; text-decoration: none;">Initialize</a>', '<a href="#" class="cta-btn" style="display: block; text-align: center; text-decoration: none; width: 100%;">Initialize</a>'
$content = $content -replace '<a href="#" class="h2-btn" style="display: block; text-align: center; text-decoration: none; border-color: #000; color: #000;">Select Elite</a>', '<a href="#" class="cta-btn" style="display: block; text-align: center; text-decoration: none; width: 100%;">Select Elite</a>'
$content = $content -replace '<a href="#" class="h2-btn" style="display: block; text-align: center; text-decoration: none;">Consult</a>', '<a href="#" class="cta-btn" style="display: block; text-align: center; text-decoration: none; width: 100%;">Consult</a>'

# Fix Light mode hover contrast for cta-btn and featured card
$lightModeCss = 'body.light-mode .cta-btn:hover {
            background: transparent;
            color: var(--accent);
        }
        body.light-mode .tier-card.featured .cta-btn {
            background: #000;
            color: #fff;
            border-color: #000;
        }
        body.light-mode .tier-card.featured .cta-btn:hover {
            background: transparent;
            color: #000;
        }'
$content = $content -replace '        body\.light-mode \.tier-card \{', "$lightModeCss`n        body.light-mode .tier-card {"

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("d:\groww\car\pricing.html", $content, $utf8NoBom)
Write-Host "Pricing completed"

# Gallery
$content2 = [System.IO.File]::ReadAllText("d:\groww\car\gallery.html", [System.Text.Encoding]::UTF8)

# Add 2 images to macro-grid
$macroRegex = '(?s)(<div class="macro-grid">.*?)(\s*</div>\s*</div>\s*</section>)'
if ($content2 -match $macroRegex) {
    $newGrid = $matches[1] + "`n                <div class=`"macro-item`"><img src=`"images/hero_supercar_night.png`" alt=`"Macro 7`"></div>`n                <div class=`"macro-item`"><img src=`"images/hero.png`" alt=`"Macro 8`"></div>" + $matches[2]
    $content2 = $content2 -replace $macroRegex, $newGrid
}

# Task 15: Velocity in Motion section image size should be similar
$motionRowCss = '(?s)\.motion-row \{.*?\}'
$newMotionRowCss = '.motion-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2rem;
            padding-bottom: 2rem;
        }'
$content2 = $content2 -replace $motionRowCss, $newMotionRowCss

$motionItemCss = '(?s)\.motion-item \{.*?\}'
$newMotionItemCss = '.motion-item {
            width: 100%;
            height: 350px;
            background: var(--bg-secondary);
            overflow: hidden;
            border-radius: 12px;
        }'
$content2 = $content2 -replace $motionItemCss, $newMotionItemCss

# Ensure media queries handle the new grid
$mediaQueryPatch = '(?s)\.motion-item \{ min-width: 300px; height: 250px; \}'
$newMediaQueryPatch = '.motion-row { grid-template-columns: repeat(2, 1fr); } .motion-item { height: 250px; min-width: auto; }'
$content2 = $content2 -replace $mediaQueryPatch, $newMediaQueryPatch

$mediaQueryPatch2 = '(?s)\.motion-item \{ min-width: 250px; \}'
$newMediaQueryPatch2 = '.motion-row { grid-template-columns: 1fr; } .motion-item { min-width: auto; }'
$content2 = $content2 -replace $mediaQueryPatch2, $newMediaQueryPatch2

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("d:\groww\car\gallery.html", $content2, $utf8NoBom)
Write-Host "Gallery completed"
