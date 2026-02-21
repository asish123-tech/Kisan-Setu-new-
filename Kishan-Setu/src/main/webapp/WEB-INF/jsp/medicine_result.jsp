<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Diagnosis Report - AgriSmart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        :root { --primary: #166534; --bg: #f3f4f6; }
        body { font-family: 'Poppins', sans-serif; background: var(--bg); margin: 0; padding: 40px 20px; display: flex; justify-content: center; min-height: 100vh; }
        
        .report-container { display: grid; grid-template-columns: 300px 1fr; gap: 30px; max-width: 1000px; width: 100%; }
        
        /* Left Column */
        .image-card { background: white; padding: 15px; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); text-align: center; height: fit-content; }
        .scanned-img { width: 100%; height: 250px; object-fit: cover; border-radius: 15px; border: 2px solid #e5e7eb; background: #eee; }
        .scan-badge { margin-top: 15px; background: #dcfce7; color: #166534; padding: 8px 15px; border-radius: 50px; font-weight: 600; display: inline-block; }

        /* Right Column */
        .content-card { background: white; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); overflow: hidden; display: flex; flex-direction: column; }
        
        /* HEADER FIX: No Overlap */
        .header { background: linear-gradient(135deg, #166534 0%, #15803d 100%); padding: 30px; color: white; }
        .header-top { display: flex; justify-content: space-between; align-items: start; gap: 20px; margin-bottom: 10px; }
        .header h1 { margin: 0; font-size: 1.6rem; line-height: 1.3; }
        
        /* Badge moves automatically if text is long */
        .severity-badge { 
            background: white; color: #dc2626; padding: 8px 16px; border-radius: 30px; font-weight: 700; white-space: nowrap; flex-shrink: 0; 
        }
        .severity-badge.mild { color: #16a34a; }

        /* Sections */
        .ai-stats { padding: 20px 30px; background: #f9fafb; display: flex; align-items: center; gap: 15px; border-bottom: 1px solid #eee; }
        .progress-bar { flex-grow: 1; height: 10px; background: #e5e7eb; border-radius: 10px; overflow: hidden; }
        .progress-fill { width: 94%; height: 100%; background: #16a34a; }
        
        .section { padding: 30px; border-bottom: 1px solid #f3f4f6; }
        .sec-title { font-size: 1.2rem; font-weight: 700; margin-bottom: 15px; display: flex; align-items: center; gap: 10px; color: #1f2937; }
        
        .med-box { background: #fff1f2; border: 1px solid #fecdd3; border-radius: 12px; padding: 20px; display: flex; gap: 15px; }
        .med-icon { background: #e11d48; color: white; width: 50px; height: 50px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; flex-shrink: 0; }
        
        .prev-list li { display: flex; gap: 10px; margin-bottom: 10px; }
        .check-icon { color: #16a34a; background: #dcfce7; padding: 5px; border-radius: 50%; height: fit-content; }
        
        .btn-home { display: block; text-align: center; margin: 20px 30px; padding: 15px; background: #374151; color: white; text-decoration: none; border-radius: 10px; font-weight: 600; }

        @media (max-width: 800px) { .report-container { grid-template-columns: 1fr; } }
    </style>
</head>
<body>

<div class="report-container">

    <div class="image-card">
        <div style="font-weight: 700; color: #374151; margin-bottom: 15px;">Analyzed Sample</div>
        
        <% 
            String imgData = (String) request.getAttribute("uploadedImage");
            if(imgData != null) { 
        %>
            <img src="<%= imgData %>" class="scanned-img" alt="Leaf Scan">
        <% } else { %>
            <img src="https://cdn-icons-png.flaticon.com/512/3013/3013636.png" class="scanned-img" style="padding: 50px; box-sizing: border-box;" alt="No Image">
        <% } %>

        <div class="scan-badge"><i class="fas fa-check-circle"></i> Scan Complete</div>
    </div>

    <div class="content-card">
        <div class="header">
            <div class="header-top">
                <div>
                    <h1>${disease}</h1>
                    <p style="margin: 5px 0 0; opacity: 0.9;">Identified Pathogen / Stress Factor</p>
                </div>
                
                <div class="severity-badge ${severity == 'Mild' ? 'mild' : ''}">
                    <i class="fas fa-exclamation-triangle"></i> ${severity}
                </div>
            </div>
        </div>

        <div class="ai-stats">
            <div style="font-weight: 600; color: #6b7280;">AI Confidence:</div>
            <div class="progress-bar"><div class="progress-fill"></div></div>
            <div style="font-weight: 700; color: #166534;">94%</div>
        </div>

        <div class="section">
            <div class="sec-title"><i class="fas fa-pills" style="color: #e11d48;"></i> Treatment</div>
            <div class="med-box">
                <div class="med-icon"><i class="fas fa-prescription-bottle-medical"></i></div>
                <div>
                    <h3 style="margin: 0 0 5px 0; color: #9f1239;">${medicine}</h3>
                    <p style="margin:0; color: #881337;"><strong>Dosage:</strong> ${dosage}</p>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="sec-title"><i class="fas fa-shield-halved" style="color: #16a34a;"></i> Prevention</div>
            <ul style="list-style: none; padding: 0; margin: 0;" class="prev-list">
                <li><i class="fas fa-check check-icon"></i> <span>${prevention}</span></li>
                <li><i class="fas fa-check check-icon"></i> <span>Ensure proper field drainage.</span></li>
            </ul>
        </div>
        
        <a href="medicine_recommendation" class="btn-home">New Analysis</a>
    </div>
</div>

</body>
</html>