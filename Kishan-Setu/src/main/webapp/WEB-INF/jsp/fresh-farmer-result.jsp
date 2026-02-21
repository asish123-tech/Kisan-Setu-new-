<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${crop} Growing Kit - KisanSetu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --agri-green: #166534; --bg-soft: #fcfcf9; --card-border: #e2e8f0; }
        body { font-family: 'Segoe UI', sans-serif; background-color:#F0F0DB; margin: 0; padding-bottom: 40px; color: #1e293b; }
        
        /* Navbar Styling */
        .navbar { background:#E1D9BC; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #eee; margin-bottom: 20px; }
        .logo { color: var(--agri-green); font-weight: 700; font-size: 22px; text-decoration: none; display: flex; align-items: center; gap: 8px; }
        
        .container { max-width: 900px; margin: 0 auto; padding: 0 20px; }
        
        /* Back Navigation */
        .back-nav { margin-bottom: 15px; }
        .btn-text-back { text-decoration: none; color: #64748b; font-size: 14px; font-weight: 500; display: inline-flex; align-items: center; gap: 5px; }
        .btn-text-back:hover { color: var(--agri-green); }

        .header-card { background: #eef2ed; border: 1px solid #d1dbd1; border-radius: 12px; padding: 25px; margin-bottom: 25px; display: flex; align-items: center; gap: 20px; }
        .header-icon { background: #dce5dc; padding: 15px; border-radius: 10px; color: var(--agri-green); font-size: 24px; }
        
        .stage-container { background: white; border: 1px solid var(--card-border); border-radius: 15px; margin-bottom: 20px; overflow: hidden; box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
        .stage-header { padding: 15px 25px; background: #fafaf8; display: flex; align-items: center; justify-content: space-between; border-bottom: 1px solid #f0f0f0; }
        
        .num-circle { background: var(--agri-green); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 14px; }
        
        /* New Duration Badge */
        .duration-badge { background: #f1f5f9; color: #475569; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; border: 1px solid #e2e8f0; display: flex; align-items: center; gap: 5px; }

        .med-row { padding: 18px 25px; border-bottom: 1px solid #f8f8f8; display: flex; align-items: flex-start; gap: 20px; }
        .med-link-icon { color: #cbd5e1; font-size: 18px; margin-top: 4px; }
        .med-name { font-weight: 600; font-size: 16px; color: #1e293b; margin-bottom: 8px; }
        
        .tag { background: #f3f1e9; color: #4b5563; padding: 5px 12px; border-radius: 15px; font-size: 13px; margin-right: 10px; display: inline-flex; align-items: center; gap: 6px; }
        
        .tips-area { padding: 15px 25px; background: #fafaf8; border-top: 1px solid #f0f0f0; }
        .tip-title { color: #b58900; font-size: 12px; font-weight: bold; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 10px; display: flex; align-items: center; gap: 5px; }
        .tip-item { font-size: 14px; color: #64748b; margin-bottom: 6px; display: flex; align-items: center; gap: 8px; }
        .tip-item i { color: #16a34a; font-size: 14px; }

        .btn-back-main { display: block; width: 100%; padding: 15px; text-align: center; background: white; border: 1px solid #e2e8f0; border-radius: 12px; text-decoration: none; color: #1e293b; font-weight: 500; margin-top: 10px; transition: background 0.2s; }
        .btn-back-main:hover { background: #f8fafc; border-color: #cbd5e1; }
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="/" class="logo"><i class="fas fa-leaf"></i> KisanSetu</a>
        <div style="font-size: 14px; color: #64748b;">Farmer Portal <i class="fas fa-user-circle"></i></div>
    </nav>

    <div class="container">
        <div class="back-nav">
            <a href="/fresh-farmer-input" class="btn-text-back"><i class="fas fa-chevron-left"></i> Back to Crop Selection</a>
        </div>

        <div class="header-card">
            <div class="header-icon"><i class="fas fa-leaf"></i></div>
            <div>
                <div style="font-size: 12px; color: #64748b; text-transform: uppercase; font-weight: 800; letter-spacing: 0.5px;">Complete Growth Roadmap</div>
                <h1 style="margin: 0; font-size: 26px; color: #1e293b;">${crop} Medicine Kit</h1>
            </div>
        </div>

        <c:forEach var="stage" items="${schedule}">
            <div class="stage-container">
                <div class="stage-header">
                    <div style="display: flex; align-items: center; gap: 15px;">
                        <div class="num-circle">${stage.stageNum}</div>
                        <h3 style="margin:0; font-size:18px; color:#334155;">
                            <i class="${stage.stageIcon}" style="color:var(--agri-green); margin-right:8px;"></i> 
                            ${stage.stageTitle}
                        </h3>
                    </div>
                    <div class="duration-badge">
                        <i class="far fa-calendar-alt"></i> ${stage.duration}
                    </div>
                </div>

                <c:forEach var="med" items="${stage.medicines}">
                    <div class="med-row">
                        <i class="fas fa-link med-link-icon"></i>
                        <div>
                            <div class="med-name">${med.name}</div>
                            <div>
                                <span class="tag"><i class="fas fa-droplet"></i> ${med.dose}</span>
                                <span class="tag"><i class="far fa-clock"></i> ${med.tag}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="tips-area">
                    <div class="tip-title"><i class="fas fa-lightbulb"></i> EXPERT TIPS</div>
                    <c:forEach var="tip" items="${stage.tips}">
                        <div class="tip-item"><i class="far fa-check-circle"></i> ${tip}</div>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>

        <a href="/medicine-choice" class="btn-back-main">Choose Another Category</a>
    </div>

</body>
</html>