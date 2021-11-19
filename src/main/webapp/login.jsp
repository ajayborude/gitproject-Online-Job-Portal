<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login here</title>
<%@include file="../CSS/allCssLinks.jsp"%>
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
								<i class="fas fa-user fa-2x"></i><br> Login Page
							</h5>
						</div>
					</div>
					<%
					String warning_msg=(String)session.getAttribute("war-msg");
					if(warning_msg!=null)
					{%>
						<div class="alert alert-danger" role="alert"><%=warning_msg%></div>
					<%}
					session.removeAttribute("war-msg");
					%>
					
					<%
					String upd1_msg=(String)session.getAttribute("update1-msg");
					if(upd1_msg!=null)
					{%>
						<div class="alert alert-success" role="alert"><%=upd1_msg%></div>
					<%}
					session.removeAttribute("update1-msg");
					%>
					<div class="card-body">
					

						<form action="LoginUserServlet" method="post">
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
								class="btn btn-primary badge-pill btn-block">Login</button>
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