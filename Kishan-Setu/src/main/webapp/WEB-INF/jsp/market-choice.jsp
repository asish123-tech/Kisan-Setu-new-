<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Marketplace - AgriSmart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --agri-green: #166534;
            --light-green: #f0fdf4;
            --bg-cream: #fbfbf8;
            --border: #e2e8f0;
            --text-main: #1e293b;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-cream);
            margin: 0;
            color: var(--text-main);
        }

        /* Navbar matched to your previous screens */
        .navbar {
            background: white;
            padding: 12px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eee;
        }
        .logo { color: var(--agri-green); font-weight: 700; font-size: 20px; text-decoration: none; display: flex; align-items: center; gap: 8px; }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .back-btn { 
            text-decoration: none; 
            color: #64748b; 
            font-size: 14px; 
            display: inline-block; 
            margin-bottom: 30px; 
        }

        .header-section { text-align: center; margin-bottom: 50px; }
        .header-section h1 { font-family: 'Georgia', serif; font-size: 32px; margin: 0 0 10px 0; }
        .header-section p { color: #64748b; font-size: 16px; margin: 0; }

        .choice-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .choice-card {
            background: white;
            padding: 40px 25px;
            border-radius: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            border: 1px solid #f1f5f9;
        }

        .choice-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .icon-box {
            width: 70px;
            height: 70px;
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            margin-bottom: 25px;
        }

        .dealer-icon { background-color: #f0fdf4; color: #166534; }
        .farmer-icon { background-color: #fefce8; color: #854d0e; }
        .trend-icon  { background-color: #eff6ff; color: #1e40af; }

        .choice-card h2 { font-size: 22px; margin: 0 0 15px 0; }
        .choice-card p { font-size: 14px; color: #64748b; line-height: 1.6; margin: 0 0 30px 0; flex-grow: 1; }

        .btn {
            text-decoration: none;
            padding: 12px 0;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            width: 100%;
            text-align: center;
            transition: opacity 0.2s;
        }

        .btn-dealer { background: var(--agri-green); color: white; }
        .btn-farmer { background: #eab308; color: white; } /* Goldish for Farmer */
        .btn-trend  { background: #3b82f6; color: white; } /* Blue for Trends */

        .btn:hover { opacity: 0.9; }

        @media (max-width: 900px) {
            .choice-grid { grid-template-columns: 1fr; }
            .container { padding: 20px; }
        }
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/dashboard" class="logo"><i class="fas fa-leaf"></i> AgriSmart</a>
        <div style="display: flex; gap: 20px; align-items: center;">
            <span style="font-size: 13px;">EN / हिं</span>
            <a href="${pageContext.request.contextPath}/logout" style="text-decoration: none; color: var(--text-main); border: 1px solid #ddd; padding: 4px 12px; border-radius: 6px; font-size: 13px;">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </nav>

    <div class="container">
        <a href="${pageContext.request.contextPath}/dashboard" class="back-btn"><i class="fas fa-arrow-left"></i> Back</a>

        <div class="header-section">
            <h1>Market Prices</h1>
            <p>How would you like to use the market today?</p>
        </div>

        <div class="choice-grid">
            <div class="choice-card">
                <div class="icon-box dealer-icon">
                    <i class="fas fa-store"></i>
                </div>
                <h2>I'm a Dealer</h2>
                <p>Add your crop prices, location & contact so farmers can find you.</p>
                <a href="${pageContext.request.contextPath}/market/dealer" class="btn btn-dealer">Add Listings</a>
            </div>

            <div class="choice-card">
                <div class="icon-box farmer-icon">
                    <i class="fas fa-tractor"></i>
                </div>
                <h2>I'm a Farmer</h2>
                <p>Search for the best crop prices from dealers near your location.</p>
                <a href="${pageContext.request.contextPath}/market/farmer" class="btn btn-farmer">Find Dealers</a>
            </div>

            <div class="choice-card">
                <div class="icon-box trend-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h2>Live Sales</h2>
                <p>View real-time Mandi trends and government rates for crops.</p>
                <a href="${pageContext.request.contextPath}/market/trends" class="btn btn-trend">View Live Trends</a>
            </div>
        </div>
    </div>

</body>
</html>