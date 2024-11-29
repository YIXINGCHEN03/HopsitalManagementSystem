<%@page import="javax.print.Doc"%>
<%@page import="com.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@page import="com.entity.Specialist"%>
	<%@page import="com.entity.Doctor"%>
	<%@page import="java.util.*"%>
	<%@page import="com.db.DBConnect"%>
	<%@page import="com.dao.SpecialistDAO"%>
	<%@page import="com.dao.DoctorDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	
	<% 
	String searchTerm = request.getParameter("searchTerm");
    if (searchTerm == null) {
        searchTerm = ""; // Default to empty if no search term is provided
    }
    
    DoctorDAO dao = new DoctorDAO (DBConnect.getConn());
    Stack<Doctor> allDoc = dao.getAllDoctor(searchTerm);
    
    if(!searchTerm.isEmpty()) {
    	Doctor searchedDoc = dao.binarySearchByName(allDoc, searchTerm);
    	
    	if(searchedDoc != null) {
    		allDoc.clear();
    		allDoc.push(searchedDoc);
    	}
    }
    
    %>
	
	<div class="container-fluid p-3">
		<div class="row">

		<c:if test="${not empty errMsg}">
			<p class="fs-3 text-center text-danger">${errMsg}</p>
			<c:remove var="errMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
			
			<div class="col-md-12">
				<div class="card paint-card">
					<div class=card-body>
						<p class="">Doctor Details</p>
						<form method="get" action="view_doctor.jsp" class="mb-3">
                            <div class="input-group">
                                <input type="text" name="searchTerm" class="form-control" placeholder="Search Patient by Name..." value="${param.searchTerm}">
                                <button class="btn btn-primary" type="submit">Search</button>
                            </div>
                        </form>
                        
              
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Phone</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
															
								for(Doctor d : allDoc){
									
								%>
								<tr>
									<td><%=d.getFullName() %></td>
									<td><%=d.getDob() %></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist() %></td>
									<td><%=d.getEmail() %></td>
									<td><%=d.getMobNo() %></td>
									<td>
										<a href="edit_doctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-success">Edit</a>
										<a href="delDoc?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
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