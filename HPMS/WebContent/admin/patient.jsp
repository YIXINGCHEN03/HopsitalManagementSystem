<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.Stack"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Doctor"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration Form</title>
    <%@include file="../components/allcss.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 ">
         	<div class="d-flex justify-content-end">
                <a href="view_patient.jsp" class="btn btn-success mb-2">View All Patients</a>
            </div>
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Patient Registration Form</h3>
                    <c:if test="${not empty errMsg}">
						<p class="fs-3 text-center text-danger">${errMsg}</p>
						<c:remove var="errMsg" scope="session" />
					</c:if>
					<c:if test="${not empty succMsg}">
						<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					
                    <form action="../addPatient" method="post">
                        <div class="mb-3">
                            <label for="firstName" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                 
                        <div class="mb-3">
                            <label for="dob" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="dob" name="dob" required>
                        </div>
                        <div class="mb-3">
                            <label for="gender" class="form-label">Blood</label>
                            <select class="form-select" id="blood" name="blood" required>
                                <option value="" selected>Select</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="O">O</option>
                                <option value="AB">AB</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="gender" class="form-label">Gender</label>
                            <select class="form-select" id="gender" name="gender" required>
                                <option value="" selected>Select</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="phone" name="phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
               
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                        </div>
                        <div class="mb-3">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									required class="form-control" name="doctor">
									<option value="">--select--</option>

									<%
									DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
									Stack<Doctor> stack = dao.getAllDoctor();
									for (Doctor d : stack) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>
                        <div class="mb-3">
                            <label for="medicalHistory" class="form-label">Treatment</label>
                            <textarea class="form-control" id="treatment" name="treatment" rows="4"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="medicalHistory" class="form-label">Medical History</label>
                            <textarea class="form-control" id="medicalHistory" name="medicalHistory" rows="4"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="allergies" class="form-label">Allergies (Medicine)</label>
                            <textarea class="form-control" id="allergies" name="allergies" rows="2"></textarea>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
