<%@page import="com.entities.*"%>
<%@page import="com.databaseOperation.AllJobRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Job here</title>
<%@include file="../CSS/allCssLinks.jsp"%>
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
	<h4 class="text-center">All Jobs</h4>


	<%
	String suc_msg = (String) session.getAttribute("suc-msg");
	String eror_msg = (String) session.getAttribute("eror-msg");
	if (suc_msg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=suc_msg%></div>
	<%
	}
	if (eror_msg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=eror_msg%></div>
	<%
	}
	session.removeAttribute("suc-msg");
	session.removeAttribute("eror-msg");
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1 ">


				<%
				List<JobDetails> list = AllJobRegardingOperation.viewAllJobs();
				for (JobDetails jd : list) {
				%>
				<div class="card mt-2">
					<div class="card-body p-2">
						<div class="text-center text-primary">
							<i class="fas fa-clipboard fa-2x"></i>
						</div>
						<h5>
							Title:<%=jd.getTitle()%></h5>
						<p>
							Job Description:
							<%=jd.getDescription()%></p>
						<div class="form-row">
							<div class="form-group col-md-4">
								<input type="text" name="location" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Location: <%=jd.getLocation()%>">
							</div>
							<div class="form-group col-md-4">
								<input type="text" name="catagory" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Catagory: <%=jd.getCatogory()%> ">
							</div>
							<div class="form-group col-md-4">
								<input type="text" name="status" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Status: <%=jd.getStatus()%> ">
							</div>
						</div>
						<div>
							<p>
								Publish Date:
								<%=jd.getPdate()%>
						</div>
						<div class="text-center">
							<a href="editJob.jsp?id=<%=jd.getId()%>" class="btn btn-success"><i
								class="fas fa-edit"></i> Edit</a> <a
								href="../DeleteJobServlet?id=<%=jd.getId()%>"
								class="btn btn-danger ml-2"><i class="fas fa-trash-alt"></i>
								Delete</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<br>
</body>
</html>