<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Stack"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.PatientDAO"%>
<%@page import="com.entity.Patient"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Doctor"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 ">
         	<div class="d-flex justify-content-end">
                <a href="patient.jsp" class="btn btn-success mb-2">Add Patient</a>
            </div>
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Update Patient Form</h3>
                    <c:if test="${not empty errMsg}">
						<p class="fs-3 text-center text-danger">${errMsg}</p>
						<c:remove var="errMsg" scope="session" />
					</c:if>
					<c:if test="${not empty succMsg}">
						<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<% 
						int id = Integer.parseInt(request.getParameter("id"));
						PatientDAO patDAO = new PatientDAO (DBConnect.getConn());
						Patient p = patDAO.getPatientById(id);
					
					%>
					
                    <form action="../UpdatePatient" method="post">
                        <div class="mb-3">
                            <label for="firstName" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%= p.getFullName()%>" required>
                        </div>
                 
                        <div class="mb-3">
                            <label for="dob" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="dob" name="dob" value="<%= p.getDob() %>" required>
                        </div>
                       <div class="mb-3">
    <label for="blood" class="form-label">Blood</label>
    <select class="form-select" id="blood" name="blood" required>
        <option value="<%= p.getBlood() %>"><%= p.getBlood() %></option>
        
        <% if (!"A".equals(p.getBlood())) { %>
            <option value="A">A</option>
        <% } %>
        
        <% if (!"B".equals(p.getBlood())) { %>
            <option value="B">B</option>
        <% } %>
        
        <% if (!"O".equals(p.getBlood())) { %>
            <option value="O">O</option>
        <% } %>
        
        <% if (!"AB".equals(p.getBlood())) { %>
            <option value="AB">AB</option>
        <% } %>
    </select>
</div>
                        <div class="mb-3">
                            <label for="gender" class="form-label">Gender</label>
                            <select class="form-select" id="gender" name="gender" required>
                            	<option><%=p.getGender() %></option>
                            	<% if("Female".equals(p.getGender()))%>
                                <option value="Male">Male</option>
                             
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="phone" name="phone" required value="<%= p.getPhone() %>">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required value="<%=p.getEmail()%>">
                        </div>
               
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <textarea class="form-control" id="address" name="address" rows="3" required><%= p.getAddress()%></textarea>
                        </div>
                        <div class="mb-3">
    						<label for="doctor" class="form-label">Doctor</label>
    						<select required class="form-control" name="doctor">
        					<%
            					DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
            					Stack<Doctor> stack = dao.getAllDoctor();
            					Doctor currentDoctor = dao.getDocById(p.getDid()); // Assuming p.getDoctorId() gives the current doctor ID
        					%>
        
        
 		       					<option value="<%= currentDoctor.getId() %>"><%= currentDoctor.getFullName() %> (<%= currentDoctor.getSpecialist() %>)</option>
        					<%
            					for (Doctor d : stack) {
                				if (d.getId() != currentDoctor.getId()) { 
        					%>
            					<option value="<%= d.getId() %>"><%= d.getFullName() %> (<%= d.getSpecialist() %>)</option>
        					<%
                					}
            					}
        					%>
    						</select>
						</div>

                        <div class="mb-3">
                            <label for="medicalHistory" class="form-label">Treatment</label>
                            <textarea class="form-control" id="treatment" name="treatment" rows="4"><%=p.getTreatment() %></textarea>
                        </div>
                        
                        <div class="mb-3">
                            <label for="medicalHistory" class="form-label">Medical History</label>
                            <textarea class="form-control" id="medicalHistory" name="medicalHistory" rows="4"><%=p.getMedicalHistory() %></textarea>
                        </div>
                        
                        <div class="mb-3">
                            <label for="allergies" class="form-label">Allergies (Medicine)</label>
                            <textarea class="form-control" id="allergies" name="allergies" rows="2"><%=p.getAllergies() %></textarea>
                        </div>
                        
                        <input type="hidden" name="id" value="<%=p.getId()%>">
                        
                        <button type="submit" class="btn btn-success w-100">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>