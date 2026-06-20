<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background-color: #e9ecef; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .profile-card { margin-top: 50px; border: none; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        .card-header { background: linear-gradient(135deg, #0d6efd, #0dcaf0); color: white; border-radius: 15px 15px 0 0 !important; }
        .uploaded-pic { 
            width: 120px; 
            height: 120px; 
            margin-top: -60px; 
            border-radius: 50%; 
            border: 5px solid white; 
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
            background-color: white;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="alert alert-success mt-4 text-center shadow-sm" role="alert">
                    <i class="fa-solid fa-circle-check"></i> Profile Successfully Saved to Database!
                </div>

                <div class="card profile-card text-center pb-4 mt-2">
                    <div class="card-header py-5"></div>
                    <div class="card-body mt-n4">
                        <div class="uploaded-pic text-primary">
                            <i class="fa-solid fa-user fa-4x"></i>
                        </div>
                        <h3 class="card-title mt-3 fw-bold">${profile.name}</h3>
                        <p class="text-muted mb-4"><i class="fa-solid fa-graduation-cap"></i> ${profile.programme}</p>
                        <ul class="list-group list-group-flush text-start">
                            <li class="list-group-item"><strong><i class="fa-solid fa-id-badge text-primary"></i> Student ID:</strong> ${profile.studentID}</li>
                            <li class="list-group-item"><strong><i class="fa-solid fa-envelope text-primary"></i> Email:</strong> ${profile.email}</li>
                            <li class="list-group-item"><strong><i class="fa-solid fa-gamepad text-primary"></i> Hobbies:</strong> ${profile.hobbies}</li>
                            <li class="list-group-item"><strong><i class="fa-solid fa-comment text-primary"></i> About Me:</strong><br><p class="mt-2 text-secondary">${profile.introduction}</p></li>
                        </ul>
                    </div>
                    <div class="card-footer bg-transparent border-0 d-flex justify-content-center gap-2">
                        <a href="ProfileServlet" class="btn btn-primary"><i class="fa-solid fa-users"></i> View All Profiles</a>
                        <a href="index.html" class="btn btn-outline-secondary"><i class="fa-solid fa-plus"></i> Add Another</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>