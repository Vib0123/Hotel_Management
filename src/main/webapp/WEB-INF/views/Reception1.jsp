<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hotel Rajmudra - Menu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .menu-section {
            max-width: 1200px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .category-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin: 30px 0 10px;
            color: #d9534f;
            padding-bottom: 10px;
            border-bottom: 2px solid #d9534f;
        }
        .menu-row {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: flex-start;
            padding-bottom: 10px;
        }
        .menu-card {
            width: 250px;
            background: white;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            flex-shrink: 0;
        }
        .menu-card:hover {
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
        }
        .menu-card img {
            width: 100px;
            height: 100px;
            border-radius: 8px;
            object-fit: cover;
        }
        .menu-card h5 {
            font-size: 18px;
            margin: 10px 0;
            font-weight: bold;
        }
        .menu-card p {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }
        .menu-card input[type="checkbox"] {
            margin-top: 10px;
        }
        .menu-card input[type="number"] {
            width: 80px;
            margin-top: 5px;
            text-align: center;
            display: none;
        }
        .no-data {
            text-align: center;
            font-size: 18px;
            color: #888;
            margin-top: 20px;
        }
        .error-message {
            color: red;
            font-size: 16px;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
    <script>
        function toggleQuantityInput(checkbox) {
            var quantityInput = checkbox.parentElement.querySelector('input[type="number"]');
            if (checkbox.checked) {
                quantityInput.style.display = 'block';
                quantityInput.disabled = false;
                quantityInput.value = 1; // Default quantity
            } else {
                quantityInput.style.display = 'none';
                quantityInput.disabled = true;
                quantityInput.value = ''; // Reset quantity
            }
        }
    </script>
</head>
<body>
<form action="placeOrder" method="post">
    <div class="menu-section">
        <h2 class="text-center">Hotel Menu</h2>

        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>

        <label for="customerName">Enter Customer Name:</label>
        <input type="text" id="customerName" name="customerName" required class="form-control mb-3">
        
        <c:choose>
            <c:when test="${not empty menuByCategory}">
                <c:forEach var="entry" items="${menuByCategory}">
                    <div class="category-title">${entry.key}</div>
                    <div class="menu-row">
                        <c:forEach var="menu" items="${entry.value}">
                            <div class="menu-card">
							<img src="<c:url value='${menu.dishImage}' />" alt="${menu.dishName}">
                                <h5>${menu.dishName}</h5>
                                <p>Price: ₹${menu.dishprice}</p>
                                <input type="checkbox" name="selectedMenu" value="${menu.dishId}" onclick="toggleQuantityInput(this)"> Select
                                <br>
                                <input type="number" name="quantity_${menu.dishId}" min="1" max="10" placeholder="Quantity" disabled>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="no-data">No menu items available</p>
            </c:otherwise>
        </c:choose>
        <button type="submit" class="btn btn-primary mt-3">Place Order</button>
    </div>
</form>
</body>
</html>
