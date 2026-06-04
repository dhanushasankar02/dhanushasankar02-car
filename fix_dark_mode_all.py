import os
import glob
import re

new_text = """            // Init Dark Mode: Check localStorage for persistence across pages
            const savedTheme = localStorage.getItem('velocity-theme');
            if (savedTheme === 'dark') {
                document.body.classList.add('dark-mode');
                updateDarkIcons(true);
            } else {
                document.body.classList.remove('dark-mode');
                updateDarkIcons(false);
            }"""

# A regex to match the various forms of the hardcoded init
pattern = re.compile(r'(//\s*Init Dark Mode:\s*Always default to light mode on page load as requested|//\s*Always default to light mode on page load as requested)\s*updateDarkIcons\(false\);')

html_files = glob.glob('*.html')
for file in html_files:
    if file == 'index.html':
        continue # Already done
        
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if pattern.search(content):
        # We need to make sure we don't accidentally replace the newly inserted logic if we run it multiple times.
        # But this regex only matches the old hardcoded version.
        content = pattern.sub(new_text, content)
        with open(file, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f'Updated {file}')
