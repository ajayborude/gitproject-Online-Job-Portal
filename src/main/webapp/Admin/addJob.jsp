<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add job Here</title>
<%@include file="../CSS/allCssLinks.jsp"%>
<style type="text/css">
body{
min-height: 100vh;
}
.sticky-footer{
position: sticky;
top: 100%;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
<%
UserDetails ud=(UserDetails)session.getAttribute("admin-obj");
session.setAttribute("war-msg", "You can't access this page you are not an Admin");
if(ud==null)
{
	response.sendRedirect("../login.jsp");
}
%>

	<%@include file="navbarAdmin.jsp"%>

	<div class="container">
		<div class="row mt-3">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="text-center text-black">
						<i class="fas fa-user-md fa-2x text-black"></i>
						<h4>Add Jobs</h4>
					</div>
					<%
					String ad_msg = (String) session.getAttribute("ad-msg");
					String error_msg = (String) session.getAttribute("eror-msg");
					if (ad_msg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=ad_msg%></div>
					<%
					}
					if (error_msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=error_msg%></div>
					<%
					}
					session.removeAttribute("ad-msg");
					session.removeAttribute("eror-msg");
					%>
					<div class="card-body">
						<form action="../AddJobServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Title</label> <input
									type="text" name="title" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter title">
							</div>
							<div class="row">
								<div class="form-group col-md-4">
									<label for="exampleFormControlSelect1">Location</label> <select
										name="location" class="form-control"
										id="exampleFormControlSelect1">
										<option value="choose">Choose....</option>
										<option value="Pune">Pune</option>
										<option value="Sambhaji Nagar">Sambhaji Nagar</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Raigad">Raigad</option>
										<option value="Banglore">Banglore</option>
									</select>
								</div>

								<div class="form-group col-md-4">
									<label for="exampleFormControlSelect1">Category</label> <select
										name="catagory" class="form-control"
										id="exampleFormControlSelect1">
										<option value="Choose">Choose....</option>
										<option value="IT">IT</option>
										<option value="Software Developer">Software Developer</option>
										<option value="Software Testing">Software Testing</option>
										<option value="Banking">Banking</option>
										<option value="Engineering">Engineering</option>
									</select>
								</div>
								<div class="form-group col-md-4">
									<label for="exampleFormControlSelect1">Status</label> <select
										name="status" class="form-control"
										id="exampleFormControlSelect1">
										<option value="choose">Choose....</option>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1">Enter
									Discription</label>
								<textarea name="discription" class="form-control"
									id="exampleFormControlTextarea1" rows="3"></textarea>
							</div>
							<button type="submit" class="btn btn-primary">Publish
								Job</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="sticky-footer">
		<%@include file="../ComenElements/footer.jsp"%>
	</div>
</body>
</html>