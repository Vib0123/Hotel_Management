<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <link rel="stylesheet" href="Registration.css">
    <style>
        /* General Styles */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            font-family: Arial, sans-serif;
        }

        .container {
            width: 350px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .row {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .save {
            margin-top: 15px;
        }

        .save input {
            background: #28a745;
            color: white;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background 0.3s;
        }

        .save input:hover {
            background: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registration Form</h1>
        <form action="register" method="post">
            <div class="row">
                <label for="name">Name:</label>
                <input type="text" name="Name" id="name" placeholder="Enter your name" required>
            </div>
            <div class="row">
                <label for="username">Username:</label>
                <input type="text" name="Username" id="username" placeholder="Enter your username" required>
            </div>
            <div class="row">
                <label for="password">Password:</label>
                <input type="password" name="Password" id="password" placeholder="Enter your password" required>
            </div>
            <div class="row">
                <label for="address">Address:</label>
                <input type="text" name="Address" id="address" placeholder="Enter your address" required>
            </div>
            <div class="row">
                <label for="aadhar">Aadhar No:</label>
                <input type="text" name="AddharNo" id="aadhar" placeholder="Enter your Aadhar number" required>
            </div>
            <div class="row">
                <label for="contact">Contact No:</label>
                <input type="text" name="ContactNo" id="contact" placeholder="Enter your contact number" required>
            </div>
            <div class="row">
                <label for="role">Role:</label>
                <select name="Role" id="role" required>
                    <option value="User">User</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>
            <div class="save">
                <input type="submit" value="Register">
            </div>
        </form>
    </div>
</body>
</html>
