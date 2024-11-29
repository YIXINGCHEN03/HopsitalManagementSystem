<%@page import="java.util.Stack"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="/components/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fulid p-5">

			<div class="col-md-6 mx-auto">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						
						
						<c:if test="${not empty errMsg}">
							<p class="fs-4 text-center text-danger">${errMsg}</p>
							<c:remove var="errMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						
						
						<form class="row g-3" action="appAppointment" method="post">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" class="form-control" required
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phno">
							</div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Description</label> <input
									required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> 
								<%
    								String selectedDoctorId = request.getParameter("doctorId");
								%>
								<select required class="form-control" name="doct">
									<option value="">--select--</option>
    							
    							<%
        							DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
        							Stack<Doctor> stack = dao.getAllDoctor();
        							for (Doctor d : stack) {
            						String selected = (selectedDoctorId != null && selectedDoctorId.equals(String.valueOf(d.getId()))) ? "selected" : "";
    							%>
            						<option value="<%=d.getId()%>" <%= selected %>><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
    							<% } %>
								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userObj}">
    							<p class="text-center text-danger">Please 
    							<a href="login.jsp">log in</a> or <a href="signup.jsp">sign up</a> first to make an appointment.</p>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>