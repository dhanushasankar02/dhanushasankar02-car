import os
import re

def update_file(filepath, replacements):
    if not os.path.exists(filepath):
        return
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    for old, new in replacements:
        content = re.sub(old, new, content)
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Updated {filepath}")

pricing_replacements = [
    (r"Own the<br>Extraordinary\.", r"Premium<br>Protection."),
    (r"A membership for those who define the rules\.", r"Tailored packages for unmatched preservation and aesthetic enhancement."),
    (r"V-Entry", r"PREMIUM TINT"),
    (r"\$299<span>/mo</span>", r"$199<span>+</span>"),
    (r"The foundation of velocity\. Access to our signature fleet and member events\.", r"High-performance ceramic window tinting that blocks 99% UV and reduces interior heat."),
    (r"Standard Fleet Rotation", r"Carbon & Ceramic Options"),
    (r"1 Track Event Per Annum", r"99% UV Protection"),
    (r"Digital Service Logs", r"Lifetime Color-Stable Warranty"),
    (r"Global Home Delivery", r"Computer Cut Precision"),
    (r"Initialize", r"Book Tint"),
    
    (r"V-Elite", r"CERAMIC COATING"),
    (r"\$899<span>/mo</span>", r"$799<span>+</span>"),
    (r"Our most popular tier\. Full hypercar access and global concierge integration\.", r"Liquid glass protection for your vehicle's paint, offering extreme gloss and hydrophobicity."),
    (r"Hypercar Fleet Access", r"Multi-Stage Paint Correction"),
    (r"Global Home Delivery", r"5-Year Ceramic Coating"),
    (r"Private Garage Access", r"Extreme Hydrophobicity"),
    (r"Priority Maintenance", r"Annual Maintenance Wash"),
    (r"Select Elite", r"Book Ceramic"),
    
    (r"V-Infinity", r"FULL PPF WRAP"),
    (r"Custom", r"$4,500<span>+</span>"),
    (r"The ultimate automotive lifestyle\. Tailored to your global collection needs\.", r"The ultimate invisible armor. Complete protection against rock chips, scratches, and road debris."),
    (r"Unlimited Fleet Sourcing", r"Self-Healing Technology"),
    (r"Jet Terminal Handover", r"10-Year Film Warranty"),
    (r"Personal Mechanic Team", r"Seamless Edge Wrapping"),
    (r"Custom Commisions", r"Matte or Gloss Finish"),
    (r"Consult", r"Request Quote"),
    
    (r"The Tier Comparison", r"Protection Features"),
    (r"Access Feature", r"Feature"),
    (r"The Driver", r"Tint Packages"),
    (r"The Collector", r"Ceramic Packages"),
    (r"The Legend", r"PPF Packages"),
    
    (r"Fleet Selection", r"Primary Benefit"),
    (r"Premium Sports", r"Heat Rejection"),
    (r"Exotic & Hyper", r"Deep Gloss & Easy Wash"),
    (r"Unlimited / One-off", r"Impact & Scratch Defense"),
    
    (r"Global Transport", r"Durability"),
    (r"Regional", r"Lifetime"),
    (r"Continental", r"5-10 Years"),
    (r"Worldwide", r"10+ Years"),
    
    (r"images/fleet_2\.png", r"images/before_after_tint.png"),
    (r"Acquisition & Portfolio Management", r"Before & After: The Difference is Clear"),
    (r"Beyond membership, we offer complete automotive investment management\. From sourcing rare classics to managing the logistics of your private collection\.", r"Our premium window tints not only dramatically improve the aesthetic profile of your vehicle, but provide crucial defense against searing interior heat and harmful UV rays. See the difference our films make in glare reduction and privacy."),
    
    (r"Titanium Warranty", r"Lifetime Warranty"),
    (r"Comprehensive coverage for every machine rotation\.", r"Our premium tints and PPF come with a nationwide lifetime warranty."),
    (r"Jet Integration", r"Precision Cut"),
    (r"Private terminal car handover in over 50 global cities\.", r"We use advanced plotting software to ensure a perfect fit without cutting on your car."),
    (r"Enthusiast Gala", r"Certified Installers"),
    (r"Networking with the world's most successful collectors\.", r"Our technicians are factory-trained and certified in advanced application techniques."),
    (r"Immediate Start", r"Mobile Convenience"),
    (r"No waiting lists\. Your journey begins the moment you apply\.", r"Can't come to us? We offer mobile tinting and detailing at your location."),
    
    (r"Avg\. Portfolio Growth", r"UV Rays Blocked"),
    (r"Exclusive Models", r"Vehicles Protected"),
    (r"Client Satisfaction", r"Client Satisfaction"),
]

about_replacements = [
    (r"images/about_hero\.png", r"images/tint_installation.png"),
    (r"Engineering<br>The Impossible\.", r"Preserving<br>The Extraordinary."),
    (r"We don't just build cars\. We forge adrenaline, wrapping computational fluid dynamics in carbon fiber and soul\.", r"We are obsessed with automotive perfection. Our goal is to protect and preserve your vehicle's pristine condition through industry-leading films and coatings."),
    (r"The Genesis", r"Our Origin"),
    (r"Velocity was born from a singular frustration: the compromise between raw track performance and grand touring luxury\. Our founders, two aerospace engineers and a former F1 telemetry analyst, believed that a car could possess a split personality—ferocious on the circuit, refined on the Riviera\.", r"Velocity was born from a singular passion: keeping vehicles looking flawlessly new. Frustrated by rock chips, fading paint, and searing interior heat, our founders set out to offer the highest grade window tints and paint protection films on the market."),
    (r"Today, we operate in the rare air of hyper-bespoke automotive manufacturing, producing fewer than 50 vehicles a year for a clientele that demands absolute perfection\.", r"Today, we operate a premier protection studio, treating thousands of vehicles a year for a clientele that demands absolute perfection and seamless installations."),
    (r"Performance", r"Protection"),
    (r"1,200 HP", r"Lifetime"),
    (r"Peak Power Output", r"Warranty on Films"),
    (r"Aero", r"Gloss"),
    (r"Active Systems", r"Ceramic Enhancements"),
    (r"Carbon", r"Self-Healing"),
    (r"Chassis Construction", r"PPF Technology"),
    (r"Bespoke", r"Precision"),
    (r"Client Tailoring", r"Computer Cut Fitment"),
]

update_file(r"d:\groww\car\pricing.html", pricing_replacements)
update_file(r"d:\groww\car\about.html", about_replacements)
