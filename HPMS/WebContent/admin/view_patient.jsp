<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.entity.Patient" %>
<%@ page import="com.dao.PatientDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Patient Details</title>
    <%@ include file="../components/allcss.jsp" %>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container-fluid p-3">
        <div class="row">
            <% 
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = ""; // Default to empty if no search term is provided
            }

            PatientDAO patDao = new PatientDAO(DBConnect.getConn());
            Stack<Patient> allP = patDao.getAllPatient(searchTerm);

            if (!searchTerm.isEmpty()) {
                // Perform binary search to find the specific patient (optional)
                Patient searchedPatient = patDao.binarySearchByName(allP, searchTerm);
                if (searchedPatient != null) {
                    allP.clear(); // Clear the list and add the found patient
                    allP.push(searchedPatient);
                }
            }
            %>

            <div class="col-md-12">
                <div class="card paint-card">
                    <div class="card-body">
                        <p>Patient Details</p>
                        <form method="get" action="view_patient.jsp" class="mb-3">
                            <div class="input-group">
                                <input type="text" name="searchTerm" class="form-control" placeholder="Search Patient by Name..." value="${param.searchTerm}">
                                <button class="btn btn-primary" type="submit">Search</button>
                            </div>
                        </form>
                        <table class="table">
                            <thead>
                                <tr class="text-center">
                                    <th scope="col">Name</th>
                                    <th scope="col">DOB</th>
                                    <th scope="col">Blood</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Treatment</th>
                                    <th scope="col">MedicalHistory</th>
                                    <th scope="col">Allergies</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                for (Patient p : allP) {
                                %>
                                <tr>
                                    <td style="width: 150px;"><%=p.getFullName() %></td>
                                    <td><%=p.getDob() %></td>
                                    <td><%=p.getBlood() %></td>
                                    <td><%=p.getGender() %></td>
                                    <td><%=p.getPhone() %></td>
                                    <td style="width: 280px;"><%=p.getAddress() %></td>
                                    <td style="width: 200px;"><%=p.getTreatment() %></td>
                                    <td style="width: 280px;"><%=p.getMedicalHistory() %></td>
                                    <td style="width: 280px;"><%=p.getAllergies() %></td>
                                    <td>
                                        <a href="edit_patient.jsp?id=<%=p.getId() %>" class="btn btn-sm btn-success mb-2">Edit</a>
                                        <a href="../delPatient?id=<%=p.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                                    </td>
                                </tr>
                                <% 
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
