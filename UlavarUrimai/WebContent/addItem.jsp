<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="database.*" %>
     <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UlavarUrimai</title>
    <link rel="stylesheet" href="mainpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <style>
    option,select,button
    {
     font-family: "Poppins", sans-serif;
    }
    </style>
</head>
<body>
<div class="ulavar-container" id="addItems">
 
    <h1 style="font-size: 40px;color:green;display: inline;text-align:center"><b>AddItem:</b></h1>
      <p>
     <img style="width:150px;height:150px;border-radius:50%;display: inline;" name="image-swap" src="images/vegetables.jpg"></img></p>
    <hr style="margin-left:0px;border-radius:4px;width:150px;border:5px solid red" class="ulavar-round">
   
    <form method="post" action="AddItem">
 
      <div class="ulavar-section">
        <b><label>Select Item</label></b>
        <br><br>
        <select  class="ulavar-input ulavar-border" style="width:70%"  name="vegname" onchange="setImage1(this);" required>
        <option value="">Select Vegetable</option>
       
         <%
           Map<String,Integer> map=VegetableDetails.list();
       //  out.println(map);
         for(Map.Entry<String,Integer> entry : map.entrySet())
         {
          %> 
	        <option value="<%=entry.getKey()%>"><%=entry.getKey() %></option>
	       <%
	           }
	       %>
        </select>
       
      </div>
	      <div class="ulavar-section">
	        <b><label>Quantity as Kg</label></b>
	        <br><br>
	        <input class="ulavar-input ulavar-border" type="text" name="quantity" required>
	      </div>
	      <div class="ulavar-section">
	        <b><label>Price per Kg</label></b>
	        <br><br>
	        <input class="ulavar-input ulavar-border" type="text" name="price" required>
	      </div>
      <button type="submit" class="ulavar-button ulavar-block ulavar-padding-large ulavar-red ulavar-margin-bottom" style="width:70%">AddItem</button>
    </form>  
    <br><br>
  </div>
  <script type="text/javascript">
function setImage1(select){
  var image = document.getElementsByName("image-swap")[0];
  image.src = "images/"+select.options[select.selectedIndex].value+".jpg";
}
</script>

</body>
</html>