<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Retrieve session data
    String username = (String) session.getAttribute("loggedInUser");
    if (username == null) {
        response.sendRedirect("login"); // Redirect to login if session expired
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Landing Page</title>
    <link rel="stylesheet" href="Landingpageforuser.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; }
        .container { width: 90%; max-width: 1200px; margin: 0 auto; padding: 20px; }
        section { background-color: #fff; margin-bottom: 20px; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }

        /* Navbar Styling */
        .navbar { background-color: #007bff; padding: 10px; color: white; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; padding: 10px 15px; border-radius: 5px; transition: background 0.3s; }
        .navbar a:hover { background: #0056b3; }
        .navbar .nav-right { display: flex; align-items: center; }
        .navbar .nav-right span { margin-right: 15px; font-weight: bold; }
        .btn-logout { background-color: red; border: none; color: white; padding: 8px 15px; border-radius: 5px; cursor: pointer; }
        .btn-logout:hover { background-color: darkred; }

        /* Sections */
        .dine-section { background-color: #fff9c4; text-align: center; }
        .stay-section { background-color: #e0f7fa; text-align: center; }
        .dine-section h2, .stay-section h2 { margin-bottom: 10px; }
        .stay-section h2 { color: #ed10cc; font-size: 30px; }
        .dine-section button, .stay-section button { background-color: #f57f17; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; transition: background-color 0.3s ease; }
        .dine-image, .stay-image { margin-top: 10px; text-align: center; }

        /* Responsive */
        @media (max-width: 768px) {
            .container { width: 100%; padding: 10px; }
            section { margin-bottom: 10px; }
            button { width: 100%; padding: 12px; font-size: 18px; }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div><span>Hotel Rajmudra</span></div>
        <div class="nav-right">
            <span>Hello, <%= username %>!</span>
            <a href="profile">My Profile</a>
            <form action="logout" method="post" style="display:inline;">
                <button type="submit" class="btn-logout">Logout</button>
            </form>
        </div>
    </div>

    <!-- Dine Section -->
    <section class="dine-section">
        <h2>Dine with Us</h2>
        <marquee><p>Our restaurant offers a variety of delicious cuisines made with the finest ingredients. Enjoy a relaxing dining experience with stunning views.</p></marquee>
        <div class="dine-image">
            <img src="resources/images/dineimg.jpg" alt="Dining Experience" width="400"><br><br>
            <a href="Reception1"><button class="btn btn-danger">Book your Dine</button></a>
        </div>
    </section>

    <!-- Stay Section -->
    <section class="stay-section">
        <h2>Stay with Us</h2>
        <marquee><p>Experience luxury, comfort, and exceptional service in our beautiful rooms. We offer a wide range of accommodations to suit your needs.</p></marquee>
        <div class="stay-image">
            <img src="resources/images/roomimg.avif" alt="Hotel Room" width="400"><br><br>
        </div>
        <a href="Reception2"><button class="btn btn-danger">Book Your Stay</button></a>
    </section>

</body>
</html>
