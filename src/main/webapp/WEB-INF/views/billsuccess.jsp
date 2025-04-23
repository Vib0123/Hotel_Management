<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bill Generated Successfully</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .bill-container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .bill-header {
            font-size: 24px;
            font-weight: bold;
            color: green;
            margin-bottom: 15px;
        }
        .customer-info {
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .download-btn {
            margin-top: 20px;
        }
        .home-btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>

  <h2>🎉 Order Successful!</h2>
    <p>Customer Name: ${customerName}</p>
    <p>Bill ID: ${billId}</p>

    <a href="downloadBill?billId=${billId}" class="btn btn-primary">📥 Download Bill PDF</a>
    <br>
    <a href="menuPage.jsp" class="btn btn-secondary home-btn">🏠 Back to Menu</a>
</div>

</body>
</html>
