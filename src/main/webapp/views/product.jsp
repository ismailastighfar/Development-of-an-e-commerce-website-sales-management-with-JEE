<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
    <title>Products List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/product.css">
 
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
  

 <div class="wrapper">
 
 
 
  <s:iterator value="articlesList">
    <div class="card">
		 <%-- Retrieve the codeArt value --%>
        <s:set var="codeArt" value="codeArt" />
        <%-- Use the codeArt value in if statement --%>
        <s:if test="#codeArt == 1">
             <img src="assets/6.png" alt="">
        </s:if>
        <s:elseif test="#codeArt == 2">
             <img src="assets/7.png" alt="">
        </s:elseif>
         <s:elseif test="#codeArt == 3">
             <img src="assets/6.png" alt="">
        </s:elseif>
       
        <div class="content">
            <div class="row">
                <div class="details">
                    <span><s:property value="nomArt"/></span>
                    <p><s:property value="descArt"/></p>
                    <p>Quantity : <s:property value="qteArt"/></p>
                </div>
                <div class="price">$<s:property value="prixArt"/></div> 
            </div>
            <div class="buttons">
			<s:url namespace="/" action="addCammand" var="lien4">
			<s:param name="code">
			<s:property value="codeArt"/>
			</s:param>
			</s:url>
			<s:a href="%{lien4}" class="button">Order Now</s:a>
            </div>
        </div>
    </div>
     </s:iterator>
    
  </div>


</body>
</html>
