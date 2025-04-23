<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored='false' %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room Management</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid black;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .btn {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .edit-btn {
            background-color: #ffcc00;
            color: black;
            border: none;
        }
        .save-btn {
            background-color: #28a745;
            color: white;
            border: none;
        }
        .delete-btn {
            background-color: red;
            color: white;
            border: none;
        }
        .hidden {
            display: none;
        }
    </style>
    <script>
        function editRow(roomNo) {
            document.getElementById("category_" + roomNo).removeAttribute("readonly");
            document.getElementById("price_" + roomNo).removeAttribute("readonly");
            document.getElementById("isOccupied_" + roomNo).removeAttribute("disabled");

            document.getElementById("editBtn_" + roomNo).classList.add("hidden");
            document.getElementById("saveBtn_" + roomNo).classList.remove("hidden");
        }

        function saveRow(roomNo) {
            var categoryValue = document.getElementById("category_" + roomNo).value;
            var priceValue = document.getElementById("price_" + roomNo).value;
            var isOccupiedValue = document.getElementById("isOccupied_" + roomNo).checked; // Checkbox for Occupied Status
            
            var form = document.createElement("form");
            form.method = "POST";
            form.action = "updateRoom";

            var roomInput = document.createElement("input");
            roomInput.type = "hidden";
            roomInput.name = "roomNo";
            roomInput.value = roomNo;
            form.appendChild(roomInput);

            var categoryInput = document.createElement("input");
            categoryInput.type = "hidden";
            categoryInput.name = "category";
            categoryInput.value = categoryValue;
            form.appendChild(categoryInput);

            var priceInput = document.createElement("input");
            priceInput.type = "hidden";
            priceInput.name = "price";
            priceInput.value = priceValue;
            form.appendChild(priceInput);

            var isOccupiedInput = document.createElement("input");
            isOccupiedInput.type = "hidden";
            isOccupiedInput.name = "isOccupied";
            isOccupiedInput.value = isOccupiedValue;
            form.appendChild(isOccupiedInput);

            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>
<body>

    <h2 align="center">Room Management</h2>
    
    <table>
        <tr>
            <th>Room No</th>
            <th>Category</th>
            <th>Price</th>
            <th>Occupied</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="room" items="${roomList}">
            <tr>
                <td>${room.roomNo}</td>
                <td>
                    <input type="text" id="category_${room.roomNo}" value="${room.category}" readonly>
                </td>
                <td>
                    <input type="number" id="price_${room.roomNo}" value="${room.roomprice}" readonly>
                </td>
                <td>
                    <input type="checkbox" id="isOccupied_${room.roomNo}" ${room.is_Occupied ? 'checked' : ''} disabled>
                </td>
                <td>
                    <button id="editBtn_${room.roomNo}" class="btn edit-btn" onclick="editRow(${room.roomNo})">Edit</button>
                    <button id="saveBtn_${room.roomNo}" class="btn save-btn hidden" onclick="saveRow(${room.roomNo})">Save</button>
                    <a href="deleteRoom?roomNo=${room.roomNo}" class="btn delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
        </c:forEach>

    </table>

</body>
</html>
