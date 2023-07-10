<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
      <link rel="stylesheet" type="text/css" href="css/profile.css">
</head>

<%
    
    if (session == null || session.getAttribute("loggedInUser") == null ) {
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
   
  
   <div class=" mt-5 mb-5">
   <div class="rounded bg-white mt-5 mb-5">
    <div class="row m-4 p-2">
        <div class="col-md-5 ml-5 mr-5 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="mt-5 mb-4" width="150px" src="assets/user.png"><span class="font-weight-bold">User Name</span><span class="text-black-50"><%= ((entities.Users)session.getAttribute("loggedInUser")).getLogin() %></span><span class="font-weight-bold">Email</span><span><%= ((entities.Users)session.getAttribute("loggedInUser")).getEmail() %> </span></div>
        </div>
        <div class="col-md-5">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
             <form  id="profileForm" action="updateUserInfo" method="post">
               <s:if test="hasActionErrors()">
                            <div class="alert alert-danger" role="alert">
                             <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                                <s:actionerror />
                            </div>
                        </s:if>
                          <s:if test="hasActionMessages()">
                            <div class="alert alert-success" role="alert">
                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                               <s:actionmessage/>
                            </div>
                        </s:if>
                <div class="row mt-4">
                    <div class="col-md-12"><label class="labels">Username</label><input type="text" class="form-control" name="user.login" required></div>
                </div>
                  <div class="row mt-4">
                    <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" name="user.email" required></div>
                </div>
                <div class="row mt-4">
                    <div class="col-md-12"><label class="labels">Password</label><input id="password" type="password" class="form-control" name="user.pass" required ></div>
                </div>
                <div class="row mt-4">
                    <div class="col-md-12"><label class="labels">Confirm Password</label><input id="confirmPassword" type="password" class="form-control" required></div>
                </div>
                <div class="mt-5 text-center"><button class="btn btn-danger profile-button" type="submit">Save Profile</button></div>
             </form>
            </div>
        </div>
    </div>
</div>
</div>


    
                       
    </section>
</body>

<script>
        $(document).ready(function() {
            // Handle the password confirmation
            $("#confirmPassword").keyup(function() {
                var password = $("#password").val();
                var confirmPassword = $(this).val();
                var inputField = $(this);

                if (confirmPassword === password) {
                    inputField.removeClass("is-invalid").addClass("is-valid");
                } else {
                    inputField.removeClass("is-valid").addClass("is-invalid");
                }
            });

            // Handle the password validation
            $("#password").keyup(function() {
                var password = $(this).val();
                var inputField = $(this);

                // Minimum 8 characters, at least one uppercase letter, one symbol, and one digit
                var regex = /^(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?=.*\d).{8,}$/;

                if (regex.test(password)) {
                    inputField.removeClass("is-invalid").addClass("is-valid");
                } else {
                    inputField.removeClass("is-valid").addClass("is-invalid");
                }
            });
        });

    
    </script>
</html>