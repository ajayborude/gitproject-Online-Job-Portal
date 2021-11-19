<%@page import="com.databaseOperation.AllUserRegardingOperation"%>
<%@page import="com.databaseOperation.AllJobRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User here</title>

<%@include file="CSS/allCssLinks.jsp"%>

</head>
<body style="background-color: #f0f1f2;">

	<%@include file="ComenElements/navbar.jsp"%>
	<%
	ud = (UserDetails) session.getAttribute("user-obj");
	session.setAttribute("war-msg", "Please Login First to View All Jobs");
	if (ud == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container">
		<div class="row mt-3">
			<div Class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header bg-success">
						<div class="text-white text-center">
							<h5>
								<i class="fas fa-user fa-2x"></i><br> Edit User Page
							</h5>
						</div>
					</div>
					<%
					String error_msg = (String) session.getAttribute("eror-msg");
					if (error_msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=error_msg%></div>
					<%
					}
					session.removeAttribute("eror-msg");
					%>
					<div class="card-body">
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ud = AllUserRegardingOperation.getUserById(id);
						%>
						<form action="EditUserServlet" method="post">
							<input type="hidden" name="id" value="<%=ud.getId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" name="name" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=ud.getName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Qualification</label> <input
									type="text" name="qualification" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=ud.getQualification()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=ud.getEmail()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1" value="<%=ud.getPassword()%>">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Update
								Profile</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sticky-footer">
		<%@include file="ComenElements/footer.jsp"%>
	</div>

</body>
</html>