<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Rajmudra Gallery</title>
    
    <!-- Link to CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/Gallery.css'/>">

    <style>
        h1 {
            font-size: 50px;
            text-transform: uppercase;
            color: #333;
            margin-bottom: 10px;
        }
        p {
            font-size: 20px;
            color: #007bff;
            margin-bottom: 20px;
        }
        .gallery-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            padding: 20px;
        }
        .gallery-container img {
            height: 360px;
            width: 495px;
            border-radius: 10px;
            box-shadow: 3px 3px 12px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease-in-out;
        }
        .gallery-container img:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <header>
        <center>
            <h1>Gallery</h1>
            <p>Explore Hotel Rajmudra Image Gallery</p>
        </center>
    </header>

    <div class="gallery-container">
<img src="<c:url value='/resources/images/Gallery15.avif'/>" alt="Gallery Image 15">
<img src="<c:url value='/resources/images/Gallery5.jpg'/>" alt="Gallery Image 5">
<img src="<c:url value='/resources/images/Gallery3.jpg'/>" alt="Gallery Image 3">

        <img src="<c:url value='/resources/images/Gallery4.jpg'/>" alt="Gallery Image 4">
        <img src="<c:url value='/resources/images/Gallery1.jpg'/>" alt="Gallery Image 1">
        <img src="<c:url value='/resources/images/Gallery7.jpg'/>" alt="Gallery Image 7">
        <img src="<c:url value='/resources/images/Gallery8.webp'/>" alt="Gallery Image 8">
        <img src="<c:url value='/resources/images/Gallery9.jpg'/>" alt="Gallery Image 9">
        <img src="<c:url value='/resources/images/Gallery10.jpg'/>" alt="Gallery Image 10">
        <img src="<c:url value='/resources/images/Gallery11.avif'/>" alt="Gallery Image 11">
        <img src="<c:url value='/resources/images/Gallery12.jpg'/>" alt="Gallery Image 12">
<img src="<c:url value='/resources/images/Gallery13.jpg' />">
        <img src="<c:url value='/resources/images/Gallery14.jpg'/>" alt="Gallery Image 14">
        <img src="<c:url value='/resources/images/Gallery15.avif'/>" alt="Gallery Image 15">
    </div>

</body>
</html>
