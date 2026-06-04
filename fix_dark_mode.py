import os
import glob

old_text = """            // Init Dark Mode: Always default to light mode on page load as requested
            // But we check localStorage if we want to allow persistence.
            // The user said "every page keep the light mood constantly".
            // To be safe, we will NOT load from localStorage on init.
            // This ensures every page starts light.
            updateDarkIcons(false);"""

new_text = """            // Init Dark Mode: Check localStorage for persistence across pages
            const savedTheme = localStorage.getItem('velocity-theme');
            if (savedTheme === 'dark') {
                body.classList.add('dark-mode');
                updateDarkIcons(true);
            } else {
                body.classList.remove('dark-mode');
                updateDarkIcons(false);
            }"""

html_files = glob.glob('*.html')
for file in html_files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if old_text in content:
        content = content.replace(old_text, new_text)
        with open(file, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f'Updated {file}')
