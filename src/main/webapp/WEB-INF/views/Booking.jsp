<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Booking</title>
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

        .booking-container {
            background: white;
            width: 400px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
            text-align: left;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            width: 100%;
            font-size: 1.2em;
        }

        button:hover {
            background-color: #45a049;
        }

        .no-rooms {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="booking-container">
        <h2>Room Booking - <%= request.getParameter("category") %> Room</h2>

        <form action="confirm" method="post">
            <label for="customerName">Customer Name:</label>
            <input type="text" name="customerName" required>

            <label for="roomNo">Select Room No:</label>
            <select name="roomNo" required>
                <% 
                    java.util.List<String> rooms = (java.util.List<String>) request.getAttribute("availableRooms");
                    if (rooms != null && !rooms.isEmpty()) {
                        for (String room : rooms) {
                %>
                            <option value="<%= room %>"><%= room %></option>
                <% 
                        }
                    } else { 
                %>
                        <option value="">No Rooms Available</option>
                <% } %>
            </select>

            <label for="days">Number of Days:</label>
            <input type="number" name="days" required>

            <button type="submit">Book Now</button>
        </form>
    </div>
</body>
</html>
