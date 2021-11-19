<%@page import="java.util.List"%>
<%@page import="com.databaseOperation.AllJobRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Jobs Here</title>
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
	<div class="mt-3 text-center text-primary">
		<h5>Search Jobs as per your Qualification or Requirement</h5>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1 ">
				<div class="card mt-2">
					<div class="card-body p-2">
					
						<form class="form-inline" method="get" action="viewJobAsLocOrCat.jsp">
							<div class="form-group col-md-5 ">
								<label for="exampleFormControlSelect1">Location</label>
							</div>
							<div class="form-group col-md-5">
								<label for="exampleFormControlSelect1">Category</label>
							</div>
							
							<div class="form-group col-md-5">
								<select name="loc" class="custom-select"
									id="exampleFormControlSelect1">
									<option selected value="lo">Choose....</option>
									<option value="Pune">Pune</option>
									<option value="Sambhaji Nagar">Sambhaji Nagar</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Raigad">Raigad</option>
									<option value="Banglore">Banglore</option>
								</select>
							</div>

							<div class="form-group col-md-5">
								<select name="cat" class="custom-select"
									id="exampleFormControlSelect1">
									<option selected value="ca">Choose....</option>
									<option value="IT">IT</option>
									<option value="Software Developer">Software Developer</option>
									<option value="Software Testing">Software Testing</option>
									<option value="Banking">Banking</option>
									<option value="Engineering">Engineering</option>
								</select>
							</div>
							<div class="form-group col-md-2">
								<button class="btn btn-success">Submit</button>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="mt-3 text-center text-primary">
		<h4>All Jobs</h4>
	</div>
	<%
	List<JobDetails> list = AllJobRegardingOperation.viewAllJobsForUser();
	for (JobDetails jd : list) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1 ">
				<div class="card mt-2">
					<div class="card-body p-2">

						<div class="text-center text-primary">
							<i class="fas fa-clipboard fa-2x"></i>
						</div>
						<h5>
							Title:
							<%=jd.getTitle()%></h5>

						<%
						if (jd.getDescription().length() > 0 && jd.getDescription().length() < 120) {
						%>
						<p>
							Job Description:
							<%=jd.getDescription()%></p>
						<%
						} else {
						%>
						<p>
							Job Description:
							<%=jd.getDescription().substring(0, 120)%>...
						</p>
						<%
						}
						%>

						<div class="form-row">
							<div class="form-group col-md-4">
								<input type="text" name="location" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Location: <%=jd.getLocation()%>"
									readonly="readonly">
							</div>
							<div class="form-group col-md-4">
								<input type="text" name="catagory" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Catagory: <%=jd.getCatogory()%>"
									readonly="readonly">
							</div>
						</div>
						<div>
							<p>
								Publish Date:
								<%=jd.getPdate()%></p>
						</div>
						<div class="text-center">
							<a href="viewSelectedJob.jsp?id=<%=jd.getId()%>"
								class="btn btn-success"><i class="far fa-eye"></i> View More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>

</body>
</html>