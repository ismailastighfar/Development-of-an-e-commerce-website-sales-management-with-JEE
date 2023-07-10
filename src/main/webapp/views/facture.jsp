<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
    
    <!-- these js files are used for making PDF -->
	<script src="../js/jspdf.js"></script>
	<script src="../js/jquery-2.1.3.js"></script>
	<script src="../js/pdfFromHTML.js"></script>
	<script>
	function  hasa(){
	var h=document.getElementById("HTMLtoPDF");
	var doc=new jsPDF()
	doc.fromHTML(h,30,30)
	return doc.save("facture.pdf")
	}
	</script>
	
</head>
<body>
<% 

String client=request.getParameter("commandes.client"); 
String codePdt=request.getParameter("commandes.codeArt"); 
String nomPdt=request.getParameter("article.nomArt"); 
String prixPdt=request.getParameter("article.prixArt"); 
String prixtt=request.getParameter("prixtotal"); 
String dateCmd=request.getParameter("date");
String qteCmd=request.getParameter("commandes.qteCmd");
String paymentMethod = request.getParameter("selectedPaymentMethod");
%>

<%
    
    if (session == null || session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("http://localhost:8081/rayban/");
    }
%>


<div class="container">
<div id="HTMLtoPDF">
    <div class="row">
    
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>Invoice</h2><h3 class="pull-right">Ordre </h3>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					<strong>Payment method</strong><br>
    					<%=paymentMethod %><br>
    					<strong>Client</strong><br>
    					<%=client %>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Order date</strong><br>
    					<%=dateCmd %><br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Order summary</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Item</strong></td>
        							<td class="text-center"><strong>Price(DH)</strong></td>
        							<td class="text-center"><strong>Quantity</strong></td>
        							<td class="text-right"><strong>Total Price(DH)</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>
    								<td><%=codePdt %>-<%=nomPdt %></td>
    								<td class="text-center"><%=prixPdt %></td>
    								<td class="text-center"><%=qteCmd %></td>
    								<td class="text-right"><%=prixtt %></td>
    							</tr>                             
    							
    						</tbody>
    					</table>
    				</div>
    			</div>   			
    		</div>	
    	</div>
   
    </div>
		    		
</div>

<button onclick="hasa()" class="btn btn-info">Download PDF</button>
		  
				<s:url  action="Home" var="lien5"></s:url>
				  <s:a href="%{lien5}" class="btn btn-success" >Return Home</s:a>	
				  
				  
	
	 	
</div>
</body>
</html>