<%@page import="com.entities.JobDetails"%>
<%@page import="com.databaseOperation.AllJobRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Selected Job Here</title>
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
	<%
	int id=Integer.parseInt(request.getParameter("id"));
	JobDetails jd=AllJobRegardingOperation.getJobById(id);
	%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-10 offset-md-1 ">
				<div class="card mt-2">
					<div class="card-body p-2">

						<div class="text-center text-primary">
							<i class="fas fa-clipboard fa-2x"></i>
						</div>
						<input type="hidden" name="id" value="<%=jd.getId() %>" >
						<h5>
							Title:
							<%=jd.getTitle()%></h5>

						<b>
							Job Description:</b>
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
								<%=jd.getPdate()%>
						</div>
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