<%@page import="com.entity.appointment"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
appointment appt = (appointment) request.getAttribute("appointment");
Doctor doctor = (Doctor) request.getAttribute("doctor");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Appointment Details</title>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 8px;
}
</style>
</head>
<body>
<%@ include file="/components/navbar.jsp" %>
    <div class="container mt-3">
        <h2 class="text-center">Appointment Details</h2>
        <% if (appt != null && doctor != null) { %>
        <div class="container paint-card">
        	<div class="d-lg-flex justify-content-between dblock">
        		<h2><%= appt.getDisease() %> Case</h2>
        	 	<p style="font-size: 18px;"><strong>Appointment Date:</strong> <%= appt.getAppointDate() %></p>
        	</div>
        	
        	 <p><strong>Doctor:</strong> <%= doctor.getFullName() %> (Specialist: <%= doctor.getSpecialist() %>)</p>
        	 <p><strong>Full Name:</strong> <%= appt.getFullName() %> (<%= appt.getGender() %>)</p>
        	 <p><strong>Age:</strong> <%= appt.getAge() %></p>

            <p><strong>Email:</strong> <%= appt.getEmail() %></p>
            <p><strong>Phone Number:</strong> <%= appt.getPhNo() %></p>
        
            <p><strong>Address:</strong> <%= appt.getAddress() %></p>
            <p><strong>Status:</strong> <%= appt.getStatus() %></p>
            <div class="text-center">
            	<a href="index.jsp" class="btn btn-primary">Back</a>
            	<a href="delAppt?id=<%=appt.getId() %>" class="btn btn-danger">Cancel Booking</a>
            </div>
        </div>
   
        <% } else { %>
            <p>Appointment details not found.</p>
        <% } %>
    </div>
</body>
</html>
