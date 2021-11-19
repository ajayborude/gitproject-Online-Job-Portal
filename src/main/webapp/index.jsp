<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Portal</title>

<%@include file="CSS/allCssLinks.jsp"%>

<style type="text/css">
.bac-img {
	background: url("Images/job1.jpg");
	height: 82.5vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
}
</style>

</head>
<body>

	<%@include file="ComenElements/navbar.jsp"%>

	<%
	if (ud == null) {
	%>
	<div class="container-fluid bac-img">
		<h1 class="text-white text-center p-3">
			<i class="fas fa-book"></i> Online Job Portal
		</h1>
	</div>
	<%
	} else {
	%>
	<div class="container-fluid bac-img">
		<h2 class="text-#e085c2 text-center p-5" style="color: #FC600A;">
			<i class="fas fa-address-card"></i> Hello
			<%=ud.getName()%>
			Welcome to <br> <i class="fas fa-book"></i> Online Job Portal
		</h2>
	</div>
	<%
	}
	%>


	<div class="sticky-footer">
		<%@include file="ComenElements/footer.jsp"%>
	</div>
</body>
</html>