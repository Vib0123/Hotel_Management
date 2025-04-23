<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="hotel.Model.Userinfo, jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession();
    String username = (String) sessionObj.getAttribute("loggedInUser");
    Userinfo user = (Userinfo) sessionObj.getAttribute("userDetails");

    if (username == null || user == null) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f8f9fa; }
        .container { max-width: 600px; margin: 50px auto; padding: 20px; background: white; border-radius: 8px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); }
        .btn-primary { background-color: #007bff; border: none; }
        .btn-primary:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">User Profile</h2>
        <form action="updateProfile" method="post">
            <div class="mb-3">
                <label>Name:</label>
                <input type="text" class="form-control" name="name" value="<%= user.getName() %>" required>
            </div>
            <div class="mb-3">
                <label>Address:</label>
                <input type="text" class="form-control" name="address" value="<%= user.getAddress() %>" required>
            </div>
            <div class="mb-3">
                <label>Aadhar No:</label>
                <input type="text" class="form-control" name="addharNo" value="<%= user.getAddharNo() %>" readonly>
            </div>
            <div class="mb-3">
                <label>Contact No:</label>
                <input type="text" class="form-control" name="contactNo" value="<%= user.getContactNo() %>" required>
            </div>
            <div class="mb-3">
                <label>Username:</label>
                <input type="text" class="form-control" name="username" value="<%= user.getUserName() %>" readonly>
            </div>
            <div class="mb-3">
                <label>New Password:</label>
                <input type="password" class="form-control" name="password">
            </div>
            <button type="submit" class="btn btn-primary w-100">Update Profile</button>
        </form>
    </div>
</body>
</html>
