<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users List</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

<nav class="navbar navbar-dark bg-danger">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Ray-Ban Admin Dashboard</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="offcanvas offcanvas-end text-bg-danger" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Menu</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3 text-center fs-5 ">
        
          <li class="nav-item">
            <s:url  action="usersList" var="user"></s:url>
	      <s:a href="%{user}" class="nav-link" aria-current="page" >Users</s:a>
          </li>
          
         <li class="nav-item">
             <s:url  action="cmdList" var="cmd"></s:url>
	      <s:a href="%{cmd}" class="nav-link" aria-current="page" >Commands</s:a>
          </li>
          
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Products
            </a>
            <ul class="dropdown-menu  col-4 bg-danger position-absolute top-100 start-50 ">
              <li>
                <s:url  action="artList" var="artList"></s:url>
	      <s:a href="%{artList}" class="dropdown-item text-dark text-center" aria-current="page" >Product List</s:a>
              </li>
                <li>
                <hr class="dropdown-divider">
              </li>
              <li>
                <s:url  action="product" var="product"></s:url>
	      <s:a href="%{product}" class="dropdown-item text-dark text-center" aria-current="page" >Add Product</s:a>
              </li>
            </ul>
          </li>
        </ul>
       
      </div>
    </div>
  </div>
</nav>








<div class="row  mt-5 ml-5 p-5 position-relative col-8 justify-content-end ">
  <div class="col-sm-5 ">
    <div class="input-group">
      <div class="input-group-text bg-primary "><i class="bi bi-search"></i></div>
      <input type="text" class="form-control" id="specificSizeInputGroupUsername" placeholder="Search...">
    </div>
  </div>
  <div class="col-sm-3">
    <select class="form-select" id="specificSizeSelect">
      <option selected>Code</option>
      <option >Username</option>
        <option >Email</option>
    </select>
  </div>
</div>

<div class="container table-sm table-responsive">


<table class="table table-hover table-bordered border-secondary ">
  <thead class="text-light">
    <tr  class="table-primary">
      <th scope="col">User Code</th>
      <th scope="col">User Name</th>
      <th scope="col">User Email</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
 
  <tbody>
   <s:iterator value="usersList">
    <tr>
      <td><s:property value="codeUser"/></td>
      <td><s:property value="login"/></td>
       <td><s:property value="email"/></td>

      <s:url namespace="/" action="deleteUser" var="delete">
	  <s:param name="codeuser">
	    <s:property value="codeUser"/>
	  </s:param>
	</s:url>
	<td><s:a href="%{delete}" class="btn btn-danger delete-btn" >delete</s:a></td>
    </tr>
     </s:iterator>
  </tbody>
</table>

</div>

<div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmationModalLabel">Confirm Delete</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Are you sure you want to delete this user?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
        <button type="button" class="btn btn-danger" id="confirmDelete">Yes</button>
      </div>
    </div>
  </div>
</div>

</body>


<script>
  $(document).ready(function() {
    $('#specificSizeInputGroupUsername').on('keyup', function() {
      var input, filter, table, tr, td, i, txtValue;
      input = $(this);
      filter = input.val().toUpperCase();
      table = $('table');
      tr = $('tbody tr');

      // Select the column to search based on the selected option
      var column = $('#specificSizeSelect').val() === 'Code' ? 0 : $('#specificSizeSelect').val() === 'username'? 1 : 2;

      // Loop through all table rows and hide those that don't match the search query
      for (i = 0; i < tr.length; i++) {
        td = $(tr[i]).find('td')[column];
        if (td) {
          txtValue = $(td).text();
          if (txtValue.toUpperCase().indexOf(filter) > -1) {
            $(tr[i]).show();
          } else {
            $(tr[i]).hide();
          }
        }
      }
    });

    // Attach click event to delete buttons
    $('a.delete-btn').on('click', function(e) {
      e.preventDefault();
      var deleteUrl = $(this).attr('href');
      $('#confirmationModal').modal('show');

      // Confirm delete on "Yes" button click
      $('#confirmDelete').on('click', function() {
        window.location.href = deleteUrl;
      });
    });
  });
</script>


</html>