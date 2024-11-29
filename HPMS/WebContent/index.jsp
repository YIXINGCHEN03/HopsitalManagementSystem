<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.appointmentDAO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home: Hospital</title>
<%@include file="/components/allcss.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 8px;
}
.wd{
	width: 100px !important;
	font-size: 17px !important;
}
.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6); /* Semi-transparent background */
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000; /* Ensures it overlays other elements */
}

.msg-box {
    padding: 20px;
    border-radius: 5px;
    text-align: center;
    font-size: 20px;
    max-width: 80%;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
}

.msg-box.success {
    color: #155724;
    background: #fff;
    border: 1px solid #c3e6cb;
}

.msg-box.error {
    color: #721c24;
    background: #fff;
    border: 1px solid #f5c6cb;
}
</style>
</head>
<body>
<%@include file="/components/navbar.jsp"%>
<%@include file="/components/carousel.jsp"%>

<div class="container mt-3">
  <h5>Recent Appointment</h5>
  <p class="m-0 p-0">Current Date: <%= LocalDate.now() %></p>
  <p>These appointments are already booked. You can also edit and cancel them.</p>
  
<c:if test="${not empty errMsg}">
    <div class="overlay">
        <div class="msg-box error">
            <p>${errMsg}</p>
            <c:remove var="errMsg" scope="session" />
        </div>
    </div>
</c:if>

<c:if test="${not empty succMsg}">
    <div class="overlay">
        <div class="msg-box success">
            <p>${succMsg}</p>
            <c:remove var="succMsg" scope="session" />
             <button onclick="this.parentElement.parentElement.style.display='none'" class="btn btn-primary">Close</button>
        </div>
    </div>
</c:if>

  <%
  User user = (User) session.getAttribute("userObj");
  if (user != null) {
      int userId = user.getId();
    	
  	appointmentDAO appointmentDAO = new appointmentDAO(DBConnect.getConn());
  	DoctorDAO drDao = new DoctorDAO(DBConnect.getConn());
  	Queue<appointment> recentAppointments = appointmentDAO.getRecentAppointments(userId);
  
  	if(!recentAppointments.isEmpty()){
  %>
  		<div class="row">
  <%
  		for(appointment ap : recentAppointments) { 
  		Doctor d = drDao.getDocById(ap.getDocId());
  %>
  
			
  			<div class="col-md-4 mb-3">
  				<div class="paint-card">
  					<h3 class="text-capitalize"><%= ap.getDisease() %></h3>
  					<div class="d-flex justify-content-between">
  						<h6 class="m-0 p-0"><%= d.getFullName() %></h6>  
  						<p class="m-0 p-0">Ap Date: <%= ap.getAppointDate() %></p>
  					</div>
  					<p class="m-0 p-0">Specialist: <strong class="text-capitalize"> <%= d.getSpecialist() %></strong></p>
  					<p class="m-0 pb-2">Patient: <%=ap.getFullName()%> (<%= ap.getGender() %>)</p>
  					<p class="m-0 p-0"><strong><i class="fa-regular fa-clock"></i><%=ap.getStatus() %>....</strong></p>
  					<div class="d-flex justify-content-end">
  						<a href="delAppt?id=<%=ap.getId() %>" class="btn btn-sm btn-danger me-2 wd">Cancel</a>
						<a href="ViewAppointment?id=<%=ap.getId()  %>" class="btn btn-sm btn-primary wd">View</a>
  					</div>
  				</div>
  			</div>
  <%
  		}
  %>
  		</div>
  <%
  	} else { %>
  		<p> No Recent Appointment yet</p>
  <%
  	}
  }
  %>
</div>
</body>
</html>
