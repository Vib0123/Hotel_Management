<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Table</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <h2>User Information</h2>
    <table>
        <tr>
            <th>Name</th>
            <th>Aadhaar</th>
            <th>Contact</th>
            <th>Username</th>
            <th>Address</th>
            <th>Role</th>
        </tr>
        <tr>
            <td>John Doe</td>
            <td>1234-5678-9012</td>
            <td>9876543210</td>
            <td>johndoe</td>
            <td>123 Street, City</td>
            <td>Admin</td>
        </tr>
        <tr>
            <td>Jane Smith</td>
            <td>2345-6789-0123</td>
            <td>8765432109</td>
            <td>janesmith</td>
            <td>456 Avenue, City</td>
            <td>User</td>
        </tr>
    </table>
</body>
</html>
