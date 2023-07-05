<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html>
<html>
<head>
    <title>RayBan - Register</title>
    <!-- Include Bootstrap CSS and jQuery -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="text-center mt-5">Register at RayBan</h1>
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <form action="register" method="POST">
                    <s:if test="hasActionErrors()">
                        <div class="alert alert-danger">
                            <s:actionerror />
                        </div>
                    </s:if>
                    <div class="form-group">
                        <label for="login">Username:</label>
                        <input type="text" class="form-control" id="login" name="user.login" placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="user.pass" placeholder="Enter password">
                    </div>
                   
                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                </form>
                <p class="text-center mt-3">Already have an account? <a href="http://localhost:8081/rayban/">Login</a></p>
            </div>
        </div>
    </div>
</body>
</html>
