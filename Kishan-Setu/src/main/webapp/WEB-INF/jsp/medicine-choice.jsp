<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine & Treatment - KisanSetu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --primary: #166534; --bg: #fdfbf7; --text: #1f2937; }
        body { font-family: 'Poppins', sans-serif; background-color: var(--bg); margin: 0; color: var(--text); }
        
        .navbar { background:#F0FFDF; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .logo { font-size: 22px; font-weight: 700; color: var(--primary); text-decoration: none; display: flex; align-items: center; gap: 8px; }

        .container { max-width: 1100px; margin: 60px auto; padding: 20px; text-align: center; }
        h1 { font-size: 2.5rem; margin-bottom: 10px; color: #111827; }
        .subtitle { color: #6b7280; font-size: 1.1rem; margin-bottom: 50px; }

        .selection-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 30px; }

        .choice-card { 
            background: white; border-radius: 24px; padding: 50px 40px; text-align: left;
            transition: transform 0.3s, box-shadow 0.3s; cursor: pointer; text-decoration: none;
            display: flex; flex-direction: column; position: relative; overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
        .choice-card:hover { transform: translateY(-10px); box-shadow: 0 20px 40px rgba(0,0,0,0.23); }

        .icon-box { width: 60px; height: 60px; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 24px; margin-bottom: 25px; }
        .fresh-icon { background: #f0fdf4; color: #166534; }
        .mod-icon { background: #fef2f2; color: #991b1b; }

        .card-title { font-size: 1.8rem; font-weight: 700; color: #111827; margin-bottom: 15px; }
        .card-desc { color: #4b5563; line-height: 1.6; margin-bottom: 30px; font-size: 1.05rem; }

        .btn-action { 
            display: inline-flex; align-items: center; gap: 8px; padding: 12px 24px; 
            border-radius: 50px; font-weight: 600; font-size: 0.95rem; border: none;
        }
        .btn-fresh { background: #e7e5e4; color: #44403c; }
        .btn-mod { background: #fff1f2; color: #be123c; border: 1px solid #fecaca; }

        /* Decoration circles from your screenshot */
        .deco-circle { position: absolute; top: -50px; right: -50px; width: 200px; height: 200px; border-radius: 50%; opacity: 0.1; }
        .fresh-deco { background: #166534; }
        .mod-deco { background: #991b1b; }
		/* Styling for the back navigation link */
		.back-nav { 
		    margin-bottom: 20px; 
		    padding: 0 40px; /* Aligns with your container padding */
		}
		.btn-text-back { 
		    text-decoration: none; 
		    color: #64748b; 
		    font-size: 14px; 
		    font-weight: 500; 
		    display: inline-flex; 
		    align-items: center; 
		    gap: 8px; 
		    transition: color 0.2s;
		}
		.btn-text-back:hover { 
		    color: #166534; /* Agri-green */
		}
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="/dashboard" class="logo"><i class="fas fa-leaf"></i> KisanSetu</a>
        <div style="display: flex; gap: 20px; align-items: center;">
            <span style="font-weight: 600; color: #374151;">EN / हि</span>
            <a href="/logout" style="text-decoration: none; color: #374151; font-weight: 600;"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </nav>
	<div class="back-nav">
	    <a href="/dashboard" class="btn-text-back">
	        <i class="fas fa-arrow-left"></i> Back to Dashboard
	    </a>
	</div>

    <div class="container">
        <h1>What type of farmer are you?</h1>
        <p class="subtitle">Choose the option that fits your need</p>

        <div class="selection-grid">
            <a href="/fresh-farmer-input" class="choice-card">
                <div class="deco-circle fresh-deco"></div>
                <div class="icon-box fresh-icon"><i class="fas fa-seedling"></i></div>
                <div class="card-title">🌱 Fresh Start</div>
                <p class="card-desc">I want to grow a new crop — tell me which medicines & pesticides I need from seed to harvest</p>
                <div>
                    <span class="btn-action btn-fresh"><i class="fas fa-briefcase-medical"></i> Prevention Kit</span>
                </div>
            </a>

            <a href="/medicine_recommendation" class="choice-card">
                <div class="deco-circle mod-deco"></div>
                <div class="icon-box mod-icon"><i class="fas fa-bug"></i></div>
                <div class="card-title">🐛 Crop Problem</div>
                <p class="card-desc">My crop is damaged — upload a photo and get the right medicine & treatment</p>
                <div>
                    <span class="btn-action btn-mod"><i class="fas fa-camera"></i> Photo Diagnosis</span>
                </div>
            </a>
        </div>
    </div>

</body>
</html>