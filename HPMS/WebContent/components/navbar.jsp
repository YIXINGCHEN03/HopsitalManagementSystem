<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%@include file="allcss.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Medical Plus</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
            
            <c:if test="${empty userObj }">
          		<li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user_appointment.jsp">Appointment</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user_doctor.jsp">Doctors</a>
                </li>
                
            </ul>
            
            	<ul class="navbar-nav mb-2 mb-lg-0">
               		<li class="nav-item">
                    	<a class="nav-link" href="login.jsp"><i class="fa-solid fa-user"></i>&nbsp;Login</a>
                	</li>  	
                	<li class="nav-item">
                    	<a class="nav-link" href="signup.jsp"><i class="fa-solid fa-right-to-bracket"></i>&nbsp;Sign Up</a>
                	</li>  	
            </c:if>
            
            
          
                
                <c:if test="${not empty userObj }">
					<li class="nav-item">
                    	<a class="nav-link" href="index.jsp">Home</a>
                	</li>
                	<li class="nav-item">
                    	<a class="nav-link" href="user_appointment.jsp">Appointment</a>
                	</li>
                	<li class="nav-item">
                    	<a class="nav-link" href="user_doctor.jsp">Doctors</a>
                	</li>
				</ul>
                	<ul class="navbar-nav mb-2 mb-lg-0">
                		<li class="nav-item dropdown">
          					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"  data-bs-toggle="dropdown">
            					<i class="fa-solid fa-circle-user fa-xl"></i> &nbsp; ${userObj.fullName }
          					</a>
          				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            				<li><a class="dropdown-item" href="#">Change Password</a></li>
            				<li><a class="dropdown-item" href="userLogout">Logout</a></li>
          				</ul>
        				</li>  
        			</ul>			
                </c:if>
        </div>
    </div>
</nav>

</body>
</html>