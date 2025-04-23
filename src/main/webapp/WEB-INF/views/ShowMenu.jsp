<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu List</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
            text-transform: uppercase;
        }
        tr:hover {
            background-color: #f1f1f1;
            transition: 0.3s;
        }

        /* Editable Fields */
        .editField {
            width: 100%;
            border: none;
            text-align: center;
            background: transparent;
            font-size: 14px;
            font-weight: bold;
        }
        .editField:focus {
            background: #e9ecef;
            border: 1px solid #007bff;
            outline: none;
            padding: 5px;
            border-radius: 5px;
        }

        /* Image Styling */
        .menu-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            transition: transform 0.3s ease-in-out;
        }
        .menu-image:hover {
            transform: scale(1.1);
        }

        /* Button Styling */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .edit-btn, .save-btn, .delete-btn {
            padding: 8px 15px;
            cursor: pointer;
            border: none;
            font-weight: bold;
            border-radius: 5px;
            transition: 0.3s ease-in-out;
        }
        .edit-btn {
            background-color: #28a745;
            color: white;
        }
        .edit-btn:hover {
            background-color: #218838;
        }
        .save-btn {
            background-color: #007bff;
            color: white;
            display: none;
        }
        .save-btn:hover {
            background-color: #0056b3;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 100%;
            }
            .action-buttons {
                flex-direction: column;
            }
            .edit-btn, .save-btn, .delete-btn {
                width: 100%;
                margin-bottom: 5px;
            }
        }
    </style>
    <script>
        function enableEdit(rowId) {
            let row = document.getElementById(rowId);
            let inputs = row.querySelectorAll(".editField");
            inputs.forEach(input => {
                input.removeAttribute("readonly");
                input.style.background = "#e9ecef";
                input.style.border = "1px solid #007bff";
            });

            row.querySelector(".save-btn").style.display = "inline-block"; // Show Save button
            row.querySelector(".edit-btn").style.display = "none"; // Hide Edit button
        }
    </script>
</head>
<body>
    <h2>Menu List</h2>
    <table>
        <tr>
            <th>Dish ID</th>
            <th>Dish Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        
        <c:forEach var="menu" items="${menus}" varStatus="loop">
            <tr id="row-${loop.index}">
                <form action="updateMenu" method="post">
                    <td><input type="text" name="dishId" value="${menu.dishId}" readonly class="editField"></td>
                    <td><input type="text" name="dishName" value="${menu.dishName}" readonly class="editField"></td>
                    <td><input type="text" name="dishCategory" value="${menu.dishCategory}" readonly class="editField"></td>
                    <td><input type="text" name="dishprice" value="${menu.dishprice}" readonly class="editField"></td>
                    <td>
                        <img src="${menu.dishImage}" alt="Dish Image" class="menu-image">
                        <input type="hidden" name="dishImage" value="${menu.dishImage}">
                    </td>
                    <td class="action-buttons">
                        <button type="button" class="edit-btn" onclick="enableEdit('row-${loop.index}')">Edit</button>
                        <button type="submit" class="save-btn">Save</button>
                        <a href="deleteMenu?menuId=${menu.dishId}" onclick="return confirm('Are you sure?');">
                            <button type="button" class="delete-btn">Delete</button>
                        </a>
                    </td>
                </form>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
