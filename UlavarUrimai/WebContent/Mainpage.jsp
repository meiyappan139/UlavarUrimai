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
		    .ulavar-half img{
				  margin-bottom:-6px;
				  margin-top:16px;
				  opacity:1;
				  cursor:pointer;
		     }
			.ulavar-half img:hover{opacity:1}
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
        <img src="UpdateProfile" class="profile_image" alt="">
        <h5><%=username %></h5>
      </center>
      <a href="#dashboard"><i class="fas fa-desktop"></i><span>Dashboard</span></a>
      <a href="#addItems"><i class="fas fa-plus"></i><span>AddItems</span></a>
      <a href="#DeleteItems"><i class="fas fa-trash"></i><span>Delete Item</span></a>
      <a href="#customers"><i class="fas fa-user"></i><span>Customers</span></a>
      <a href="#Expenditure"><i class="fas fa-credit-card"></i><span>Expenditure</span></a>
      <a href="#Helpcultivation"><i class="fas fa-info-circle"></i><span>HelpCultivation</span></a>
      <a href="#profileSetting"><i class="fas fa-sliders-h"></i><span>Profile Settings</span></a>
      <a href="#Contact"><i class="fas fa-question-circle"></i><span>Help and Support</span></a>
    </div>
    <!--sidebar end-->
    

    <div class="content">
       
       <div class="ulavar-container"  id="dashboard" style="padding-top:50px:">
             <br><br><br>
			 <jsp:include page="Dashboard.jsp"></jsp:include>
       </div>
       
       
       <div class="ulavar-container"  id="addItems" >
              <br><br><br>
              <jsp:include page="addItem.jsp"></jsp:include>
       </div>
       
       
        <div class="ulavar-container"  id="DeleteItems" >
         <br><br><br>
                <jsp:include page="DeleteItem.jsp"></jsp:include>
        </div>
       
	    <div class="ulavar-container"  id="customers">
	      <br><br><br><br>
	      <jsp:include page="Customer.jsp"></jsp:include><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	    </div>
	   
		<div class="ulavar-container"  id="Expenditure">
		      <br><br><br><br>
		     <jsp:include page="Expenditure.jsp"></jsp:include><br><br><br><br><br>
	    </div>
		  
		<div class="ulavar-container" id="Helpcultivation">
		    		<br><br><br>
		             <jsp:include page="Helpcultivation.jsp"></jsp:include>
		 </div>
   
		 <div class="ulavar-container" id="profileSetting">
		              <br><br><br>
		             <jsp:include page="ProfileSetting.jsp"></jsp:include>
		 </div>
  
		  <div class="ulavar-container" id="Contact">
		            <jsp:include page="Contact.jsp"></jsp:include>
		             <br><br><br><br><br>
		</div>
    
    </div>

  </body>
</html>
      