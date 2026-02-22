<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Smart Recommendations - AgriSmart</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif; background: #f3f4f6; color: #1f2937;
            display: flex; justify-content: center; padding: 40px 20px;
        }
        .container { max-width: 800px; width: 100%; }

        /* HEADER */
        .header-box { text-align: center; margin-bottom: 30px; }
        .header-box h2 { color: #166534; font-weight: 700; margin-bottom: 5px; }
        .header-box p { color: #6b7280; font-size: 0.9rem; }

        /* WINNER CARD */
        .winner-card {
            background: linear-gradient(135deg, #166534 0%, #15803d 100%);
            color: white; border-radius: 20px; padding: 30px;
            position: relative; overflow: hidden;
            box-shadow: 0 15px 30px rgba(21, 128, 61, 0.2);
            margin-bottom: 30px;
        }
        .winner-badge {
            background: #dcfce7; color: #166534; padding: 5px 15px; border-radius: 20px;
            font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;
            display: inline-block; margin-bottom: 10px;
        }
        .winner-title { font-size: 2.5rem; font-weight: 700; margin: 0; }
        .winner-reason { font-size: 1rem; opacity: 0.9; margin-top: 10px; max-width: 80%; }
        
        .score-circle {
            position: absolute; top: 30px; right: 30px;
            background: rgba(255,255,255,0.2); width: 80px; height: 80px;
            border-radius: 50%; display: flex; flex-direction: column;
            align-items: center; justify-content: center; border: 2px solid rgba(255,255,255,0.4);
        }
        .score-val { font-size: 1.5rem; font-weight: 700; }
        .score-label { font-size: 0.6rem; text-transform: uppercase; }

        /* OTHER OPTIONS */
        .others-label { font-weight: 700; color: #374151; margin-bottom: 15px; font-size: 1.1rem; }
        
        .option-card {
            background: white; border-radius: 12px; padding: 20px;
            margin-bottom: 15px; display: flex; align-items: center; justify-content: space-between;
            box-shadow: 0 4px 10px rgba(0,0,0,0.03); border: 1px solid #e5e7eb;
            transition: 0.2s;
        }
        .option-card:hover { transform: translateX(5px); border-color: #166534; }
        
        .opt-info h4 { margin: 0; font-size: 1.1rem; color: #111; }
        .opt-info p { margin: 5px 0 0; font-size: 0.85rem; color: #6b7280; }
        
        .opt-score { text-align: right; min-width: 80px; }
        .progress-bar-bg { width: 100px; height: 6px; background: #e5e7eb; border-radius: 10px; margin-top: 8px; }
        .progress-bar-fill { height: 100%; background: #166534; border-radius: 10px; }
        .per-text { font-weight: 700; color: #166534; }

        .btn-home {
            display: block; width: 100%; text-align: center; padding: 15px;
            background: #fff; border: 2px solid #e5e7eb; border-radius: 12px;
            color: #4b5563; font-weight: 600; text-decoration: none; margin-top: 30px;
        }
        .btn-home:hover { background: #f9fafb; border-color: #d1d5db; }

    </style>
</head>
<body>

<div class="container">
    
    <div class="header-box">
        <h2>Recommended Crops for ${city}</h2>
        <p>Based on Soil, pH Level, and Today's Weather (${temp}°C)</p>
    </div>

    <div class="winner-card">
        <div class="winner-badge"><i class="fas fa-crown"></i> Best Match</div>
        <h1 class="winner-title">${topCrop.name}</h1>
        <p class="winner-reason"><i class="fas fa-check-circle"></i> ${topCrop.reason}</p>
        
        <div class="score-circle">
            <span class="score-val">${topCrop.score}%</span>
            <span class="score-label">Match</span>
        </div>
    </div>

    <div class="others-label">Alternative Options</div>

    <div class="option-card">
        <div class="opt-info">
            <h4>${secondCrop.name}</h4>
            <p>${secondCrop.reason}</p>
        </div>
        <div class="opt-score">
            <div class="per-text">${secondCrop.score}%</div>
            <div class="progress-bar-bg">
                <div class="progress-bar-fill" style="width: ${secondCrop.score}%;"></div>
            </div>
        </div>
    </div>

    <div class="option-card">
        <div class="opt-info">
            <h4>${thirdCrop.name}</h4>
            <p>${thirdCrop.reason}</p>
        </div>
        <div class="opt-score">
            <div class="per-text">${thirdCrop.score}%</div>
            <div class="progress-bar-bg">
                <div class="progress-bar-fill" style="width: ${thirdCrop.score}%;"></div>
            </div>
        </div>
    </div>

    <a href="crop_recommendation" class="btn-home">Check Another Crop</a>

</div>

</body>
</html>