<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html>
<html>
<head>
    <title>RayBan - Register</title>
    <!-- Include Bootstrap CSS and jQuery -->
   <link rel="stylesheet" type="text/css" href="css/login.css">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
          
         <form action="register" method="POST" id="registerForm">
           <div class="form-control">
            <input type="text" name="user.login" id="login" required>
            <label>Username</label>
           </div>
           
            <div class="form-control">
            <input type="text" name="user.email" id="email" required>
            <label>Email</label>
           </div>
           
           <div class="form-control">
            <input type="password" name="user.pass" id="password" required>
            <label>Password</label>
             <small>Minimum 8 characters, at least one uppercase letter, one symbol, and one digit.</small>
           </div>
           <div class="form-control">
            <input type="password" id="confirmPassword" required>
            <label>Confirm Password</label>
           </div>
           <button type="submit">Sign Up</button>
           <div class="form-help">
            <div class="remember-me" id="remember-me">
                <input type="checkbox">
                <label for="remember-me">Remember me</label>
            </div>
            <a href="#">Need help?</a>
           </div>
        </form>
         <p>Already have an account? <a href="http://localhost:8081/rayban/">Login</a></p>
    </div>
    
    
    
    
    
    
    
    
    
    
    

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
</body>
</html>
