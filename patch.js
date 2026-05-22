const fs = require('fs');
const path = require('path');

const dir = 'd:\\car';
const files = fs.readdirSync(dir).filter(f => f.endsWith('.html') && f !== 'index.html');

const injection = `        /* ----- FULL MOBILE RESPONSIVENESS SUITE ----- */
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

        /* Breakpoint: 1024px */`;

for (const file of files) {
    const filePath = path.join(dir, file);
    let content = fs.readFileSync(filePath, 'utf8');
    
    // Check if already injected
    if (!content.includes('/* ----- FULL MOBILE RESPONSIVENESS SUITE ----- */')) {
        content = content.replace('        /* Breakpoint: 1024px */', injection);
        fs.writeFileSync(filePath, content, 'utf8');
        console.log(`Patched ${file}`);
    } else {
        console.log(`Skipped ${file}`);
    }
}
