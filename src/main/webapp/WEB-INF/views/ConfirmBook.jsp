<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .confirmation-container {
            background: white;
            width: 450px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .bill-details {
            text-align: left;
            margin-bottom: 20px;
        }
        .bill-details p {
            font-size: 16px;
            margin: 5px 0;
        }
        .total {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }
        .btn {
            display: inline-block;
            padding: 12px;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 15px;
            width: 100%;
            text-align: center;
        }
        .btn-home {
            background-color: #007bff;
            color: white;
            border: none;
        }
        .btn-home:hover {
            background-color: #0056b3;
        }
        .btn-pdf {
            background-color: #dc3545;
            color: white;
            border: none;
        }
        .btn-pdf:hover {
            background-color: #b02a37;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h2>Booking Confirmation</h2>

        <% if (request.getAttribute("message") != null) { %>
            <p style="color: green;"><%= request.getAttribute("message") %></p>
        <% } else if (request.getAttribute("error") != null) { %>
            <p style="color: red;"><%= request.getAttribute("error") %></p>
        <% } %>

        

        <a href="generatePDF" class="btn btn-pdf">Download Bill (PDF)</a>
        <a href="generateBookingPdf" class="btn btn-pdf">Download Booking Details (PDF)</a>
        <a href="index.jsp" class="btn btn-home">Go Back to Home</a>
    </div>
</body>
</html>
