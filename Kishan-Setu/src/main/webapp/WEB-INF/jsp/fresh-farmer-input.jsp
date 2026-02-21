<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AgriSmart - Fresh Start</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root { --primary-green: #166534; --light-bg: #fdfbf7; --card-bg: #f8f9f4; }
        body { font-family: 'Poppins', sans-serif; background: #F0FFDF; margin: 0; color: #374151; }
        
        /* Navbar matching your screenshot */
        .navbar { padding: 15px 40px;background:#A8DF8E ; border-bottom: 1px solid #eee; display: flex; justify-content: space-between; align-items: center; }
        .logo { color: var(--primary-green); font-weight: 700; font-size: 24px; display: flex; align-items: center; gap: 8px; }
        
        .main-container { max-width: 1100px; margin: 40px auto; padding: 20px; }
        .back-link { color: #6b7280; text-decoration: none; font-size: 14px; margin-bottom: 20px; display: block; }

        .form-box { background: var(--card-bg); border-radius: 15px; padding: 40px; border: 1px solid #e5e7eb; }
        .title-section { margin-bottom: 30px; }
        .title-section h2 { margin: 0; color: #111827; font-size: 24px; }
        
        /* Grid Layout */
        .crop-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 15px; margin-bottom: 30px; }
        .crop-card { 
            background: white; border: 1px solid #e5e7eb; padding: 20px; border-radius: 12px; 
            display: flex; align-items: center; gap: 15px; cursor: pointer; transition: 0.2s;
        }
        .crop-card:hover { border-color: var(--primary-green); background: #f0fdf4; }
        .crop-card.selected { border: 2px solid var(--primary-green); background: #f0fdf4; }
        .crop-card i { font-size: 24px; color: var(--primary-green); }

        .btn-view { 
            width: 100%; padding: 18px; background: #94a3b8; color: white; border: none; 
            border-radius: 10px; font-weight: 600; font-size: 16px; cursor: pointer;
        }
        .btn-view.active { background: var(--primary-green); }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo"><i class="fas fa-leaf"></i> AgriSmart</div>
        <div style="display:flex; gap:20px; align-items:center;">
            <span style="font-size:14px; border:1px solid #ddd; padding:5px 10px; border-radius:5px;">EN / हि</span>
            <button style="background:none; border:1px solid #ddd; padding:5px 15px; border-radius:5px; cursor:pointer;">Logout</button>
        </div>
    </div>

    <div class="main-container">
        <a href="medicine-choice" class="back-link"><i class="fas fa-arrow-left"></i> Go Back</a>
        
        <div class="form-box">
            <div class="title-section">
                <h2><i class="fas fa-seedling" style="color:var(--primary-green)"></i> Which crop do you want to grow?</h2>
                <p style="color:#6b7280; font-size: 14px;">Select a crop and see all required medicines from seed to harvest</p>
            </div>

            <form action="fresh-farmer-result" method="post">
                <input type="hidden" name="cropName" id="selectedCrop">
                <div class="crop-grid">
                    <div class="crop-card" onclick="selectCrop('Rice', this)"><i class="fas fa-wheat-awn"></i> Rice / चावल</div>
                    <div class="crop-card" onclick="selectCrop('Wheat', this)"><i class="fas fa-seedling"></i> Wheat / गेहूं</div>
                    <div class="crop-card" onclick="selectCrop('Cotton', this)"><i class="fas fa-cloud"></i> Cotton / कपास</div>
                    <div class="crop-card" onclick="selectCrop('Tomato', this)"><i class="fas fa-apple-whole"></i> Tomato / टमाटर</div>
                    <div class="crop-card" onclick="selectCrop('Potato', this)"><i class="fas fa-circle"></i> Potato / आलू</div>
                    <div class="crop-card" onclick="selectCrop('Maize', this)"><i class="fas fa-corndog"></i> Maize / मक्का</div>
                </div>
                <button type="submit" id="submitBtn" class="btn-view" disabled>View Medicine Kit <i class="fas fa-chevron-right"></i></button>
            </form>
        </div>
    </div>

    <script>
        function selectCrop(name, element) {
            document.querySelectorAll('.crop-card').forEach(c => c.classList.remove('selected'));
            element.classList.add('selected');
            document.getElementById('selectedCrop').value = name;
            const btn = document.getElementById('submitBtn');
            btn.disabled = false;
            btn.classList.add('active');
        }
    </script>
</body>
</html>