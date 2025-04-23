<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    String adminName = (String) session.getAttribute("loggedInUser");
    if (adminName == null) {
        response.sendRedirect("login"); 
        return;// Redirect to login if not logged in
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="Admin.css">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
      color: #333;
    }

    .admin-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #4bb9da;
      color: white;
      padding: 10px 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .logo {
      font-size: 24px;
      font-weight: bold;
      text-transform: uppercase;
    }

    .admin-nav {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .admin-nav span {
      font-size: 16px;
      font-weight: bold;
    }

    .admin-nav button {
      background-color: #ff4d4d;
      color: white;
      border: none;
      padding: 8px 16px;
      font-size: 14px;
      font-weight: bold;
      border-radius: 5px;
      cursor: pointer;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      transition: background-color 0.3s, transform 0.2s;
    }

    .admin-nav button:hover {
      background-color: #cc0000;
    }

    .admin-nav .profile-btn {
      background-color: #ffcc00;
      color: black;
      margin-right: 10px;
    }

    .admin-main {
      text-align: center;
      margin-top: 50px;
    }

    .container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      padding: 2em;
    }

    .card {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      margin: 1em;
      padding: 1.5em;
      width: 300px;
      text-align: center;
      transition: transform 0.3s;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card h3 {
      color: #bb4f4f;
      margin-bottom: 1em;
    }

    .card button {
      background-color: #4bb9da;
      color: white;
      border: none;
      padding: 0.7em 1.5em;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1em;
      transition: background-color 0.3s;
    }

    .card button:hover {
      background-color: #021632;
    }

    .admin-footer {
      text-align: center;
      background-color: #4bb9da;
      color: white;
      padding: 10px;
      position: fixed;
      bottom: 0;
      width: 100%;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <header class="admin-header">
    <div class="logo">Hotel Management System</div>
    <nav class="admin-nav">
      <span>Hello, <%= adminName %></span>
      <button type="button" class="profile-btn" onclick="location.href='profile'">My Profile</button>
      <button type="button" onclick="location.href='logout'">Logout</button>
    </nav>
  </header>

  <main class="admin-main">
    <h1>Hotel Rajmudra</h1>
    <p>Select an option from the menu to get started.</p>
  </main>

  <div class="container">
    <div class="card">
      <h3>Add Menu</h3>
      <button onclick="location.href='addmenu'">Add Menu</button>
    </div>
    
    <div class="card">
      <h3>Show All Menus</h3>
      <button onclick="location.href='showMenu'">View Menus</button>
    </div>

    <div class="card">
      <h3>Add Room</h3>
      <button onclick="location.href='AddRoom'">Add Room</button>
    </div>

    <div class="card">
  <h3>Show All Rooms</h3>
  <button onclick="location.href='show'">View Rooms</button>
</div>
<div class="card">
      <h3>Add Receptionist/Admin</h3>
      <button onclick="location.href='Register'">Add Receptionist/Admin</button>
    </div>

  </div>

  <footer class="admin-footer">
    © 2025 Hotel Rajmudra. All rights reserved.
  </footer>
</body>
</html>
