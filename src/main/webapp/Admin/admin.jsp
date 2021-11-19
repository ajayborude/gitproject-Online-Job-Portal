<%@page import="com.entities.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<%@include file="../CSS/allCssLinks.jsp"%>
<style type="text/css">
.bac-img {
	background: url("../Images/book6.jpg");
	height: 82.8vh;
	width: 100%;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
</head>

<body>

<%
UserDetails ud=(UserDetails)session.getAttribute("admin-obj");
session.setAttribute("war-msg", "You can't access this page you are not an Admin");
if(ud==null)
{
	response.sendRedirect("../login.jsp");
}
%>

<!-- Navbar -->
	<%@include file="navbarAdmin.jsp"%>
	
<!-- Background Image -->
	<div class="container-fluid bac-img">
		<div class="text-white text-center p-5">
			<h1>Welcome Admin</h1>
		</div>
	</div>

<!-- Footer -->
	<div class="sticky-footer">
		<%@include file="../ComenElements/footer.jsp"%>
	</div>

</body>
</html>