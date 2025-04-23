<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bill Receipt</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Hotel Rajmudra - Bill</h2>
        <p><strong>Customer Name:</strong> ${customerName}</p>
        <p><strong>Bill ID:</strong> ${billId}</p>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Dish Name</th>
                    <th>Quantity</th>
                    <th>Price (₹)</th>
                    <th>Total (₹)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${selectedItems}">
                    <tr>
                        <td>${item.DishName}</td>
                        <td>${item.quantity}</td>
                        <td>${item.price}</td>
                        <td>${item.totalPrice}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <p><strong>Grand Total:</strong> ₹${totalAmount}</p>
    </div>
</body>
</html>
