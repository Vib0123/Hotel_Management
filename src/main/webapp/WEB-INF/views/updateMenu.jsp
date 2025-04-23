<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Menu Update</title>
    <link rel="stylesheet" href="updateMenu.css">
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #80a8dc;
    margin: 0;
    padding: 0;
}

.container {
    width: 40%;
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

input, select, textarea {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 12px;
    background-color: #80a8dc;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 1.2em;
    cursor: pointer;
}

button:hover {
    background-color:  #80a8dc;
}
    </style>
</head>
<body>
<form>
    <div class="container">
        <h2>Update Hotel Menu</h2>

        <label for="Dish-Id">DishID:</label>
        <input type="text" id="Dish-Id" name="Dish-Id" required><br><br>

            <label for="menu-name">DishName:</label>
            <input type="text" id="menu-name" name="menu-name" required><br><br>


            <label for="menu-price">Price:</label>
            <input type="text" id="menu-price" name="menu-price" required><br><br>

            <label for="menu-category">Category:</label>
            <select id="menu-category" name="menu-category">
                <option value="Maharastrian">Maharastrian</option>
                <option value="punjabi">punjabi</option>
                <option value="Italian">Italian</option>
                <option value="South Indian">South Indian</option>
                <option value="Chinese">Chinese</option>

            </select><br><br>

            
            <button type="submit">Update Menu</button>
        </form>
    </div>
</body>
</html>