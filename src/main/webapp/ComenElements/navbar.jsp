<%@page import="com.entities.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="index.jsp"><i class="fas fa-user-md"></i>
		Job Portal</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fas fa-house-user"></i> Home <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="viewAllJobs.jsp"> <i class="far fa-eye"></i> View All Jobs
					<span class="sr-only">(current)</span></a></li>
		</ul>
		<%
		UserDetails ud = (UserDetails) session.getAttribute("user-obj");
		if (ud == null) {
		%>
		<form class="form-inline my-2 my-lg-0">
			<a href="login.jsp" class="btn btn-success"><i
				class="fas fa-sign-in-alt"></i> Login</a> <a href="registerUser.jsp"
				class="btn btn-success ml-2"><i class="fas fa-user-tie"></i>
				Sign-Up</a>
		</form>
		<%
		} else {
		%>
		<form class="form-inline my-2 my-lg-0">
			<a data-toggle="modal" data-target="#exampleModal"
				class="btn btn-light"><i class="fas fa-address-card"></i> <%=ud.getName()%></a>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Your Profile</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table">
								<tbody class="text-center">
									<tr>
										<th scope="col">User Id:</th>
										<td><%=ud.getId()%></td>
									</tr>
									<tr>
										<th scope="col">User Name:</th>
										<td><%=ud.getName()%></td>
									</tr>
									<tr>
										<th scope="col">Qualification:</th>
										<td><%=ud.getQualification()%></td>
									</tr>
									<tr>
										<th scope="col">Email:</th>
										<td><%=ud.getEmail()%></td>
									</tr>
									<tr>
										<th scope="col">Password:</th>
										<td><%=ud.getPassword()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<a href="editUser.jsp?id=<%=ud.getId() %>" class="btn btn-success">
								<i class="fas fa-edit"></i> Edit Profile
							</a>
						</div>
					</div>
				</div>
			</div>
			<a data-toggle="modal" data-target="#exampleModalCenter"
				class="btn btn-danger text-white ml-2"><i
				class="fas fa-sign-out-alt"></i> Logout</a>
		</form>
		<%
		}
		%>
	</div>
</nav>

<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Logout
					Massage</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h6>Do you really want to Logout</h6>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="LogoutServlet" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</div>
</div>