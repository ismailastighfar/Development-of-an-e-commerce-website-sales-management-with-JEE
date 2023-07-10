<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <style type="text/css">
    @import url('https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'ubuntu', sans-serif;
}

body {
    background: #000;
}

body::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    opacity: 0.5;
    background: url("assets/ray-back.jpg");
    background-position: center;
}
    </style>
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
          <s:url  action="usersList" var="users"></s:url>
	      <s:a href="%{users}" class="nav-link" aria-current="page" >Users</s:a>
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




</body>

</html>