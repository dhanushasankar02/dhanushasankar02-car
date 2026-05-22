$dir = "d:\car"
$files = Get-ChildItem -Path $dir -Filter "*.html" | Where-Object { $_.Name -ne "index.html" }

$injection = @"
        /* ----- FULL MOBILE RESPONSIVENESS SUITE ----- */
        /* Prevent horizontal scrolling and force internal bounding */
        html, body {
            overflow-x: hidden;
            box-sizing: border-box;
            max-width: 100%;
        }

        img, video, canvas, svg {
            max-width: 100%;
            height: auto;
            box-sizing: border-box;
        }

        /* Breakpoint: 1024px */
"@

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    if (-not $content.Contains("/* ----- FULL MOBILE RESPONSIVENESS SUITE ----- */")) {
        $content = $content -replace "\s*/\*\s*Breakpoint: 1024px\s*\*/", "`r`n$injection"
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Patched $($file.Name)"
    } else {
        Write-Host "Skipped $($file.Name)"
    }
}
