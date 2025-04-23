<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Room</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            font-family: 'Poppins', sans-serif;
        }
        .container {
            max-width: 500px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #ff7e5f;
            border: none;
        }
        .btn-primary:hover {
            background-color: #feb47b;
        }
    </style>
    <script>
        function validateForm() {
            let roomNo = document.getElementById("roomNo").value;
            let category = document.getElementById("category").value;
            let price = document.getElementById("roomPrice").value;
            
            if (roomNo.trim() === "" || isNaN(roomNo) || roomNo <= 0) {
                alert("Please enter a valid room number.");
                return false;
            }
            if (category.trim() === "") {
                alert("Please select a room category.");
                return false;
            }
            if (price.trim() === "" || isNaN(price) || price <= 0) {
                alert("Please enter a valid room price.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Add Room</h2>
        <form action="addRoom" method="post" onsubmit="return validateForm();">
            <div class="mb-3">
                <label for="roomNo" class="form-label">Room Number</label>
                <input type="number" class="form-control" id="roomNo" name="roomNo" required>
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Room Category</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="">Select Category</option>
                    <option value="A/C">A/C</option>
                    <option value="Non-A/C">Non-A/C</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="roomPrice" class="form-label">Room Price</label>
                <input type="number" class="form-control" id="roomPrice" name="roomPrice" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Add Room</button>
            <a href="dashboard.jsp" class="btn btn-secondary w-100 mt-2">Cancel</a>
        </form>
    </div>
</body>
</html>