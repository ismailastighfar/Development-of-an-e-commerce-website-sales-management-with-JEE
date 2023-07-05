<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    
</head>
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

   <div class="content">
        <div class="text">
            <h2>IT Takes<br>Courage To Be <span>Genuine</span></h2>
            <p>Find a frame that's true to you</p>
             <s:url namespace="/" action="displayArticles" var="productPageUrl"></s:url>
          <s:a href="%{productPageUrl}" class="btnn">Order Now</s:a>
        </div>
        <div class="slider">
            <div class="slides active">
                <img src="assets/7.png" alt="">
            </div>
            <div class="slides">
                <img src="assets/6.png" alt="">
            </div>
            <div class="slides">
                <img src="assets/8.png" alt="">
            </div>
            <div class="slides">
                <img src="assets/9.png" alt="">
            </div>
        </div>
    </div>

    <div class="footer">
        <ul class="sci">
            <li><a href="#"><ion-icon name="logo-facebook"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="logo-instagram"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="logo-twitter"></ion-icon></a></li>
        </ul>
      
        <div class="prevNext">
            <p>Always Stylish</p>
            <span class="prev"><ion-icon name="chevron-back-outline"></ion-icon></span>
            <span class="next"><ion-icon name="chevron-forward-outline"></ion-icon></span>
        </div>
    </div>
</section>
</body>


<script>
    const slides = document.querySelectorAll('.slides');
    const prev = document.querySelector('.prev');
    const next = document.querySelector('.next');

    i=0;

    function ActivaSlide(n){
        for(slide of slides)
        slide.classList.remove('active');
        slides[n].classList.add('active'); 
    }

    next.addEventListener('click', function(){
        if(i == slides.length -1) {
            i=0;
            ActivaSlide(i);
        }
        else{
            i++;
            ActivaSlide(i)
        }
    })

    prev.addEventListener('click', function(){
        if(i == 0) {
            i=slides.length -1;
            ActivaSlide(i);
        }
        else{
            i--;
            ActivaSlide(i)
        }
    })

</script>
</html>

