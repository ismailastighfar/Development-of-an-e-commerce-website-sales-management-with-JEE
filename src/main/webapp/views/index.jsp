<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html>
<html>
<head>
    <title>RayBan - Sign In</title>
  
    <link rel="stylesheet" type="text/css" href="css/login.css">
    
   
</head>
<body>
   
      <nav>
        <a href="#"><img src="assets/Ray-ban-logo.jpg" alt="logo"></a>
    </nav>

    <div class="form-wrapper">
        <h2>Sign In</h2>
        <s:if test="hasActionErrors()">
        <div class="alert">
		  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
		    <s:actionerror />
		</div>  
          </s:if>
          
        
          
         <form action="login" method="POST" id="loginForm">
           <div class="form-control">
            <input type="text" name="user.login" required>
            <label>Username</label>
           </div>
           <div class="form-control">
            <input type="password" name="user.pass" required>
            <label>Password</label>
           </div>
           <button type="submit">Sign In</button>
           <div class="form-help">
            <div class="remember-me" id="remember-me">
                <input type="checkbox">
                <label for="remember-me">Remember me</label>
            </div>
            <a href="#">Need help?</a>
           </div>
        </form>
        <s:url namespace="/" action="registerFirst" var="lien1"></s:url>
        <p >New to RayBan? <s:a href="%{lien1}">Sign Up now</s:a></p>
    </div>
</body>
</html>
