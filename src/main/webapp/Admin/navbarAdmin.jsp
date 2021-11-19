
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="#"><i class="fas fa-user-md"></i> Job
		Portal</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="admin.jsp"><i
					class="fas fa-house-user"></i> Home <span class="sr-only">(current)</span></a>
			</li>

			<li class="nav-item active"><a class="nav-link"
				href="addJob.jsp"><i class="fas fa-plus-circle"></i> Post Job <span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item active"><a class="nav-link"
				href="viewJob.jsp"><i class="fas fa-eye"></i> View Job <span
					class="sr-only">(current)</span></a></li>
		</ul>
			<form class="form-inline my-2 my-lg-0">
			<a href="" class="btn btn-light"><i class="fas fa-address-card"></i>
			 Admin</a>
			  <a data-toggle="modal" data-target="#exampleModalCenter" 
			  class="btn btn-danger ml-2 text-white"><i class="fas fa-sign-out-alt"></i>
				Logout</a>
		</form>
	
	</div>
	
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Logout Massage</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<h6>Do you really want to Logout</h6>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../LogoutServlet" class="btn btn-danger">Logout</a>
      </div>
    </div>
  </div>
</div>
</nav>