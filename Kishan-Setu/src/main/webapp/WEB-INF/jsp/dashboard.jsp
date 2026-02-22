<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - KisanSetu</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
		.scheme-link {
		    text-decoration: none;
		    color: inherit;
		    display: block;
		}
        /* --- RESET & VARIABLES --- */
        :root {
            --primary-green: #1f5f35;
            --light-green-bg: #f4f8f5;
            --sage-gradient-start: #EDF1E8;
            --sage-gradient-end: #FFF8F0;
            --text-dark: #1a1a1a;
            --text-grey: #5f6368;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Poppins', sans-serif;
            background:#F5FBE6;
            color: var(--text-dark);
            min-height: 100vh;
        }

        /* --- HEADER --- */
        .top-header {
            background: #BCD9A2;
            padding: 12px 40px;
            display: flex; justify-content: space-between; align-items: center;
            border-bottom: 1px solid #eee;
            position: sticky; top: 0; z-index: 100;
        }

        .logo {
            display: flex; align-items: center; gap: 10px;
            font-family: 'Merriweather', serif; font-weight: 700; font-size: 1.4rem; color: #1a1a1a;
        }
        .logo i { color: var(--primary-green); font-size: 1.3rem; }

        .header-actions { display: flex; align-items: center; gap: 15px; }
        
        .lang-toggle, .logout-btn {
            background: white; border: 1px solid #ddd;
            padding: 6px 16px; border-radius: 20px;
            font-size: 0.85rem; font-weight: 500; cursor: pointer;
            transition: 0.3s; text-decoration: none; color: #333;
        }
        .logout-btn:hover { background: #fee2e2; border-color: #fee2e2; color: #dc2626; }

        /* --- MAIN CONTAINER --- */
        .container { 
            max-width: 1250px; 
            margin: 0 auto; 
            padding: 30px 20px; 
        }

        /* --- NAVBAR --- */
        .navbar {
            background: #FEFFD3;
            padding: 15px 30px;
            border-radius: 12px;
            border: 2px solid #e0e0e0;
            display: flex; gap: 30px;
            margin-bottom: 30px;
            overflow-x: auto;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.01);
        }

        .nav-item {
            text-decoration: none; color: #666; font-size: 0.95rem; font-weight: 500;
            display: flex; align-items: center; gap: 10px;
            transition: 0.2s; white-space: nowrap;
        }

        .nav-item:hover { color: var(--primary-green); }
        
        .nav-item.active {
            background-color: var(--primary-green);
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
        }

        /* --- WELCOME HERO --- */
        .welcome-hero {
            background: linear-gradient(90deg, var(--sage-gradient-start) 0%, var(--sage-gradient-end) 100%);
            border: 1.5px solid #e6eadd;
            border-radius: 20px;
            padding: 60px 50px;
            margin-bottom: 40px;
        }

        .welcome-hero h1 { 
            font-family: 'Merriweather', serif; 
            font-size: 2.8rem;
            color: #2c2a25; 
            margin-bottom: 10px;
            font-weight: 700;
        }
        .welcome-hero p { color: #6b6b65; font-size: 1.1rem; }

        /* --- FEATURE GRID --- */
        .feature-grid {
            display: grid; grid-template-columns: repeat(2, 1fr); gap: 25px; margin-bottom: 50px;
        }

        .feature-card {
            background: white; padding: 30px; border-radius: 16px;
            border: 1px solid #f0f0f0;
            display: flex; align-items: center; justify-content: space-between;
            cursor: pointer; transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.15);
        }

        .feature-card:hover { transform: translateY(-4px); box-shadow: 0 10px 20px rgba(0,0,0,0.25); }
        .card-content { display: flex; align-items: flex-start; gap: 20px; }
        .icon-box {
            width: 55px; height: 55px; border-radius: 14px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.6rem; flex-shrink: 0;
        }

        .icon-wheat { background: #ecfccb; color: #4d7c0f; }
        .icon-shield { background: #fee2e2; color: #dc2626; }
        .icon-water { background: #e0f2fe; color: #0284c7; }
        .icon-rupee { background: #ffedd5; color: #d97706; }

        .text-info h3 { font-size: 1.1rem; margin-bottom: 6px; color: #1a1a1a; font-weight: 600; }
        .text-info p { font-size: 0.9rem; color: #666; line-height: 1.5; }

        /* --- GOVERNMENT SCHEMES --- */
        .schemes-wrapper {
            background-color: var(--light-green-bg); 
            border: 2px solid #dbece0;
            border-radius: 16px;
            padding: 35px;
            margin-bottom: 50px;
        }

        .schemes-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .section-title {
            font-family: 'Merriweather', serif; font-size: 1.5rem; color: #1a3c27;
            margin-bottom: 0; display: flex; align-items: center; gap: 12px;
        }

        .state-filter-select {
            padding: 8px 15px;
            border-radius: 8px;
            border: 2px solid #BCD9A2;
            font-family: 'Poppins', sans-serif;
            font-size: 0.9rem;
            outline: none;
            color: var(--primary-green);
            font-weight: 600;
        }

        /* Category Label Styles */
        .category-label {
            font-weight: 600;
            font-size: 1rem;
            color: #2c4c3b;
            margin: 25px 0 15px 0;
            display: flex;
            align-items: center;
            gap: 10px;
            border-bottom: 1px solid #dbece0;
            padding-bottom: 8px;
        }

        .schemes-grid {
            display: grid; grid-template-columns: repeat(3, 1fr); gap: 25px;
        }

        .scheme-card {
            background: white; padding: 25px; border-radius: 12px;
            border: 1px solid #e5e7eb; position: relative;
            box-shadow: 0 2px 5px rgba(0,0,0,0.01);
            transition: 0.3s;
            height: 100%;
        }
        
        .scheme-card:hover { transform: translateY(-3px); box-shadow: 0 8px 15px rgba(0,0,0,0.06); }
        .scheme-card.hidden { display: none; }

        .scheme-header { display: flex; gap: 15px; margin-bottom: 12px; align-items: flex-start; }
        .scheme-icon { font-size: 1.8rem; margin-top: 2px; }
        
        .scheme-title {
            font-weight: 700; font-size: 0.95rem; color: #333;
            line-height: 1.4;
        }

        .scheme-desc { font-size: 0.85rem; color: #666; line-height: 1.6; margin-top: 8px; }

        footer {
            text-align: center;
            padding: 60px 20px 30px;
            color: #888;
            font-size: 0.85rem;
        }

        @media (max-width: 1000px) { .feature-grid, .schemes-grid { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 650px) {
            .feature-grid, .schemes-grid { grid-template-columns: 1fr; }
            .navbar { flex-wrap: wrap; justify-content: center; }
            .schemes-header-row { flex-direction: column; align-items: flex-start; }
        }
    </style>
</head>
<body>

    <div class="top-header">
        <div class="logo"><i class="fas fa-leaf"></i> KisanSetu</div>
        <div class="header-actions">
            <button class="lang-toggle">EN / हि</button>
            <a href="/login" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="navbar">
            <a href="#" class="nav-item active"><i class="fas fa-home"></i> Home</a>
            <a href="#" class="nav-item"><i class="fas fa-tint"></i> Water Monitoring</a>
            <a href="crop-recommendation" class="nav-item"><i class="fas fa-seedling"></i> Crop Guide</a>
            <a href="medicine-choice" class="nav-item"><i class="fas fa-kit-medical"></i> Pesticide & Treatment</a>
            <a href="/market-choice" class="nav-item"><i class="fas fa-chart-line"></i> Market Prices</a>
        </div>

        <div class="welcome-hero">
            <h1>Welcome, Farmer!</h1>
            <p>Your smart farming assistant is ready to help you grow more.</p>
        </div>

        <div class="feature-grid">
            <div class="feature-card" onclick="window.location.href='/crop-recommendation'">
                <div class="card-content">
                    <div class="icon-box icon-wheat"><i class="fas fa-wheat-awn"></i></div>
                    <div class="text-info">
                        <h3>Crop Recommendation</h3>
                        <p>Get smart suggestions based on soil & season</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right" style="color:#ccc;"></i>
            </div>

            <div class="feature-card" onclick="window.location.href='/medicine-choice'">
                <div class="card-content">
                    <div class="icon-box icon-shield"><i class="fas fa-shield-virus"></i></div>
                    <div class="text-info">
                        <h3>Pesticide Recommendation</h3>
                        <p>Pest & disease treatment solutions</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right" style="color:#ccc;"></i>
            </div>

            <div class="feature-card"onclick="window.location.href='/water-level'">
                <div class="card-content">
                    <div class="icon-box icon-water"><i class="fas fa-droplet"></i></div>
                    <div class="text-info">
                        <h3>Water Level</h3>
                        <p>Check moisture & plan irrigation</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right" style="color:#ccc;"></i>
            </div>

            <div class="feature-card" onclick="window.location.href='/market-choice'">
                <div class="card-content">
                    <div class="icon-box icon-rupee"><i class="fas fa-indian-rupee-sign"></i></div>
                    <div class="text-info">
                        <h3>Market Prices</h3>
                        <p>Live crop prices at nearby Mandis</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right" style="color:#ccc;"></i>
            </div>
        </div>

        <div class="schemes-wrapper">
            <div class="schemes-header-row">
                <h2 class="section-title"><i class="fas fa-landmark"></i> Government Schemes</h2>
                <select class="state-filter-select" id="stateFilter" onchange="filterSchemes()">
                    <option value="all">All India Schemes</option>
                    <option value="MH">Maharashtra</option>
                    <option value="UP">Uttar Pradesh</option>
                    <option value="PB">Punjab</option>
                    <option value="RJ">Rajasthan</option>
                </select>
            </div>
            
            <div class="category-label"><i class="fas fa-gift" style="color: #6b7280;"></i> Free Schemes</div>
            <div class="schemes-grid">
				<a href="https://soilhealth.dac.gov.in/" target="_blank" class="scheme-link">
                <div class="scheme-card" data-state="all">
                    <div class="scheme-header">
                        <i class="fas fa-flask scheme-icon" style="color: #84cc16;"></i>
                        <div class="scheme-title">Soil Health Card</div>
                    </div>
                    <p class="scheme-desc">Free assessment of soil health with expert fertilizer recommendations.</p>
                </div>
				</a>
                <div class="scheme-card" data-state="MH">
                    <div class="scheme-header">
                        <i class="fas fa-tractor scheme-icon" style="color: #16a34a;"></i>
                        <div class="scheme-title">Maha-Krushi (MH Only)</div>
                    </div>
                    <p class="scheme-desc">Maharashtra state scheme for localized equipment rental and support.</p>
                </div>
                <div class="scheme-card" data-state="all">
                    <div class="scheme-header">
                        <i class="fas fa-store scheme-icon" style="color: #ec4899;"></i>
                        <div class="scheme-title">e-NAM Agriculture Market</div>
                    </div>
                    <p class="scheme-desc">Free online platform connecting you to buyers and Mandis across India.</p>
                </div>
            </div>

            <div class="category-label"><i class="fas fa-hand-holding-dollar" style="color: #166534;"></i> Direct Benefit</div>
            <div class="schemes-grid">
                <div class="scheme-card" data-state="all">
                    <div class="scheme-header">
                        <i class="fas fa-sack-dollar scheme-icon" style="color: #eab308;"></i>
                        <div class="scheme-title">PM-KISAN Samman Nidhi</div>
                    </div>
                    <p class="scheme-desc">₹6,000 yearly income support paid directly to bank accounts.</p>
                </div>
                <div class="scheme-card" data-state="RJ">
                    <div class="scheme-header">
                        <i class="fas fa-coins scheme-icon" style="color: #f59e0b;"></i>
                        <div class="scheme-title">Raj-Kisan Sathi (RJ)</div>
                    </div>
                    <p class="scheme-desc">Direct subsidy for solar pumps specific to Rajasthan farmers.</p>
                </div>
            </div>

            <div class="category-label"><i class="fas fa-tags" style="color: #92400e;"></i> Subsidized</div>
            <div class="schemes-grid">
                <div class="scheme-card" data-state="all">
                    <div class="scheme-header">
                        <i class="fas fa-shield-alt scheme-icon" style="color: #3b82f6;"></i>
                        <div class="scheme-title">PM Fasal Bima Yojana</div>
                    </div>
                    <p class="scheme-desc">Low-premium crop insurance protecting against natural calamities.</p>
                </div>
            </div>
        </div>
    </div>

    <script>
        function filterSchemes() {
            const selectedState = document.getElementById('stateFilter').value;
            const cards = document.querySelectorAll('.scheme-card');
            
            cards.forEach(card => {
                const cardState = card.getAttribute('data-state');
                if (selectedState === 'all') {
                    // Show only general "all India" schemes when 'All' is selected
                    if (cardState === 'all') card.classList.remove('hidden');
                    else card.classList.add('hidden');
                } else {
                    // Show 'all India' schemes AND the specific selected state schemes
                    if (cardState === 'all' || cardState === selectedState) {
                        card.classList.remove('hidden');
                    } else {
                        card.classList.add('hidden');
                    }
                }
            });
        }
        // Run once on load to show only "All India" by default
        window.onload = filterSchemes;
    </script>

    <footer>
        © 2026 KisanSetu — Empowering Farmers, From Seed to Sale
    </footer>

</body>
</html>