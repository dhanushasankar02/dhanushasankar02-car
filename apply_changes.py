import os
import shutil
import re

# Source image paths
src_dir = r"C:\Users\ELCOT\.gemini\antigravity\brain\ed1c8ed1-1698-4f38-a31d-806174f5f0bc"
images = {
    "tint_installation.png": "tint_installation_1780569033620.png",
    "ppf_application.png": "ppf_application_1780569047335.png",
    "ceramic_coating.png": "ceramic_coating_1780569061439.png",
    "mobile_service.png": "mobile_service_1780569076204.png",
    "before_after_tint.png": "before_after_tint_1780569096701.png"
}

dest_dir = r"d:\groww\car\images"

for dest_name, src_name in images.items():
    src_path = os.path.join(src_dir, src_name)
    dest_path = os.path.join(dest_dir, dest_name)
    if os.path.exists(src_path):
        shutil.copy(src_path, dest_path)
        print(f"Copied {src_name} to {dest_name}")
    else:
        print(f"Warning: {src_path} not found.")

def update_file(filepath, replacements):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    for old, new in replacements:
        content = re.sub(old, new, content)
        
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Updated {filepath}")

index_replacements = [
    # Hero
    (r"Precision Engineering • Pure Adrenaline", r"Precision Protection • Pure Preservation"),
    (r"Explore The Fleet", r"Explore Our Services"),
    
    # Fleet / Services
    (r"Elite Collection", r"Elite Protection"),
    (r"Masterpieces In Motion", r"Ultimate Surface Defense"),
    
    # Fleet Card 1 (Tinting)
    (r"images/fleet_1\.png", r"images/tint_installation.png"),
    (r"HYPERCAR SERIES", r"PREMIUM WINDOW TINTING"),
    (r"V1 Dominator", r"UV & Heat Rejection"),
    (r"A carbon-fiber heart beating with 1,200HP\. Redefining what's possible on four wheels\.", r"Block 99% of harmful UV rays, reduce interior heat, and enhance privacy with our premium ceramic window tints."),
    (r"Configure Specs", r"View Tint Options"),
    
    # Fleet Card 2 (PPF)
    (r"images/fleet_2\.png", r"images/ppf_application.png"),
    (r"ELECTRIC FUTURE", r"PAINT PROTECTION FILM (PPF)"),
    (r"GT-Volt Apex", r"Invisible Armor Shield"),
    (r"Silent power\. Instant torque\. The first electric grand tourer that speaks to the soul\.", r"Protect your vehicle's paint from rock chips, scratches, and road debris with self-healing, crystal-clear PPF."),
    (r"View Journey", r"Protect Your Paint"),
    
    # Fleet Card 3 (Ceramic)
    (r"images/engineering\.png", r"images/ceramic_coating.png"),
    (r"CONCEPT LAB", r"CERAMIC COATINGS"),
    (r"Project X-Aero", r"Liquid Glass Gloss"),
    (r"A glimpse into the next decade\. Active aerodynamics that breathe with the wind\.", r"Achieve unmatched gloss, hydrophobicity, and long-lasting chemical resistance that makes maintenance effortless."),
    (r"Laboratory Notes", r"Explore Coatings"),
    
    # Bento Specs -> Premium Technology
    (r"NeuralDrive AI", r"Self-Healing Technology"),
    (r"Our proprietary AI adapts suspension, torque vectoring, and interior acoustics to your biometric state in real-time\.", r"Our premium PPF features self-healing top coats that make minor scratches and swirl marks disappear with heat."),
    
    (r"Atmospheric Control", r"Maximum Heat Rejection"),
    (r"Active aero components that adjust 100 times per second for perfect balance at any speed\.", r"Our nano-ceramic tints reject up to 98% of infrared heat, keeping your cabin cool and comfortable."),
    
    (r"800V Architecture", r"Hydrophobic Shield"),
    (r"Artisanal Finish", r"Flawless Prep & Polish"),
    (r"Interiors hand-stitched by master craftsmen using sustainably sourced aerospace materials\.", r"Every vehicle undergoes meticulous paint correction before any film or coating is applied for a perfect finish."),
    (r"Quantum Shield", r"Lifetime Warranties"),
    
    # Stats
    (r"Max Horsepower", r"UV Rays Blocked"),
    (r"Seconds \(0-100\)", r"Years Durability"),
    (r"Top Speed km/h", r"Heat Reduction"),
    (r"Global Patents", r"5-Star Reviews"),
    (r'data-val="1240"', r'data-val="99"'),
    (r'data-val="1\.82"', r'data-val="10"'),
    (r'data-val="435"', r'data-val="70"'),
    (r'data-val="28"', r'data-val="500"'),
    
    # Innovation -> Obsessed With Protection
    (r"Obsessed With <span style=\"color: var\(--accent\); font-style: italic;\">Perfection</span>", r"Obsessed With <span style=\"color: var(--accent); font-style: italic;\">Protection</span>"),
    (r"At Velocity, we don't follow trends\. We create the benchmarks that the industry chases\. Every curve is calculated, every stitch is intentional\.", r"At Velocity, we don't just wash cars. We preserve and protect your investment. Every detail is calculated, every film installation is intentional to ensure a flawless finish."),
    (r"Chassis", r"Mobile Service"),
    (r"Full carbon fiber monocoque for ultimate rigidity and lightness\.", r"We offer fully equipped mobile detailing and tinting services right at your driveway or office."),
    (r"Interface", r"Paint Correction"),
    (r"Holographic cockpit display with gesture-based controls\.", r"Multi-stage machine polishing to remove swirls and scratches before applying protection."),
    (r"Learn Our Process", r"Learn Our Process"),
    (r"images/hero\.png", r"images/mobile_service.png"),
    
    # Reviews
    (r"I've owned every major supercar on the market\. Nothing compares to the V1's ability to make you feel like the", r"I've trusted Velocity with my last three cars. The ceramic coating makes washing a breeze and the tint keeps the heat out perfectly!"),
    (r"Alexander Thorne", r"Michael Chang"),
    (r"Tech Entrepreneur", r"Tesla Model S Owner"),
    
    (r"The GT-Volt is a masterpiece of design\. It's the first time I've felt that luxury and sustainability weren't at odds, but rather perfectly synthesized\.", r"Their PPF installation is truly invisible. I had my entire front end protected and you can't even tell it's there. Absolute lifesaver against rock chips."),
    (r"Helena Rossi", r"Sarah Jenkins"),
    (r"F1 Pilot", r"Porsche 911 Owner"),
    
    # Footer
    (r"Redefining automotive passion with cutting-edge engineering and bespoke concierge services\. Drive the extraordinary\.", r"Redefining automotive care with cutting-edge paint protection, ceramic coatings, and premium window tinting. Preserve the extraordinary."),
    (r"Get exclusive offers and new model alerts\.", r"Get exclusive offers and new protection package alerts."),
]

service_replacements = [
    # Hero
    (r"Aero-Engineering Lab", r"Premium Protection Studio"),
    (r"Technical<br>Superiority", r"Ultimate<br>Defense"),
    (r"Redefining performance through computational fluid dynamics and bespoke mechanical refinement\.", r"Redefining preservation through advanced nanotechnology and bespoke paint protection applications."),
    
    # Competencies
    (r"Core Competencies", r"Our Specializations"),
    
    (r"ECU Optimization", r"Premium Window Tint"),
    (r"Custom fuel mapping and ignition timing for maximum efficiency and power output\.", r"Carbon and ceramic window tinting for ultimate UV protection, heat rejection, and privacy."),
    
    (r"Aero-Refinement", r"Paint Protection Film"),
    (r"Wind tunnel validation and carbon fiber aerodynamic package integration\.", r"Invisible, self-healing urethane film that protects your vehicle's impact zones from rock chips and scratches."),
    
    (r"Mechanical Bespoke", r"Ceramic Coatings"),
    (r"Complete drivetrain overhauls using aerospace-grade components\.", r"Liquid polymer coatings that bond with your paint to provide long-lasting gloss, hydrophobicity, and UV resistance."),
    
    (r"Telemetry - Suite", r"Mobile Detailing"),
    (r"Real-time data monitoring and remote diagnostics via our proprietary satellite link\.", r"Professional detailing, paint correction, and protection services brought directly to your home or office."),
    
    # Process
    (r"The Engineering Workflow", r"The Application Process"),
    (r"Diagnostic", r"Decontamination"),
    (r"Full digital scan and physical inspection\.", r"Thorough wash, clay bar, and iron removal to ensure a perfectly clean surface."),
    
    (r"Simulation", r"Paint Correction"),
    (r"CFD and digital stress testing models\.", r"Machine polishing to remove swirl marks, scratches, and restore true gloss."),
    
    (r"Refinement", r"Installation"),
    (r"Hand-crafted implementation \.", r"Precision installation of PPF, tint, or ceramic coating in a controlled environment."),
    
    (r"Validation", r"Curing & Inspection"),
    (r"Track testing and final calibration\.", r"Curing time and final quality control inspection under high-intensity lighting."),
    
    # Facilities
    (r"Global Centers", r"Our Facilities"),
    (r"Monaco Refinement Center", r"Velocity Detailing Studio"),
    (r"Specializing in classic restoration and luxury grand tourer tuning\.", r"Our climate-controlled, dust-free environment perfect for seamless PPF and tint installations."),
    (r"Dubai Performance Lab", r"Velocity Mobile Units"),
    (r"Our flagship facility for hypercar development\.", r"Fully equipped vans bringing our premium protection services to your location."),
    
    (r"Global Concierge<br>Support 24/7", r"Mobile Service<br>At Your Door"),
    (r"No matter where you are, our engineers are a click away\.", r"We bring the protection studio to you. Fully equipped for professional results on-site."),
    (r"Connect to Lab", r"Book Mobile Service"),
    
    # Case studies
    (r"Laboratory Journal", r"Protection Showcase"),
    (r"The 2\.0s Challenge", r"The Perfect Mirror Finish"),
    (r"How we reduced the 0-100 time of the V1 model by 0\.2s through thermal management and traction software logic\.", r"See how our multi-stage paint correction and 5-year ceramic coating restored a neglected black SUV to a flawless mirror finish."),
    (r"Read Whitepaper", r"View Gallery"),
    
    (r"Carbon Rebirth", r"Invisible Armor Integration"),
    (r"Restoring a classic prototype using modern 3D printing and original 1980s schematics\. A bridge between eras\.", r"A look at our custom bulk-install Paint Protection Film on a brand new supercar, wrapping all edges for a truly seamless and invisible shield."),
    (r"View Project", r"View Process"),
    
    # Form
    (r"Select Service", r"Select Service"),
    (r"ECU Tuning", r"Window Tinting"),
    (r"Aerodynamics", r"Paint Protection Film (PPF)"),
    (r"Full Restoration", r"Ceramic Coating"),
    (r"Maintenance", r"Paint Correction & Detailing"),
    
    (r"Initialize Request", r"Request Quote"),
    
    # Footer
    (r"Redefining automotive passion with cutting-edge engineering and bespoke concierge services\. Drive the extraordinary\.", r"Redefining automotive care with cutting-edge paint protection, ceramic coatings, and premium window tinting. Preserve the extraordinary."),
    (r"Get exclusive offers and new model alerts\.", r"Get exclusive offers and new protection package alerts."),
]

update_file(r"d:\groww\car\index.html", index_replacements)
update_file(r"d:\groww\car\service.html", service_replacements)
# Let's also do a global replacement for footer in other main pages
for page in ["about.html", "pricing.html", "booking.html", "contact.html", "home2.html"]:
    path = os.path.join(r"d:\groww\car", page)
    if os.path.exists(path):
        update_file(path, [
            (r"Redefining automotive passion with cutting-edge engineering and bespoke concierge services\. Drive the extraordinary\.", r"Redefining automotive care with cutting-edge paint protection, ceramic coatings, and premium window tinting. Preserve the extraordinary."),
            (r"Get exclusive offers and new model alerts\.", r"Get exclusive offers and new protection package alerts.")
        ])
