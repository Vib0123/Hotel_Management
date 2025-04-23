<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Room Details</title>
    <link rel="stylesheet" href="updateRooms.css">
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #24d674;
    margin: 0;
    padding: 0;
}

.container {
    width: 30%;
    margin: 50px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333;
}

label {
    font-size: 1.1em;
    margin: 10px 0;
    display: block;
}

input, select {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 12px;
    background-color:  #24d674;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 1.2em;
    cursor: pointer;
}

button:hover {
    background-color:  #24d674;
}
    
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Room Details</h2>
        <label for="room-id">Select Room to Update:</label>
            <select id="room-id" name="room-id" required>
                <option value="">--Select Room--</option>
                
            </select><br><br>

            <label for="room-type">Room Type:</label>
            <input type="text" id="room-type" name="room-type" required><br><br>

            <label for="room-price">Price per Night:</label>
            <input type="number" id="room-price" name="room-price" required><br><br>

            <label for="room-status">Availability:</label>
            <select id="room-status" name="room-status" required>
                <option value="available">Available</option>
                <option value="booked">Booked</option>
                <option value="maintenance">Under Maintenance</option>
            </select><br><br>

            <button type="submit">Update Room</button>
        </form>
    </div>
</body>
</html>