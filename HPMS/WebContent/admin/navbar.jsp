<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<style type="text/css">
	.dropdown-menu{
		min-width: 7rem;
	}
	
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"> Medical Plus </a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
			<ul class="navbar-nav mb-2 mb-lg-0 text-center">

				<li class="nav-item"><a class="nav-link active" href="index.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link active" href="doctors.jsp">DOCTOR</a></li>
				<li class="nav-item"><a class="nav-link active" href="view_doctor.jsp">VIEW DOCTOR</a></li>
				<li class="nav-item"><a class="nav-link active" href="patient.jsp">PATIENT</a></li>

			</ul>
		</div>
		<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Admin</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="../userLogout">Logout</a></li>
					</ul>
				</div>
			</form>
	</div>
</nav>