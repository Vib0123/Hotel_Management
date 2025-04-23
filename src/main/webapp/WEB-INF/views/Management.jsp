<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
    <title>Hotel Rajmudra</title>
    <link rel="stylesheet" href="management.css">
    <style>
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background: #f4f4f4;
    text-align: center;
}
header {
    background: #8B0000;
    color: white;
    padding: 20px;
    font-size: 30px;
    font-weight: bold;
    text-shadow: 2px 2px 4px #000;
}
.marquee-container {
    background: #FFD700;
    padding: 10px;
    font-size: 20px;
    font-weight: bold;
    color: #8B0000;
}
.content {
    padding: 20px;
    color:#000;
}
.advertisement {
    background: rgb(227, 196, 201);
    padding: 20px;
    margin: 20px auto;
    width: 80%;
    border: 3px solid #8B0000;
    box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.3);
    text-align: center;
}
.footer {
    background: #8B0000;
    color: white;
    padding: 15px;
    position: fixed;
    bottom: 0;
    width: 100%;
    font-size: 18px;
}
nav {
    background: #333;
    padding: 15px;
}
nav a {
    color: white;
    margin: 0 20px;
    text-decoration: none;
    font-size: 20px;
    font-weight: bold;
}
nav :hover{
    color:rgb(75, 46, 192);
}

section {
    padding: 3rem 2rem;
    text-align: center;
}
section h2{
    color:rgb(114, 16, 205);
    font-size: 30px;
}

.features {
    display: flex;
    flex-wrap: wrap;
    gap: 2rem;
    justify-content: center;
}

.feature {
    background: white;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 1.5rem;
    width: 300px;
}
.feature h3 {
    color: #9feb25;
    margin-bottom: 1rem;
}
.feature p {
    color: #555;
}
footer {
    background: #770707;
    color: white;
    padding: 1.5rem;
    text-align: center;
}
    
    </style>
</head>
<body style=" background-image:url('resources/images/backgroundimg1.avif'); background-repeat: no-repeat; background-size: cover;">
    <header>Welcome to Hotel Rajmudra</header>
    
    <nav>
        <a href="">Home</a>
        <a href="AboutUs">About Us</a>
        <a href="Contact">Contact</a>
        <a href="Gallery">Gallery</a>
        <a href="login">Login</a>
    </nav>
    
    <div class="marquee-container">
        <marquee behavior="scroll" direction="left">✨ Special Offer! Book now and get 20% off on your stay. Limited time only! ✨</marquee>
    </div>
    
    <div class="content" >
        <h2>Experience Luxury & Comfort</h2>
        <p>Hotel Rajmudra offers the finest hospitality with premium rooms, delicious cuisine, and world-class service.</p>
    </div>
    
    <div class="advertisement"  >
        <h3>Advertisement</h3>
        <p>Looking for a perfect vacation? Stay with us at Hotel Rajmudra and enjoy unparalleled hospitality.</p>
    
    </div>

    <section>
        <h2>Our Features</h2>
        <div class="features">
            <div class="feature">
                <h3>Elegant Rooms</h3>
                <p>Relax in spacious and beautifully designed rooms with premium amenities.</p>
            </div>
            <div class="feature">
                <h3>Gourmet Dining</h3>
                <p>Indulge in world-class cuisine prepared by our top chefs.</p>
            </div>
            <div class="feature">
                <h3>Event Spaces</h3>
                <p>Host memorable events in our state-of-the-art venues.</p>
            </div>
            <div class="feature">
                <h3>Wellness & Spa</h3>
                <p>Unwind with rejuvenating treatments at our luxury spa.</p>
            </div>
        </div>
    </section>
    
    <footer>
        Contact Us: +91 8459446272 | Email: sakshikashidkar@gmail.com
    </footer>
</body>
</html>