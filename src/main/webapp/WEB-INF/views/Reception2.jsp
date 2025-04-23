<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>
    <link rel="stylesheet" href="Reception2.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            color: #333;
        }

        nav {
            background-color: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }

        nav .logo {
            font-size: 1.8em;
            font-weight: bold;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 30px;
        }

        .rooms {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            padding: 40px 20px;
            background-color: #f4f4f4;
        }

        .room {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            margin: 15px;
            padding: 20px;
            text-align: center;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .room img {
            width: 100%;
            border-radius: 10px;
        }

        .room button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .room button:hover {
            background-color: #45a049;
        }

        .modal-header {
            background-color: #4CAF50;
            color: white;
        }

        .checkout-btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
    </style>
    <script>
        function openCheckoutModal() {
            var checkoutModal = new bootstrap.Modal(document.getElementById("checkoutModal"));
            checkoutModal.show();
        }
    </script>
</head>
<body>
    <nav>
        <div class="logo">Hotel Management</div>
    </nav>

    <header class="header">
        <h1>Welcome to Our Hotel</h1>
        <p>Your Comfort is Our Priority</p>
    </header>
    
    <section class="rooms">
        <div class="room">
            <img src="room4.avif" alt="A/C Room">
            <h3>A/C Room</h3>
            <p>Perfect for a short stay. Comfortable and cozy.</p>
            <span>₹2000/night</span>
            <form action="booking/selectRoom" method="get">
                <button type="submit" name="category" value="A/C">Book Now</button>
            </form>
        </div>
        <div class="room">
            <img src="room5.avif" alt="Non-A/C Room">
            <h3>Non-A/C Room</h3>
            <p>Enjoy luxurious amenities and a spacious room.</p>
            <span>₹1500/night</span>
            <form action="booking/selectRoom" method="get">
                <button type="submit" name="category" value="Non-A/C">Book Now</button>
            </form>
        </div>
    </section>
    
    <div class="checkout-btn-container">
        <button class="btn btn-primary" onclick="openCheckoutModal()">Checkout</button>
    </div>
    
    <div class="modal fade" id="checkoutModal" tabindex="-1" aria-labelledby="checkoutModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="checkoutModalLabel">Checkout Room</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="booking/checkout" method="post">
                        <label for="roomNo">Room Number:</label>
                        <input type="text" id="roomNo" name="roomNo" class="form-control" required>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Checkout</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <footer>
        <p>&copy; 2025 Hotel Management. All Rights Reserved.</p>
    </footer>
</body>
</html>
