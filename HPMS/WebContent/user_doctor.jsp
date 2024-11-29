<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.dao.DoctorDAO"%>
<%@ page import="com.dao.SpecialistDAO"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Doctors</title>
    <%@include file="/components/allcss.jsp"%>
    <style type="text/css">
        .doctor-card {
            border-radius: 8px;
            transition: transform 0.2s;
        }
        .doctor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .doctor-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
        }
        .card-title {
            font-size: 1.1rem;
            font-weight: 600;
        }
        .status {
            font-size: 0.9rem;
            font-weight: 500;
        }
        .ratings {
            color: #f5c518;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
    </style>
</head>
<body>
    <%@ include file="/components/navbar.jsp" %>

    <%
        DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getConn());
        SpecialistDAO specialistDAO = new SpecialistDAO(DBConnect.getConn());

        // Retrieve specialties and doctors based on selected specialty
        String selectedSpecialty = request.getParameter("specialty");
        List<String> specialties = specialistDAO.getSpecialistNames();
        List<Doctor> doctors = (selectedSpecialty == null || selectedSpecialty.isEmpty())
                ? doctorDAO.getAllDoctor() 
                : doctorDAO.getDoctorsBySpecialty(selectedSpecialty);
    %>

    <div class="container my-4">
        <h2 class="text-center mb-4">Our Doctors</h2>

        <!-- Specialty Filter Form -->
        <form method="get" action="user_doctor.jsp" class="mb-3">
            <label for="specialty">Select Specialty:</label>
            <select name="specialty" class="form-select" onchange="this.form.submit()">
                <option value="">All Specialties</option>
                <% for (String specialty : specialties) { %>
                    <option value="<%= specialty %>" <%= specialty.equals(selectedSpecialty) ? "selected" : "" %>><%= specialty %></option>
                <% } %>
            </select>
        </form>

        <!-- Doctor Cards -->
        <div class="row">
            <% for (Doctor d : doctors) { %>
                <div class="col-md-4 mb-4">
                    <div class="card doctor-card shadow-sm">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <img src="img/doctorRB.png" alt="Doctor Image" class="rounded-circle me-3 doctor-image">
                                <div>
                                    <h5 class="card-title mb-0"><%= d.getFullName() %></h5>
                                    <small class="text-muted"><%= d.getSpecialist() %></small>
                                    <div class="status text-success mt-1">Online</div>
                                </div>
                            </div>
                            <div class="ratings mb-2">
                                <span>★★★★★</span>
                            </div>
                            <p class="mb-1"><strong>Available:</strong> 10:00 AM - 12:00 PM</p>
                            <a href="user_appointment.jsp?doctorId=<%= d.getId() %>" class="btn btn-primary btn-sm mt-3">Take Appointment</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
