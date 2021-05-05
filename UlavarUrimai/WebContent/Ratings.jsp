<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="database.Database_Connection" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

* {
  margin: 0;
  padding: 0;
}
body {
  display: flex;
  min-height: 100vh;
  
  background: white;
}
.rating-css {
  height: 250px;
  width: 100%;
  
  background: white;
  
  padding: 20px;
}
.rating-css div {
  margin-left:0;
  color: gold;
  font-size: 25px;
  font-family: sans-serif;
  font-weight: 800;

  text-transform: uppercase;
  padding: 20px 0;
}
.rating-css input {
  display: none;
}
.rating-css input + label {
  font-size: 25px;
  text-shadow: 1px 1px 0 #ffe400;
  cursor: pointer;
}
.rating-css input:checked + label ~ label {
  color: #838383;
}
.rating-css label:active {
  transform: scale(0.8);
  transition: 0.3s ease;
}
</style>
  <title></title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
</head>

<body>
 <h1 style="font-size: 40px;color: green;"><b>Ratings</b></h1>
         <hr style="margin-left:0px;width:140px;border:5px solid red;border-radius: 4px;">

  <form method="post" action="FarmerRating">
  
  <%
    Map<String,String> map=new HashMap<String,String>();
    try
   {
     Connection con=Database_Connection.get_connection();
  	 String query="select * from farmer";
  	 PreparedStatement preparedStatement=con.prepareStatement(query);
  	 ResultSet rs=preparedStatement.executeQuery();
  	 while(rs.next())
  	 {
  		 map.put(rs.getString("username"),rs.getString("phone"));
  	 }
  //	 out.println(map);
   }catch(Exception e){
	   
   }
    
  
  %>
  <br><br><br>
  <h1>Select Farmer</h1>
   <br><br>
  <select  class="ulavar-input ulavar-border" style="width:70%"  name="farmer_select"  required>
        <option value="">Select Farmer</option>
       
         <%
        // out.println(map);
         for(Map.Entry<String,String> entry : map.entrySet())
         {
         	
        	   
           
         %> 
        <option value="<%=entry.getValue()%>"><%=entry.getKey() %></option>
       <%
           }
       %>
        </select>
  
  <div class="rating-css" onchange="isselect()">
    <br><br>
    <h4>note * : Initial Ratings is fixed Maximum:) You can select your own ratings :) </h4>
    
    <div class="star-icon">
      <input type="radio" name="rating1" id="rating1">
      <label for="rating1" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating2">
      <label for="rating2" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating3">
      <label for="rating3" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating4">
      <label for="rating4" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating5">
      <label for="rating5" class="fa fa-star"></label>
      
    </div>
  </div>
  <input type="hidden" id="rate" name="rate" value="5">
  <input type="submit" class="ulavar-button ulavar-block ulavar-padding-large ulavar-red ulavar-margin-bottom" style="width:70%" value="Rate">
  
  </form>

</body>
<script>
 function isselect()
 {
	 var num=0;
	 if(document.getElementById('rating1').checked)
     {
		 num=1;
     }
	 if(document.getElementById('rating2').checked)
     {
		 num=2;
     }
	 if(document.getElementById('rating3').checked)
     {
		 num=3;
     }
	 if(document.getElementById('rating4').checked)
     {
		 num=4;
     }
	 if(document.getElementById('rating5').checked)
     {
		 num=5;
     }
	 //alert(num);
	 document.getElementById('rate').value=num;
	 
 }
</script>
</html>