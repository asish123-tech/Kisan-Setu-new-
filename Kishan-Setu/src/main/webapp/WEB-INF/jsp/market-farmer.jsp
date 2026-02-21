<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find Best Prices - AgriSmart</title>
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

        .navbar {
            background: white;
            padding: 12px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eee;
        }
        .logo { color: var(--agri-green); font-weight: 700; font-size: 20px; text-decoration: none; display: flex; align-items: center; gap: 8px; }

        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .back-btn { text-decoration: none; color: #64748b; font-size: 14px; margin-bottom: 20px; display: inline-block; }

        .search-card {
            background: white;
            border: 1px solid var(--agri-green);
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 30px;
        }
        
        .search-header h2 { font-family: 'Georgia', serif; font-size: 24px; margin: 0 0 10px 0; }
        .search-header p { color: #64748b; margin: 0 0 25px 0; font-size: 14px; }

        .search-form {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            align-items: end;
        }

        .input-group label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; color: #334155; }
        select, input {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--border);
            border-radius: 8px;
            background: #f8fafc;
            outline: none;
        }

        .btn-search {
            background: var(--agri-green);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .results-header {
            display: flex;
            align-items: center; gap: 10px;
            font-family: 'Georgia', serif; font-size: 20px;
            margin-bottom: 20px;
        }
        .count-badge { background: #f1f5f9; padding: 2px 10px; border-radius: 20px; font-size: 12px; }

        .results-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 25px;
        }

        .dealer-card {
            background: white;
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 25px 20px 20px 20px; 
            position: relative; 
            margin-top: 10px;    
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
        }

        .best-price-tag {
            position: absolute;
            top: -12px; right: 15px;
            background: #15803d; color: white;
            padding: 5px 12px; border-radius: 20px;
            font-size: 11px; font-weight: 700;
            z-index: 10;       
        }

        /* Styling for the "No Results" message */
        .no-results {
            background: white;
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            border: 1px dashed #cbd5e1;
            margin-top: 20px;
        }
        .no-results i { font-size: 48px; color: #94a3b8; margin-bottom: 15px; }
        .no-results h3 { margin: 0; color: #475569; }
        .no-results p { color: #64748b; margin-top: 5px; }

        .crop-type { font-size: 12px; background: #fef3c7; color: #92400e; padding: 4px 10px; border-radius: 15px; display: inline-block; margin-bottom: 15px; }
        .price-val { font-size: 24px; font-weight: 700; color: var(--agri-green); margin-bottom: 15px; border-bottom: 1px solid #f1f5f9; padding-bottom: 10px; }
        .price-val span { font-size: 14px; font-weight: 400; color: #64748b; }

        .info-row { display: flex; align-items: center; gap: 10px; font-size: 14px; color: #475569; margin-bottom: 8px; }
        .info-row i { color: #94a3b8; width: 16px; }
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
        <a href="${pageContext.request.contextPath}/market/choice" class="back-btn"><i class="fas fa-arrow-left"></i> Back</a>

        <div class="search-card">
            <div class="search-header">
                <h2><i class="fas fa-search"></i> Find Best Prices for Your Crop</h2>
                <p>Enter your crop and location to find dealers with the best prices</p>
            </div>

            <form action="${pageContext.request.contextPath}/market/search-dealers" method="POST" class="search-form">
                <div class="input-group">
                    <label><i class="fas fa-seedling"></i> Select Crop</label>
                    <select name="crop">
                        <option value="Cotton">Cotton</option>
                        <option value="Wheat">Wheat</option>
                        <option value="Rice">Rice</option>
                    </select>
                </div>
                <div class="input-group">
                    <label><i class="fas fa-map-marker-alt"></i> Your State</label>
                    <select name="state">
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Haryana">Haryana</option>
                    </select>
                </div>
                <div class="input-group">
                    <label><i class="fas fa-location"></i> Your Location</label>
                    <input type="text" name="location" placeholder="e.g. jaipur" required>
                </div>
                <button type="submit" class="btn-search">
                    <i class="fas fa-search"></i> Search Dealers
                </button>
            </form>
        </div>

        <%-- Check if results are found --%>
        <c:choose>
            <c:when test="${not empty dealers}">
                <div class="results-header">
                    <i class="fas fa-store"></i> Dealers for ${searchCrop} 
                    <span class="count-badge">${count} found</span>
                </div>

                <div class="results-grid">
                    <c:forEach var="dealer" items="${dealers}">
                        <div class="dealer-card">
                            <c:if test="${dealer.price == minPrice}">
                                <div class="best-price-tag">Best Price</div>
                            </c:if>

                            <div class="crop-type"><i class="fas fa-wheat-awn"></i> ${dealer.crop}</div>
                            <div class="price-val">₹${dealer.price}<span>/quintal</span></div>
                            
                            <div class="info-row"><i class="fas fa-user"></i> ${dealer.dealerName}</div>
                            <div class="info-row"><i class="fas fa-map-marker-alt"></i> ${dealer.location}, ${dealer.state}</div>
                            <div class="info-row"><i class="fas fa-phone"></i> ${dealer.phone}</div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            
            <%-- If search was done but list is empty --%>
            <c:when test="${not empty searchCrop}">
                <div class="no-results">
                    <i class="fas fa-store-slash"></i>
                    <h3>Sorry, no dealers found!</h3>
                    <p>We couldn't find any ${searchCrop} listings in the entered location. Try searching a different area or state.</p>
                </div>
            </c:when>
        </c:choose>
    </div>

</body>
</html>