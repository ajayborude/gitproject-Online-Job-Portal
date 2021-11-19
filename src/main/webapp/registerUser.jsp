<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register here</title>

<%@include file="CSS/allCssLinks.jsp"%>

</head>
<body style="background-color: #f0f1f2;">

	<%@include file="ComenElements/navbar.jsp"%>

	<div class="container">
		<div class="row mt-3">
			<div Class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header bg-success">
						<div class="text-white text-center">
							<h5>
								<i class="fas fa-user fa-2x"></i><br> Register Page
							</h5>
						</div>
					</div>
					
					<%
					String reg_msg=(String)session.getAttribute("reg-msg");
					String error_msg=(String)session.getAttribute("eror-msg");
					if(reg_msg!=null)
					{%>
						<div class="alert alert-success" role="alert"><%=reg_msg %><br><a href="login.jsp">Click here to Login</a></div>
					<%}
					if(error_msg!=null)
					{%>
						<div class="alert alert-danger" role="alert"><%=error_msg %></div>
					<%}
					session.removeAttribute("reg-msg");
					session.removeAttribute("eror-msg");
					%>
					
					<div class="card-body">

						<form action="AddUserSrevlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" name="name" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter full name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Qualification</label> <input
									type="text" name="qualification" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter qualification">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Sign-Up</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="sticky-footer">
<%@include file="ComenElements/footer.jsp" %>
</div>

</body>
</html>