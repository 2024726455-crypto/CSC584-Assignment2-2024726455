<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow border-0">
            <div class="card-header bg-dark text-white text-center py-3">
                <h2 class="mb-0"><i class="fa-solid fa-users"></i> Student Profiles Database</h2>
            </div>
            <div class="card-body p-4">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Student ID</th>
                                <th>Name</th>
                                <th>Programme</th>
                                <th>Email</th>
                                <th>Hobbies</th>
                                <th>Introduction</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${listProfile}">
                                <tr>
                                    <td>${p.studentID}</td>
                                    <td>${p.name}</td>
                                    <td>${p.programme}</td>
                                    <td>${p.email}</td>
                                    <td>${p.hobbies}</td>
                                    <td>${p.introduction}</td>
                                    <td class="text-center">
                                        <a href="ProfileServlet?action=delete&id=${p.studentID}" 
                                           class="btn btn-danger btn-sm shadow-sm" 
                                           onclick="return confirm('Are you sure you want to delete this profile?');">
                                           <i class="fa-solid fa-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="text-center mt-4">
                    <a href="index.html" class="btn btn-success"><i class="fa-solid fa-user-plus"></i> Add New Profile</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>