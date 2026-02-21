<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Live Market Sales - AgriSmart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --agri-green: #166534; --bg-cream: #fbfbf8; }
        body { font-family: 'Segoe UI', sans-serif; background: var(--bg-cream); margin: 0; padding: 20px; }
        .dashboard-card { background: white; border-radius: 15px; padding: 30px; box-shadow: 0 10px 15px -3px rgba(0,0,0,0.1); }
        .live-dot { height: 10px; width: 10px; background-color: #ef4444; border-radius: 50%; display: inline-block; margin-right: 5px; animation: pulse 1.5s infinite; }
        @keyframes pulse { 0% { opacity: 1; } 50% { opacity: 0.3; } 100% { opacity: 1; } }
        table { width: 100%; border-collapse: collapse; margin-top: 25px; }
        th { text-align: left; padding: 12px; color: #64748b; border-bottom: 2px solid #f1f5f9; }
        td { padding: 15px; border-bottom: 1px solid #f1f5f9; }
        .price-tag { color: var(--agri-green); font-weight: bold; font-size: 1.1em; }
    </style>
</head>
<body>
    <div class="dashboard-card">
        <a href="choice" style="text-decoration:none; color:#64748b;"><i class="fas fa-arrow-left"></i> Back to Market</a>
        <h2><span class="live-dot"></span> Live Mandi Sales Data</h2>
        <p>Real-time commodity values across Indian Markets</p>

        <table>
            <thead>
                <tr>
                    <th>Commodity</th>
                    <th>Variety</th>
                    <th>Market </th>
                    <th>District/State</th>
                    <th>Price (₹/Quintal)</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach var="item" items="${trends}">
				    <tr>
				        <td>${item.commodity}</td>
				        <td>${item.variety}</td>
				        <td>${item.market}</td>
				        <td>${item.district}, ${item.state}</td>
				        <td class="price-tag">₹${item.modal_price}</td>
				    </tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>