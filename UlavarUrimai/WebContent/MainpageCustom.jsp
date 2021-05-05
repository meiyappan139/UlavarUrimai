<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>UlavarUrimai</title>
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="mainpage.css">
  <style type="text/css">
   
  </style>
  </head>
  <body>
	<%
	  String username=(String)session.getAttribute("username");
	  if(username==null)
      {
   	    out.println("<script>location.replace('Login.jsp')</script>");
      }
	%>
    <input type="checkbox" id="check">
    <!--header area start-->
    <header>
      <label for="check">
        <i class="fas fa-bars" id="sidebar_btn"></i>
      </label>
      <div class="left_area">
        <h3>Ulavar <span>Urimai</span></h3>
      </div>
      <div class="right_area">
        <a href="Logout.jsp" class="logout_btn">Logout</a>
      </div>
    </header>
    <!--header area end-->
    <!--sidebar start-->
    <div class="sidebar">
      <center>
        <img src="UpdateProfileCus" class="profile_image" alt="">
        <h5><%=username %></h5>
      </center>
      <a href="#dashboard"><i class="fas fa-desktop"></i><span>Dashboard</span></a>
      <a href="#cart"><i class="fas fa-shopping-cart"></i><span>Cart</span></a>
      <a href="#DeliveryReport"><i class="fas fa-file"></i><span>Delivery Report</span></a>
      <a href="#Rating"><i class="fas fa-star"></i><span>Ratings</span></a>
      <a href="#profileSetting"><i class="fas fa-sliders-h"></i><span>Profile Settings</span></a>
      <a href="#Contact"><i class="fas fa-question-circle"></i><span>Help and Support</span></a>
    </div>
    <!--sidebar end-->
    

    <div class="content">
       <div class="ulavar-container"  id="dashboard" style="padding-top:50px:">
             <br>
            
             
		 <jsp:include page="DashboardCustom.jsp"></jsp:include>

       </div>
       
       <div class="ulavar-container"  id="cart" >
         <br><br><br>
        
             <jsp:include page="CartCustomer.jsp"></jsp:include>
      
       </div>
       
      <div class="ulavar-container"  id="DeliveryReport" >
         <br><br><br>
        
             <jsp:include page="DeliveryReport.jsp"></jsp:include><br><br><br><br><br><br>
      
       </div>
       <div class="ulavar-container"  id="Rating" >
         <br><br><br>
        
             <jsp:include page="Ratings.jsp"></jsp:include>
      
       </div>
       
  
   <div class="ulavar-container" id="profileSetting">
    		<br><br><br>
             <jsp:include page="ProfileSettingCus.jsp"></jsp:include>
             
   </div>
  
  <div class="ulavar-container" id="Contact">
    
             <jsp:include page="Contact.jsp"></jsp:include>
             <br><br><br><br><br>
  </div>
  
   </div>

     



  </body>
</html>
      