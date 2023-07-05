<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Order</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/home.css">

    <script>
	    'use strict';
	                
	    document.addEventListener("DOMContentLoaded", ev => {
	        const elemForme = document.querySelector("#forme");
	        const elemQte = document.querySelector("#qte");
	        const elemAmount = document.querySelector("#amount");
	        
	        const changeHandler = () => {
	            elemAmount.value = (parseFloat(elemForme.value) * parseFloat(elemQte.value)).toFixed(2);
	        };
	        
	        elemForme.addEventListener("change", changeHandler);
	        elemQte.addEventListener("change", changeHandler);
	        
	        elemQte.dispatchEvent(new Event("change"));
	    });
    </script>

    <style>
    
   
body{
    display: flex;
    padding: 0 20px;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background:  radial-gradient(#f0483a,#d10a20);
    color: white;
}


        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .form-control[readonly] {
            background-color: #fff;
            cursor: not-allowed;
        }
    </style>
</head>
<body>

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

<section class="container">
    <div class="row">
        <div class="col-12">
            <h3 class="text-center">Create Order</h3>
            <s:form action="confirmCmd" method="POST">
                <s:iterator value="article">
                    <table>
                        <tr>
                            <td>Product Code</td>
                            <td>
                                <input class="form-control" type="text" value="${article.codeArt}" name="commandes.codeArt" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td>Client</td>
                            <td>
                                <input class="form-control" type="text" value="<%= ((entities.Users)session.getAttribute("loggedInUser")).getLogin() %>" name="commandes.client" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td>Product Name</td>
                            <td>
                                <input type="text" class="form-control" value="${article.nomArt}" name="article.nomArt" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td>Product Price(DH):</td>
                            <td>
                                <input id="forme" class="form-control" value="${article.prixArt}" name="article.prixArt" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="qteCmd">Quantity:</label></td>
                            <td>
                                <input type="number" id="qte" class="form-control" name="commandes.qteCmd" min="1" max="${article.qteArt}"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Date</label></td>
                            <td>
                                <% Date date = new Date(); %>
                                <input type="text" value="<%=date %>" class="form-control" name="commandes.dateCmd" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="amount">Price Total (DH):</label></td>
                            <td>
                                <input type="number" class="form-control" id="amount" name="prixtotal" readonly/>
                            </td>
                        </tr>
                        <s:submit value="save" class="btn btn-danger"/>
                    </table>
                </s:iterator>
            </s:form>
        </div>
    </div>
</section>
</body>
</html>
