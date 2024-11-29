<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style.css">
    <%@include file="allcss.jsp"%>
</head>
<body>
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner" style="height: 85vh">
        <div class="carousel-item active position-relative">
            <img src="img/doc1.jpg" class="d-block w-100" alt="...">
            <div class="text_con position-absolute">
                <h2><span class="text-Primary">Hi</span>, I'm <span class="text-white text-bold">Mitzi </span>, providing you<br/> best health care</h2>
                <p>Cardiothoracic Surgeon</p>
                <p>Ph.D of Br Nyr</p>
                <button class="btn bg-primary text-white mt-2">Take Appointment</button>
            </div>

        </div>
        <div class="carousel-item position-relative">
            <img src="img/doc2.jpg" class="d-block w-100" alt="...">
            <div class="text_con left position-absolute">
                <h2><span class="text-Primary">Hi</span>, I'm <span class="text-white text-bold">Mitzi </span>, providing you<br/> best health care</h2>
                <p>Cardiothoracic Surgeon</p>
                <p>Ph.D of Br Nyr</p>
                <button class="btn bg-primary text-white mt-2">Take Appointment</button>
            </div>
        </div>
        <div class="carousel-item position-relative">
            <img src="img/doc3.jpg" class="d-block w-100" alt="...">
            <div class="text_con position-absolute">
                <h2><span class="text-Primary">Hi</span>, I'm <span class="text-white text-bold">Mitzi </span>, providing you<br/> best health care</h2>
                <p>Cardiothoracic Surgeon</p>
                <p>Ph.D of Br Nyr</p>
                <button class="btn bg-primary text-white mt-2">Take Appointment</button>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
</body>
</html>