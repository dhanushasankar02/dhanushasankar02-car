$files = Get-ChildItem -Path "d:\groww\car" -Filter "*.html" -File

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)

    # Replace all font-weights >= 600 and "bold" with 500
    $content = $content -replace 'font-weight:\s*900', 'font-weight: 500'
    $content = $content -replace 'font-weight:\s*800', 'font-weight: 500'
    $content = $content -replace 'font-weight:\s*700', 'font-weight: 500'
    $content = $content -replace 'font-weight:\s*600', 'font-weight: 500'
    $content = $content -replace 'font-weight:\s*bold', 'font-weight: 500'
    $content = $content -replace 'font-weight="bold"', 'font-weight="500"'

    # Fix booking.html
    if ($file.Name -eq "booking.html") {
        # Client spotlight avatars
        $content = $content -replace '<div class="client-avatar"></div>', '<div class="client-avatar">AR</div>'
        $content = $content -replace '<div class="client-avatar" style="background: #3498db;"></div>', '<div class="client-avatar" style="background: #3498db;">SM</div>'
        $content = $content -replace '<div class="client-avatar" style="background: #2ecc71;"></div>', '<div class="client-avatar" style="background: #2ecc71;">JL</div>'

        # Client spotlight CSS
        $avatarCssRegex = '(?s)\.client-avatar \{.*?\}'
        $newAvatarCss = '.client-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-weight: 500;
            font-size: 1.2rem;
        }'
        $content = $content -replace $avatarCssRegex, $newAvatarCss

        $storyCardCssRegex = '(?s)\.story-card \{[^\}]*?\}'
        $newStoryCardCss = '.story-card {
            flex: 0 0 400px;
            background: var(--card-bg);
            padding: 2.5rem;
            border-radius: 2rem;
            border: 1px solid var(--border-light);
            text-align: center;
        }'
        $content = $content -replace $storyCardCssRegex, $newStoryCardCss

        $clientInfoRegex = '(?s)\.client-info \{[^\}]*?\}'
        $newClientInfo = '.client-info {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
            text-align: left;
        }'
        $content = $content -replace $clientInfoRegex, $newClientInfo
    }

    # Fix contact.html
    if ($file.Name -eq "contact.html") {
        # Hero subtext light mode visibility
        $heroPRegex = '(?s)\.hero-title-group p \{[^\}]*?\}'
        $newHeroP = '.hero-title-group p {
            font-size: 1.2rem;
            color: #ffffff;
            text-shadow: 0 2px 4px rgba(0,0,0,0.8);
            max-width: 600px;
            margin: 0 auto;
        }'
        $content = $content -replace $heroPRegex, $newHeroP

        # Direct Channels section header
        if ($content -notmatch '\.section-header \{') {
            $content = $content -replace '/\* 5\. DEPARTMENT DIRECTORY', ".section-header { text-align: center; margin-bottom: 3rem; }`n`n        /* 5. DEPARTMENT DIRECTORY"
        }

        # Add proper call icon to Direct Channels
        $content = $content -replace '<div class="dept-card">', '<div class="dept-card" style="text-align: center;">'
        $content = $content -replace '<p style="font-weight: 500; margin-top: 1rem;">sales@velocity.com</p>', '<p style="font-weight: 500; margin-top: 1rem;"><i class="fas fa-phone-alt" style="margin-right: 8px; color: var(--accent);"></i>+1 555-0101</p><p style="font-weight: 500; margin-top: 0.5rem;"><i class="fas fa-envelope" style="margin-right: 8px; color: var(--accent);"></i>sales@velocity.com</p>'
        $content = $content -replace '<p style="font-weight: 500; margin-top: 1rem;">support@velocity.com</p>', '<p style="font-weight: 500; margin-top: 1rem;"><i class="fas fa-phone-alt" style="margin-right: 8px; color: var(--accent);"></i>+1 555-0102</p><p style="font-weight: 500; margin-top: 0.5rem;"><i class="fas fa-envelope" style="margin-right: 8px; color: var(--accent);"></i>support@velocity.com</p>'
        $content = $content -replace '<p style="font-weight: 500; margin-top: 1rem;">press@velocity.com</p>', '<p style="font-weight: 500; margin-top: 1rem;"><i class="fas fa-phone-alt" style="margin-right: 8px; color: var(--accent);"></i>+1 555-0103</p><p style="font-weight: 500; margin-top: 0.5rem;"><i class="fas fa-envelope" style="margin-right: 8px; color: var(--accent);"></i>press@velocity.com</p>'
        $content = $content -replace '<p style="font-weight: 500; margin-top: 1rem;">vip@velocity.com</p>', '<p style="font-weight: 500; margin-top: 1rem;"><i class="fas fa-phone-alt" style="margin-right: 8px; color: var(--accent);"></i>+1 555-0104</p><p style="font-weight: 500; margin-top: 0.5rem;"><i class="fas fa-envelope" style="margin-right: 8px; color: var(--accent);"></i>vip@velocity.com</p>'

        # Final split section alignment
        $splitRegex = '(?s)\.final-split-section \{[^\}]*?\}'
        $newSplit = '.final-split-section {
            max-width: 1200px;
            margin: 4rem auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            padding: 4rem 2rem;
            border-top: 1px solid var(--border-light);
            box-sizing: border-box;
            max-width: 100%;
            align-items: center;
        }'
        $content = $content -replace $splitRegex, $newSplit
    }

    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
}

Write-Host "All files processed."
