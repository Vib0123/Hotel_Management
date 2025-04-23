<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Hotel Management System</title>
    <link rel="stylesheet" href="Aboutus.css">
    <style>
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    color: #333;
}

header {
    background-color: #333;
    color: white;
    padding: 1rem 0;
    padding-left: 700px;
}

header nav ul {
    list-style-type: none;
    padding: 0;
    text-align: center;
}

header nav ul li {
    display: inline;
    margin: 0 15px;
}

header nav ul li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
    padding-right:10px;
}

header nav ul li a:hover {
    color: #f4a261;
}

footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 1rem;
    position: fixed;
    width: 100%;
    bottom: 0;
}


.about-section {
    max-width: 1000px;
    margin: 50px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.about-section h1 {
    text-align: center;
    font-size: 36px;
    color: #333;
}

.about-section p {
    font-size: 18px;
    line-height: 1.6;
}

.about-section h2 {
    color: #f4a261;
    font-size: 28px;
    margin-top: 30px;
}

.about-section ul {
    list-style-type: square;
    margin: 20px 0;
}

.about-section ul li {
    font-size: 18px;
    margin: 5px 0;
}
    </style>
</head>
<body>
    <header>
        <nav>
            <h1>About Us</h1>
        </nav>
    </header>
    
    <section class="about-section">
        
        <p>Welcome to our Hotel Management System! We strive to provide the best service to our guests. Whether you're staying for business or leisure, we ensure a comfortable and luxurious experience.</p>
        
        <h2>Our Mission</h2>
        <p>Our mission is to make every guest feel at home by offering world-class services in a comfortable, safe, and welcoming environment.</p>
        
        <h2>Our Vision</h2>
        <p>To be the leading hotel in the industry by creating memorable experiences for every guest, offering exceptional services, and innovating for the future of hospitality.</p>
        
        <h2>Why Choose Us?</h2>
        <ul>
            <li>Premium Service</li>
            <li>Comfortable Rooms</li>
            <li>Top-Quality Amenities</li>
            <li>Friendly and Professional Staff</li>
        </ul>
    </section>

    <footer>
        <p>&copy; 2025 Hotel Management System. All rights reserved.</p>
    </footer>
</body>
</html>