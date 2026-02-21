<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- CRITICAL: You must include this line for the forEach loop to work --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dealer Portal - KisanSetu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        :root {
            --agri-green: #166534;
            --bg-creamy: #fcfcf9;
            --border-gray: #e2e8f0;
            --text-dark: #1e293b;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: var(--bg-creamy);
            margin: 0;
            color: var(--text-dark);
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
        
        .container { max-width: 1100px; margin: 0 auto; padding: 20px; }

        .back-link { text-decoration: none; color: #64748b; font-size: 14px; display: flex; align-items: center; gap: 5px; margin-bottom: 20px; }

        .form-card {
            background: white;
            border: 1px solid var(--border-gray);
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 40px;
        }

        .form-header { display: flex; align-items: center; gap: 12px; margin-bottom: 25px; }
        .form-header h2 { font-family: 'Georgia', serif; font-size: 24px; margin: 0; }
        .form-header p { color: #64748b; margin: 5px 0 0; font-size: 14px; }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .input-group label { display: block; font-size: 13px; font-weight: 600; color: #475569; margin-bottom: 8px; display: flex; align-items: center; gap: 6px; }
        
        input, select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            background-color: #f8fafc;
            box-sizing: border-box;
        }

        .btn-add {
            background-color: var(--agri-green); /* Changed to green to show it is active */
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            width: fit-content;
            display: flex;
            align-items: center; gap: 8px;
        }

        .listings-title { display: flex; align-items: center; gap: 10px; font-family: 'Georgia', serif; font-size: 22px; margin-bottom: 20px; }
        
        .listings-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .listing-card {
            background: white;
            border: 1px solid var(--border-gray);
            border-radius: 15px;
            padding: 20px;
            position: relative;
        }

        .crop-badge {
            background: #fef3c7;
            color: #92400e;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            display: inline-flex;
            align-items: center; gap: 5px;
            margin-bottom: 15px;
        }

        .price-text { font-size: 22px; font-weight: 700; color: var(--agri-green); margin-bottom: 10px; }
        .price-text span { font-size: 14px; color: #64748b; font-weight: 400; }

        .dealer-info { font-size: 14px; color: #64748b; margin-bottom: 5px; display: flex; align-items: center; gap: 8px; }
        
        .delete-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            color: #94a3b8;
            text-decoration: none;
        }
        .delete-btn:hover { color: #ef4444; }
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="/dashboard" class="logo"><i class="fas fa-leaf"></i> KisanSetu</a>
        <div style="display: flex; gap: 20px; align-items: center;">
            <span style="font-size: 13px;">EN / हिं</span>
            <a href="/logout" style="text-decoration: none; color: var(--text-dark); border: 1px solid #ddd; padding: 4px 12px; border-radius: 6px; font-size: 13px;">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </nav>

    <div class="container">
        <%-- Fixed: Using pageContext.request.contextPath ensures the link works regardless of your server setup --%>
        <a href="${pageContext.request.contextPath}/market/choice" class="back-link"><i class="fas fa-arrow-left"></i> Back</a>

        <div class="form-card">
            <div class="form-header">
                <i class="fas fa-store" style="font-size: 24px; color: var(--agri-green);"></i>
                <div>
                    <h2>Add Your Crop Listing</h2>
                    <p>Set your crop price so farmers can contact you directly</p>
                </div>
            </div>

            <%-- Fixed: Action URL matches Controller @PostMapping --%>
            <form action="${pageContext.request.contextPath}/market/add-listing" method="POST" class="form-grid">
                <div class="input-group">
                    <label><i class="fas fa-user"></i> Your Name / Shop Name</label>
                    <input type="text" name="dealerName" placeholder="e.g. Sharma Agro Traders" required>
                </div>
                <div class="input-group">
                    <label><i class="fas fa-phone"></i> Phone Number</label>
                    <input type="text" name="phone" placeholder="9876543210" required>
                </div>
                <div class="input-group">
                    <label><i class="fas fa-map-marker-alt"></i> Select Your State</label>
                    <select name="state" required>
                        <option value="">Select Your State</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Haryana">Haryana</option>
                    </select>
                </div>
                <div class="input-group">
                    <label><i class="fas fa-location-arrow"></i> Enter Your Location / Village</label>
                    <input type="text" name="location" placeholder="e.g. Amritsar, Ludhiana..." required>
                </div>
                <div class="input-group">
                    <label><i class="fas fa-seedling"></i> Select Crop</label>
                    <select name="crop" required>
                        <option value="">Select Crop</option>
                        <option value="Wheat">Wheat</option>
                        <option value="Rice">Rice</option>
                        <option value="Cotton">Cotton</option>
                    </select>
                </div>
                <div class="input-group">
                    <label><i class="fas fa-rupee-sign"></i> Price (₹ per Quintal)</label>
                    <input type="number" step="0.01" name="price" placeholder="e.g. 2200" required>
                </div>
                <button type="submit" class="btn-add">
                    <i class="fas fa-plus"></i> Add Listing
                </button>
            </form>
        </div>

        <div class="listings-title">
            <i class="fas fa-box"></i> All Listings (${count})
        </div>

        <div class="listings-grid">
            <c:forEach var="item" items="${listings}">
                <div class="listing-card">
                    <%-- Fixed: Absolute path for delete --%>
					<a href="javascript:void(0)" 
					   class="delete-btn" 
					   onclick="confirmDelete('${pageContext.request.contextPath}/market/delete/${item.id}')">
					    <i class="fas fa-trash-alt"></i>
					</a>

					<script>
					function confirmDelete(deleteUrl) {
					    Swal.fire({
					        title: 'Are you sure?',
					        text: "This listing will be permanently removed!",
					        icon: 'warning',
					        showCancelButton: true,
					        confirmButtonColor: '#166534', // Matches your agri-green
					        cancelButtonColor: '#d33',
					        confirmButtonText: 'Yes, delete it!'
					    }).then((result) => {
					        if (result.isConfirmed) {
					            window.location.href = deleteUrl;
					        }
					    })
					}
					</script>
                    
                    <div class="crop-badge">
                        <i class="fas fa-leaf"></i> ${item.crop}
                    </div>
                    <div class="price-text">₹${item.price}<span>/quintal</span></div>
                    <div class="dealer-info"><i class="fas fa-user"></i> ${item.dealerName}</div>
                    <div class="dealer-info"><i class="fas fa-map-marker-alt"></i> ${item.location}, ${item.state}</div>
                    <div class="dealer-info"><i class="fas fa-phone"></i> ${item.phone}</div>
                </div>
            </c:forEach>
        </div>
    </div>
	<c:if test="${not empty successMsg}">
	    <script>
	        Swal.fire({
	            icon: 'success',
	            title: 'Success!',
	            text: '${successMsg}',
	            timer: 3000,
	            showConfirmButton: false
	        });
	    </script>
	</c:if>
</body>
</html>