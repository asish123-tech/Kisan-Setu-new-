<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>KisanSetu - Water Intelligence</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/all.min.css">
    <style>
        :root {
            --safe-green: #2ecc71;
            --warning-yellow: #f1c40f;
            --danger-red: #e74c3c;
        }
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .water-card { border: none; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); transition: 0.3s; }
        .gauge-container { height: 300px; width: 60px; background: #e9ecef; border-radius: 30px; position: relative; margin: 0 auto; border: 3px solid #dee2e6; }
        .gauge-fill { width: 100%; position: absolute; bottom: 0; border-radius: 0 0 30px 30px; transition: height 1s ease-in-out; }
        .status-badge { padding: 8px 20px; border-radius: 20px; font-weight: bold; font-size: 1.1rem; }
        .advice-box { background: #fff; border-left: 5px solid #007bff; padding: 15px; border-radius: 5px; margin-top: 20px; }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold"><i class="fas fa-droplet text-primary"></i> Ground Water Status</h2>
        <p class="text-muted">Location: <strong>${village}, ${district}</strong></p>
    </div>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card water-card p-4 text-center">
                <h5>Water Depth</h5>
                <div class="gauge-container my-3">
                    <div class="gauge-fill" 
                         style="height: ${100 - (waterLevel * 4)}%; 
                                background-color: ${waterLevel < 7 ? '#2ecc71' : (waterLevel < 15 ? '#f1c40f' : '#e74c3c')};">
                    </div>
                </div>
                <h3 class="fw-bold">${waterLevel} <small>meters</small></h3>
                <p class="text-muted">Below Ground Level</p>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card water-card p-4 h-100">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4 class="m-0">Health Analysis</h4>
                    <span class="status-badge 
                        ${waterLevel < 7 ? 'bg-success-subtle text-success' : (waterLevel < 15 ? 'bg-warning-subtle text-dark' : 'bg-danger-subtle text-danger')}">
                        ${waterStatus}
                    </span>
                </div>

                <div class="row text-center mb-4">
                    <div class="col-6 border-end">
                        <p class="text-muted mb-1">Last 10 Year Trend</p>
                        <h5 class="${trendColor}"><i class="fas ${trendIcon}"></i> ${trendText}</h5>
                    </div>
                    <div class="col-6">
                        <p class="text-muted mb-1">Availability</p>
                        <h5>${availabilityText}</h5>
                    </div>
                </div>

                <div class="advice-box">
                    <h6 class="fw-bold"><i class="fas fa-lightbulb text-warning"></i> Farmer Advice:</h6>
                    <p class="mb-0">${farmerAdvice}</p>
                </div>

                <div class="mt-4">
                    <button class="btn btn-outline-primary btn-sm"><i class="fas fa-history"></i> View Full 30-Year History</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>