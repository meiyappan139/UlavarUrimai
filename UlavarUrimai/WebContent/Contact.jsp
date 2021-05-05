<%@page import="database.ContactEmail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="mainpage.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
	<style type="text/css">
		.ulavar-modal{z-index:3;display:none;padding-top:100px;position:fixed;left:0;top:0;width:100%;height:100%;overflow:auto;background-color:rgb(0,0,0);background-color:rgba(0,0,0,0.4)}
		.ulavar-modal-content{margin:auto;background-color:#fff;position:relative;padding:0;outline:0;width:600px}
		.ulavar-animate-top{position:relative;animation:animatetop 0.4s}@keyframes animatetop{from{top:300px;opacity:0} to{top:0;opacity:1}}
		.ulavar-card-4{box-shadow:0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19)}
		.ulavar-teal,.ulavar-hover-teal:hover{color:#fff!important;background-color:#009688!important}
		.ulavar-center .ulavar-bar{display:inline-block;width:auto}
		.ulavar-center .ulavar-bar-item{text-align:center}.ulavar-block{display:block;width:100%}
		.ulavar-padding-32{padding-top:12px!important;padding-bottom:12px!important}
		.ulavar-button,.ulavar-dropdown-click.ulavar-mobile,.ulavar-dropdown-click.ulavar-mobile .ulavar-btn,.ulavar-dropdown-click.ulavar-mobile .ulavar-button{width:100%;height:50%}}
		.ulavar-xlarge{font-size:24px!important}
		.ulavar-display-topright{position:absolute;right:0;top:0}
		.ulavar-container,.ulavar-panel{padding:0.01em 16px}.ulavar-panel{margin-top:16px;margin-bottom:16px}
		  body
		    {
		     font-family: "Poppins", sans-serif;
		    }
		    
		    .column{
		    float:left;
		    padding:1px;
		    width:24.5%;
		    }
		    row::after { 
		  content: "";
		  display: table;
		   clear: both;
		   }
	    </style>
</head>
<body>

 <br><br>
 <h1 style="font-size: 40px;color:green;"><b>Contact</b></h1>
    <hr style="border:5px solid red;border-radius: 4px;width:150px;margin-left:0px;" class="ulavar-round"><br>
    <div style="box-sizing: border-box;width:100%;">
     <div class="row" >
        <div  class="column">
          <img src="images/18EUIT084.JPG" alt="New York" style="width:40%;height:40%;margin-left:15px;" class="w3-hover-opacity">
          <div class="ulavar-container w3-white" onclick="setContactModal(this);">
            <p><b>Mugundhan S</b></p>
            <input type="hidden" id="mugi" value="18euit084@skcet.ac.in">
            <p class="ulavar-opacity">Studying at SKCET</p>
            <p>Full Stack Web Developer</p>
            <button class="ulavar-button ulavar-block ulavar-teal ulavar-padding-32 ulavar-section ulavar-right" style="width:150px;" onclick="document.getElementById('contactModal').style.display='block'">Contact</button>
          </div>
        </div>
        <div  class="column">
          <img src="images/18EUIT080.jpg" alt="New York" style="width:40%;height:40%;margin-left:15px;" class="w3-hover-opacity">
          <div class="ulavar-container w3-white" onclick="setContactModal(this);">
            <p><b>Meiyappan N</b></p>
            <input type="hidden" id="mei" value="18euit080@skcet.ac.in">
            <p class="ulavar-opacity">Studying at SKCET</p>
            <p>Full Stack Web Developer</p>
            <button class="ulavar-button ulavar-block ulavar-teal ulavar-padding-32 ulavar-section ulavar-right" style="width:150px;" onclick="document.getElementById('contactModal').style.display='block'">Contact</button>
          </div>
        </div>
        
        <div  class="column">
          <img src="images/18EUIT085.jpg" alt="New York" style="width:40%;height:40%;margin-left:15px;" class="w3-hover-opacity">
          <div class="ulavar-container w3-white" onclick="setContactModal(this);">
            <p><b>Mukesh S</b></p>
            <input type="hidden" id="mukesh" value="18euit085@skcet.ac.in">
            <p class="ulavar-opacity">Studying at SKCET</p>
            <p>Full Stack Web Developer</p>
            <button class="ulavar-button ulavar-block ulavar-teal ulavar-padding-32 ulavar-section ulavar-right" style="width:150px;" onclick="document.getElementById('contactModal').style.display='block'">Contact</button>
          </div>
        </div>
        
        <div  class="column">
          <img src="images/18EUIT088.jpg" alt="New York" style="width:40%;height:40%;margin-left:15px;" class="w3-hover-opacity">
          <div class="ulavar-container w3-white" onclick="setContactModal(this);">
            <p><b>MuthuBharathi k</b></p>
            <input type="hidden" id="muthu" value="18euit088@skcet.ac.in">
            <p class="ulavar-opacity">Studying at SKCET</p>
            <p>Full Stack Web Developer</p>
            <button class="ulavar-button ulavar-block ulavar-teal ulavar-padding-32 ulavar-section ulavar-right" style="width:150px;" onclick="document.getElementById('contactModal').style.display='block'">Contact</button>
          </div>
        </div>
        
      
      </div>
      </div>
    
    <form action="#Contact">
    <div id="contactModal" class="ulavar-modal">
	    <div class="ulavar-modal-content ulavar-animate-top ulavar-card-4">
	      <div class="ulavar-container">
	      <br><br>
	        <p><label><i class="fa fa-square"></i> Subject</label></p>
	        <input class="ulavar-input ulavar-border" name="subject" type="text" placeholder="Subject:">
	        <br>
	        <p><label><i class="fa fa-user"></i> Send To</label></p>
	        <input class="ulavar-input ulavar-border" name="mail" type="text" id="mail" value="">
	        <br>
	        <p><label><i class="fa fa-envelope"></i> Message</label></p>
	        <input class="ulavar-input ulavar-border" name="message" type="text" placeholder="Enter Message">
	        <input type="submit" value="Send Email" class="ulavar-button ulavar-block ulavar-teal ulavar-padding-32 ulavar-section ulavar-right"><i class="fa fa-check"></i></button>
	        <button class="ulavar-button ulavar-padding-32 ulavar-red ulavar-section" onclick="document.getElementById('contactModal').style.display='none'">Close <i class="fa fa-remove"></i></button>
	        <p class="ulavar-right">Need <a href="#" class="ulavar-text-blue">help?</a></p>
	      </div>
	    </div>
  </div>
  </form>
 
  <h1></h1>
  <h1></h1>
  <h2>To Know more about Our website:</h2>
    <a href="https://www.youtube.com/watch?v=aqiQniWhyjc">Click here</a>
 
    <script>
		var modal = document.getElementById('contactModal');
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
	</script>
<script>
  function  setContactModal(ele)
  {
	  var x=ele.children;
	  document.getElementById("mail").value=x[1].value;
	  
  }
</script>
<%
 
   String username=(String)session.getAttribute("username");
   String email=request.getParameter("mail");
   String message=request.getParameter("message");
   String subject=request.getParameter("subject");
   if(email!=null && subject!=null && message!=null)
    ContactEmail.function(email, subject, message, username);
 //  out.println("<script>location.replace('MainpageCustom.jsp')</script>");
   
 %>

</body>


</html>