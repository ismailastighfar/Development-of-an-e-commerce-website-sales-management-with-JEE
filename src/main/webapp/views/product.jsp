<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
    <title>Products List</title>
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="css/profile.css">
 
</head>

<%
    
    if (session == null || session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("http://localhost:8081/rayban/");
    }
%>
<body>

 <section class="main">

   <header>
    <a href="#"><img src="assets/Ray-ban-logo.jpg" class="logo" alt=""></a>
    <ul class="navigation">
     <s:url namespace="/" action="Home" var="HomeUrl"></s:url>
         <s:a href="%{HomeUrl}" class="btn">Home</s:a>
         
       <s:url namespace="/" action="displayArticles" var="productPageUrl"></s:url>
          <s:a href="%{productPageUrl}" class="btn">Products</s:a>
          
           <s:url namespace="/" action="Profile" var="profileUrl"></s:url>
         <s:a href="%{profileUrl}" class="btn">Profile</s:a>
         
         <s:url namespace="/" action="logout" var="logoutUrl"></s:url>
         <s:a href="%{logoutUrl}" class="btn">Logout</s:a>
    </ul>
   </header>
  




 
  
  <div class="row   mt-5 ml-5 p-5 position-relative col-8 justify-content-end ">
  <div class="col-sm-5 ">
    <div class="input-group">
      <div class="input-group-text bg-primary "><i class="bi bi-search"></i></div>
      <input type="text" class="form-control" id="specificSizeInputGroupUsername" placeholder="Search...">
    </div>
  </div>

  <div class="col-sm-3">
    <select class="form-select" id="specificSizeSelect">
      <option selected >qteArt</option>
        <option>nomArt</option>
        <option>descArt</option>
      <option>prixArt</option>
    </select>
  </div>
</div>

<div class="container table-sm table-responsive">


<table class="table table-hover table-bordered border-secondary table-striped ">
  <thead class="text-light">
    <tr  class="table-primary text-center">
      <th scope="col">qteArt</th>
      <th scope="col">nomArt</th>
      <th scope="col">descArt</th>
      <th scope="col">prixArt</th>
       <th scope="col" class="col-2" >Order</th>
    </tr>
  </thead>
 
  <tbody >
   <s:iterator value="articlesList">
    <tr>
      <td><s:property value="qteArt"/></td>
      <td><s:property value="nomArt"/></td>
      <td><s:property value="descArt"/></td>
      <td><s:property value="prixArt"/></td>
     
	
			<s:url namespace="/" action="addCammand" var="lien4">
			<s:param name="code">
			<s:property value="codeArt"/>
			</s:param>
			</s:url>
			 <s:if test="%{qteArt > 0}">
                    <td><s:a href="%{lien4}" class="btn btn-outline-primary col-8" role="button"  aria-disabled="false">Order Now</s:a></td>
                </s:if>
                <s:else>
                    <td> <button  class="btn btn-primary disabled" role="button" aria-disabled="true">Order Now</button></td>
                </s:else>
           
	
    </tr>

     </s:iterator>
  </tbody>
</table>

</div>

</section>

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
	    var column = $('#specificSizeSelect').val() === 'qteArt' ? 0 : $('#specificSizeSelect').val() === 'nomArt' ? 1 : $('#specificSizeSelect').val() === 'descArt' ? 2 :3 ;

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
});
</script>


</html>
