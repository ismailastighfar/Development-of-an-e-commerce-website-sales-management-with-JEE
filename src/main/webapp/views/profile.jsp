<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
      <link rel="stylesheet" type="text/css" href="css/profile.css">
</head>

<style>
        .hidden {
            display: none;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#editButton").click(function () {
                $("#profileForm").toggleClass("hidden");
            });
        });
    </script>
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
  
       <div class="container">
        <div class="profile-box">
            <img src="assets/menu.png" class="menu-icon">
            <img src="assets/setting.png" class="setting-icon">
            <img src="assets/user.png" class="profile-pic">
            <h3>user name</h3>
            <p><%= ((entities.Users)session.getAttribute("loggedInUser")).getLogin() %></p>
            <button type="button" id="editButton">Edit Profile</button>
            <div class="profile-bottom">
                <form class="form-horizontal hidden"  id="profileForm" action="updateUserInfo" method="post">
                            <s:if test="hasActionErrors()">
                                <div class="alert alert-danger role="alert"">
                                    <s:actionerror />
                                </div>
                            </s:if>
                              <s:if test="hasActionMessages()">
                                <div class="alert alert-success role="alert"">
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
								    <span aria-hidden="true">&times;</span>
								  </button>
                                   <s:actionmessage/>
                                </div>
                            </s:if>
                            <div class="form-group">
                                <label class="col-sm-3 control-label text-white">Username</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="user.login" value="<%= ((entities.Users)session.getAttribute("loggedInUser")).getLogin() %>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label text-white">Password</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" name="user.pass" value="************ss">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <input type="submit" class="btn" value="Update">
                                </div>
                            </div>
                        </form>
                       
            </div>
        </div>
    </div>
                       
    </section>
</body>
</html>
