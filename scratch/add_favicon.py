import os

favicon_tag = '    <link rel="icon" type="image/svg+xml" href="images/favicon.svg">\n'

for filename in os.listdir('.'):
    if filename.endswith('.html'):
        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()
        
        if 'images/favicon.svg' not in content:
            # Find the end of the <title> tag
            title_end = content.find('</title>')
            if title_end != -1:
                title_end += len('</title>')
                new_content = content[:title_end] + '\n' + favicon_tag + content[title_end:]
                with open(filename, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                print(f"Updated {filename}")
            else:
                print(f"Could not find title tag in {filename}")
        else:
            print(f"Favicon already exists in {filename}")
