<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AI Plant Doctor - AgriSmart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root { --primary: #166534; --bg: #fdfbf7; }
        body { font-family: 'Poppins', sans-serif; background: var(--bg); margin: 0; min-height: 100vh; }

        /* Navbar */
        .navbar { width: 100%; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; background: white; box-shadow: 0 2px 10px rgba(0,0,0,0.05); position: fixed; top: 0; z-index: 100; box-sizing: border-box; }
        .logo { font-size: 22px; font-weight: 700; color: var(--primary); display: flex; align-items: center; gap: 8px; }
        
        /* Main Container */
        .container { max-width: 800px; width: 90%; background: white; margin: 100px auto 40px auto; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); overflow: hidden; position: relative; }
        
        /* Header */
        .header-bg { background: #fef2f2; padding: 40px; text-align: center; }
        .header-bg h2 { margin: 0; color: #1f2937; }
        
        /* Form */
        .form-section { padding: 40px; }
        .form-group { margin-bottom: 25px; }
        label { font-weight: 600; display: block; margin-bottom: 10px; color: #374151; }
        select { width: 100%; padding: 15px; border: 1px solid #e5e7eb; border-radius: 10px; font-size: 1rem; background: #f9fafb; outline: none; }

        /* Upload Box */
        .upload-area { border: 2px dashed #d1d5db; padding: 40px; text-align: center; border-radius: 15px; cursor: pointer; transition: 0.3s; background: #f9fafb; }
        .upload-area:hover { background: #f0fdf4; border-color: var(--primary); }
        .upload-icon { font-size: 30px; color: var(--primary); margin-bottom: 10px; }
        .file-name-display { color: var(--primary); font-weight: 600; margin-top: 10px; display: none; }

        /* Submit Button */
        .btn-submit { width: 100%; padding: 18px; background: var(--primary); color: white; border: none; border-radius: 12px; font-size: 1.1rem; font-weight: 600; cursor: pointer; transition: 0.2s; margin-top: 10px; }
        .btn-submit:hover { background: #14532d; }

        /* --- FIXED LOADING OVERLAY --- */
        #loadingScreen { 
            display: none; 
            position: fixed; 
            top: 0; left: 0; 
            width: 100%; height: 100%; 
            background: rgba(255, 255, 255, 0.95); 
            z-index: 9999; 
            flex-direction: column; 
            justify-content: center; 
            align-items: center; 
        }

        .scan-container { position: relative; width: 200px; height: 200px; margin-bottom: 20px; }
        .scan-icon { font-size: 100px; color: #dcfce7; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); }
        .scan-line { 
            width: 100%; height: 4px; background: #16a34a; 
            position: absolute; top: 0; 
            animation: scanMove 2s infinite ease-in-out; 
            box-shadow: 0 0 15px #16a34a; 
            border-radius: 50%;
        }
        
        @keyframes scanMove {
            0% { top: 20%; opacity: 0; }
            50% { top: 80%; opacity: 1; }
            100% { top: 20%; opacity: 0; }
        }

        .loading-text { font-size: 1.5rem; color: #1f2937; font-weight: 700; margin-top: 20px; }
        .loading-sub { color: #6b7280; margin-top: 5px; }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="logo"><i class="fas fa-leaf"></i> AgriSmart</div>
        <a href="/" style="text-decoration: none; color: #374151; font-weight: 600;">Back to Home</a>
    </nav>

    <div id="loadingScreen">
        <div class="scan-container">
            <i class="fas fa-seedling scan-icon"></i> 
            <div class="scan-line"></div>
        </div>
        <div class="loading-text">AI Analysis in Progress...</div>
        <div class="loading-sub">Identifying symptoms and checking database</div>
    </div>

    <div class="container" id="mainContainer">
        <div class="header-bg">
            <h2>Plant Doctor</h2>
            <p>Select crop & symptoms to get an instant AI diagnosis.</p>
        </div>

        <form id="docForm" action="predict-medicine" method="post" enctype="multipart/form-data" class="form-section">
            <div class="form-group">
                <label>1. Select Your Crop *</label>
                <select name="cropName" required>
                    <option value="" disabled selected>Choose a crop...</option>
                    <option value="Wheat">Wheat / गेहूं</option>
                    <option value="Rice">Rice / चावल</option>
                    <option value="Corn">Corn / मक्का</option>
                    <option value="Cotton">Cotton / कपास</option>
                    <option value="Mustard">Mustard / सरसों</option>
                    <option value="Soybean">Soybean / सोयाबीन</option>
                    <option value="Sugarcane">Sugarcane / गन्ना</option>
                    <option value="Tomato">Tomato / टमाटर</option>
                    <option value="Potato">Potato / आलू</option>
                    <option value="Pepper">Pepper / मिर्च</option>
                    <option value="Squash">Squash / कद्दू</option>
                    <option value="Apple">Apple / सेब</option>
                    <option value="Grape">Grape / अंगूर</option>
                    <option value="Strawberry">Strawberry / स्ट्रॉबेरी</option>
                    <option value="Orange">Orange / संतरा</option>
                </select>
            </div>

            <div class="form-group">
                <label>2. Visible Symptoms *</label>
                <select name="symptom" required>
                    <option value="" disabled selected>What do you see?</option>
                    <option value="yellow">Yellow Leaves / Leaf Rust</option>
                    <option value="spots">Black or Brown Spots</option>
                    <option value="curling">Leaves Curling / Folding</option>
                    <option value="holes">Holes in Leaves (Insect)</option>
                    <option value="wilting">Plant Wilting / Drooping</option>
                </select>
            </div>

            <div class="form-group">
                <label>3. Upload Photo (Optional)</label>
                <div class="upload-area" onclick="document.getElementById('fileIn').click()">
                    <i class="fas fa-cloud-upload-alt upload-icon"></i>
                    <p id="uploadText" style="margin:0; color:#6b7280;">Click to upload leaf photo</p>
                    <div id="fileName" class="file-name-display"></div>
                    <input type="file" id="fileIn" name="image" style="display: none;" onchange="showFileName(this)">
                </div>
            </div>

            <button type="button" class="btn-submit" onclick="startScan()">
                <i class="fas fa-wand-magic-sparkles"></i> Predict Best Treatment
            </button>
        </form>
    </div>

    <script>
        function showFileName(input) {
            if (input.files && input.files[0]) {
                var fileName = input.files[0].name;
                document.getElementById('uploadText').style.display = 'none'; 
                var nameDisplay = document.getElementById('fileName');
                nameDisplay.style.display = 'block';
                nameDisplay.innerHTML = '<i class="fas fa-check-circle"></i> ' + fileName; 
            }
        }

        function startScan() {
            const form = document.getElementById('docForm');
            if (!form.checkValidity()) {
                form.reportValidity();
                return;
            }
            document.getElementById('loadingScreen').style.display = 'flex';
            document.getElementById('mainContainer').style.filter = 'blur(5px)';
            setTimeout(() => { form.submit(); }, 3000);
        }
    </script>
</body>
</html>