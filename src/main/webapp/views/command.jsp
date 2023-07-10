<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Order</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/home.css">

    <script>
	    'use strict';
	                
	    document.addEventListener("DOMContentLoaded", ev => {
	        const elemPrice = document.querySelector("#productPrice");
	        const elemQte = document.querySelector("#quantity");
	        const elemAmount = document.querySelector("#amount");
	        
	        const changeHandler = () => {
	            elemAmount.value = (parseFloat(elemPrice.value) * parseFloat(elemQte.value)).toFixed(2);
	        };
	        
	        elemPrice.addEventListener("change", changeHandler);
	        elemQte.addEventListener("change", changeHandler);
	        
	        elemQte.dispatchEvent(new Event("change"));
	    });
	    
	    $(document).ready(function() {
	        // ...

	        // Handle the payment button click event
	        $("#paymentButton").click(function() {
	            // Validate the payment form
	            var cardNumber = $("#cardNumber").val();
	            var expiryDate = $("#expiryDate").val();
	            var cvv = $("#cvv").val()
	         // Get the selected payment method
	            var selectedPaymentMethod = $("#paymentMethodSelect").val();
	            
	            // Set the value of the hidden input field
	            $("#selectedPaymentMethod").val(selectedPaymentMethod);
	          

	           
	            if (cardNumber.trim() === '' || expiryDate.trim() === '' || cvv.trim() === '') {
	                alert("Please fill in all the payment details.");
	                return;
	            }

	            // Show the payment processing modal
	            $("#paymentProcessingModal").modal("show");

	            // Process the payment based on the selected payment method
	            switch (selectedPaymentMethod) {
	                case 'mastercard':
	                    processPayment(cardNumber, expiryDate, cvv, 'Mastercard');
	                    break;
	                case 'visa':
	                    processPayment(cardNumber, expiryDate, cvv, 'Visa');
	                    break;
	                case 'paypal':
	                    processPayment(cardNumber, expiryDate, cvv, 'PayPal');
	                    break;
	                default:
	                    // Handle unrecognized payment method
	                    alert("Invalid payment method selected.");
	                    return;
	            }
	        });

	        // Function to process the payment
	        function processPayment(cardNumber, expiryDate, cvv, selectedPaymentMethod) {
	            // Simulating payment processing delay with setTimeout
	            setTimeout(function() {
	                // Hide the payment processing modal
	                $("#paymentProcessingModal").modal("hide");

	                // Show the payment success modal
	                $("#paymentSuccessModal").modal("show");
	                
	               
	                $("#paymentModal").modal("hide");
	                // Enable the "Save" button
	                $("input[type='submit']").prop("disabled", false);
	            }, 2000);
	        }
	        
	        // Function to handle the "Continue" button click event
	        function handleContinueButtonClick() {
	            // Validate the payment form
	            var cardNumber = $("#cardNumber").val();
	            var expiryDate = $("#expiryDate").val();
	            var cvv = $("#cvv").val();
	            var selectedPaymentMethod = $("#paymentMethodSelect").val();

	            if (cardNumber.trim() === '' || expiryDate.trim() === '' || cvv.trim() === '') {
	                // Show the payment validation modal
	                $("#paymentValidationModal").modal("show");
	                return;
	            }

	        }

	        // Bind the handleContinueButtonClick function to the "Continue" button click event
	        $("#continueButton").click(handleContinueButtonClick);
	        
	     
	       
	        
            // Submit the form
	        $("#paymentForm").submit();
	       
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
    color: black;
    font-weight: 400;
    
     
    
}

h3{
  color: white;
    background:radial-gradient(#f0483a,#d10a20);
    border-radius : 50px;
   
}


        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin-top : 150px;
        }
        
        .form-control[readonly] {
            background-color: #fff;
            cursor: not-allowed;
        }
    </style>
</head>

<%
    
    if (session == null || session.getAttribute("loggedInUser") == null ) {
        response.sendRedirect("http://localhost:8081/rayban/");
    }
%>
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

<section class="container ">
    <div class="row justify-content-center col-md-8 align-items-center vh-100 mt-3 rounded bg-white">
        <div class="col-12">
            <h3 class="text-center p-3 mb-5 mt-3">Create Order</h3>
            <s:form action="confirmCmd" method="POST">
                <s:iterator value="article">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group ">
                <label for="productCode">Product Code</label>
                <input class="form-control" type="text" value="${article.codeArt}" name="commandes.codeArt" readonly/>
            </div>
             </div>
            <div class="col-md-6">
           
            <div class="form-group">
                <label for="ProductDescription">Product Description</label>
                <input id="ProductDescription" class="form-control" value="${article.descArt}" name="article.descArt" readonly/>
   </div>
          </div>
          
          <div class="col-md-6">
            <div class="form-group">
                <label for="productName">Product Name</label>
                <input type="text" class="form-control" value="${article.nomArt}" name="article.nomArt" readonly/>
            </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="productPrice">Product Price (DH)</label>
                <input id="productPrice" class="form-control" value="${article.prixArt}" name="article.prixArt" readonly/>
       </div>
            
           </div>
           
          <div class="col-md-6">
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" id="quantity" class="form-control" value="1" name="commandes.qteCmd" min="1" max="${article.qteArt}"/>
            </div>
              </div>
         <div class="col-md-6">
             <div class="form-group">
                <label for="amount">Price Total (DH)</label>
                <input type="number" class="form-control" id="amount" name="prixtotal" readonly/>
                <input type="hidden" id="selectedPaymentMethod" name="selectedPaymentMethod" value="" />
            </div>
          
        </div>
        
      <div class="col-md-6">
        <div class="form-group">
                <label for="date">Date</label>
                <% Date date = new Date(); %>
                <input type="text" value="<%=date %>" class="form-control" name="date" readonly/>
            </div>
   </div>
    <div class="col-md-6">
      <div class="form-group">
                <label for="client">Client</label>
                <input class="form-control" type="text" value="<%= ((entities.Users)session.getAttribute("loggedInUser")).getLogin() %>" name="commandes.client" readonly/>
            </div>
     </div>
    </div>
    
     <div class="form-group mt-3">
     <div class="d-flex justify-content-between">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#paymentModal"> <i class="bi bi-credit-card mr-2"></i>Payment Method</button>
            
        <input type="submit" id="continueButton" value="Continue" class="btn btn-danger"/>
     </div>
     </div>
            
            

<!-- Payment Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentModalLabel">Payment Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="paymentForm">
                    <div class="form-group">
                        <label for="cardNumber">Card Number</label>
                        <input type="text" class="form-control" id="cardNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="expiryDate">Expiry Date</label>
                        <input type="date" class="form-control" id="expiryDate" required>
                    </div>
                    <div class="form-group">
                        <label for="cvv">CVV</label>
                        <input type="text" class="form-control" id="cvv" required>
                    </div>
                    <div class="form-group">
                        <label for="paymentMethod">Payment Method:</label>
                        <select class="form-control" id="paymentMethodSelect">
                            <option value="mastercard">Mastercard</option>
                            <option value="visa">Visa</option>
                            <option value="paypal">PayPal</option>
                            <!-- Add more payment method options as needed -->
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="paymentButton">Continue</button>
            </div>
        </div>
    </div>
</div>

                </s:iterator>
            </s:form>
        </div>
    </div>
</section>

<div class="modal fade" id="paymentSuccessModal" tabindex="-1" role="dialog" aria-labelledby="paymentSuccessModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentSuccessModalLabel">Payment Successful</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Your payment has been successfully processed.</p>
                <!-- You can include additional payment details here -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="paymentProcessingModal" tabindex="-1" role="dialog" aria-labelledby="paymentProcessingModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentProcessingModalLabel">Payment Processing</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Please wait while your payment is being processed...</p>
            </div>
        </div>
    </div>
</div>

<!-- Payment Validation Modal -->
<div class="modal fade" id="paymentValidationModal" tabindex="-1" role="dialog" aria-labelledby="paymentValidationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentValidationModalLabel">Payment Validation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Please fill in all the payment details before continuing.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>
