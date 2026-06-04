import os
import re

files_to_update = [
    "index.html", "service.html", "about.html", "pricing.html", 
    "booking.html", "contact.html", "home2.html"
]

base_dir = r"d:\groww\car"

old_text = """        .brand-name {
            font-size: 1.45rem;
            font-weight: 500;
            letter-spacing: -0.3px;
            background: linear-gradient(135deg, #1e2a3a, var(--accent));
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
        }"""

new_text = """        .brand-name {
            font-size: 1.45rem;
            font-weight: 500;
            letter-spacing: -0.3px;
            background: linear-gradient(135deg, #1e2a3a, var(--accent));
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
        }
        body.dark-mode .brand-name {
            background: linear-gradient(135deg, #ffffff, var(--accent));
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
        }"""

for filename in files_to_update:
    filepath = os.path.join(base_dir, filename)
    if os.path.exists(filepath):
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # We can just replace the block exactly
        if old_text in content:
            content = content.replace(old_text, new_text)
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"Updated {filename}")
        else:
            print(f"Skipped {filename} - text not found exactly. Using regex fallback.")
            # Fallback regex if spacing differs
            content = re.sub(
                r"(\.brand-name\s*\{[^}]*background:\s*linear-gradient[^}]*color:\s*transparent;\s*\})",
                r"\1\n        body.dark-mode .brand-name {\n            background: linear-gradient(135deg, #ffffff, var(--accent));\n            background-clip: text;\n            -webkit-background-clip: text;\n            color: transparent;\n        }",
                content
            )
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"Regex Updated {filename}")
