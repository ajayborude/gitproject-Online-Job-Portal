<%@page import="com.databaseOperation.AllJobRegardingOperation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.JobDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Job As Per Requirement</title>
<%@include file="CSS/allCssLinks.jsp"%>
</head>

<body style="background-color:  powderblue">

	<%@include file="ComenElements/navbar.jsp"%>
	
	<%
	ud = (UserDetails) session.getAttribute("user-obj");
	session.setAttribute("war-msg", "Please Login First to View All Jobs");
	if (ud == null) {
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="mt-3 text-center text-primary">
		<h4>All Jobs</h4>
	</div>

	<%
	String loc = request.getParameter("loc");
	String cat = request.getParameter("cat");
	String msg = "";

	List<JobDetails> list = null;

	if ("lo".equals(loc) && "ca".equals(cat)) 
	{
		list = new ArrayList<JobDetails>();
		msg = "Please Select Location or Category";
	}
	else if ("lo".equals(loc) || "ca".equals(cat)) 
	{
		list = AllJobRegardingOperation.viewJobsByLocOrCat(loc, cat);
	} 
	else 
	{
		list = AllJobRegardingOperation.viewJobsByLocAndCat(loc, cat);
	}

	if (list.isEmpty()) 
	{
	%>
	<h4 class="text-center text-danger">Job Not Available</h4>
	<%
	}
	if (list != null) 
	{
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

						<b> Job Description:</b>
						<p><%=jd.getDescription()%></p>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	}
	%>


</body>
</html>