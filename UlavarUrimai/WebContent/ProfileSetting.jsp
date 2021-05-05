<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="database.Database_Connection" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
 <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="mainpage.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="mainpage.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
</head>
<style>
body,button,input
{
   font-family: "Poppins", sans-serif;
}

</style>
<body>
   <h1 style="font-size: 40px;color: green;"><b>Profile Settings</b></h1>
         <hr style="margin-left:0px;width:270px;border:5px solid red;border-radius: 4px;">

<%
      //phone number from session
		String phone=(String)session.getAttribute("phone");
		String query="select * from farmer where phone=?";
		OutputStream sos=null;
		byte[] img=null;
		try
		{
			%>
			<form  method="post" action="UpdateProfile1" onclick="GFG_Fun()" enctype="multipart/form-data">
			<img id="output" src="UpdateProfile" style="width:150px;height:150px;border-radius:50%;display: inline;">
            <input name="photo" id="photo" type="file" style="display: inline;" accept="image/*" placeholder="Choose image" onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
			<br>
			<%
			Connection con=Database_Connection.get_connection();
			PreparedStatement preparedStatement=con.prepareStatement(query);
			preparedStatement.setString(1, phone);
			ResultSet rs=preparedStatement.executeQuery();
			if(rs.next())
			{
				%>
				<b>Name:</b><input class="ulavar-input ulavar-border" type="text" name="username" id="username" value='<%= rs.getString("username")%>'>
				<b>Email:</b><input class="ulavar-input ulavar-border" type="text" name="email" id="email" value='<%= rs.getString("email")%>'>
				<b>phone:</b><input class="ulavar-input ulavar-border" type="text" name="phone" id="phone" value='<%= rs.getString("phone")%>' readonly>
				<b>Address:</b><input class="ulavar-input ulavar-border" type="text" name="address" id="address" value='<%= rs.getString("address")%>'>
				<b>Pincode:</b><input class="ulavar-input ulavar-border" type="text"  name="pincode" id="pincode" value='<%= rs.getString("pincode")%>'>
				<input type="hidden" name="bool" id="bool"  value="">
				
				<%
			}
			%>
			 <input type="submit" value="update" class="ulavar-button ulavar-block ulavar-padding-large ulavar-red ulavar-margin-bottom" style="width:70%">
			 </form>
			<%
		}
		catch(Exception e) {
			
		}
		
%>



</form>
 <script type="text/javascript">
function setImage(select){
  var image = document.getElementsByName("suma")[0];
  image.src = select;
}

</script>
<script>
var file = document.getElementById("photo");
var bool=document.getElementById("bool");
function GFG_Fun() { 
	if(file.files.length == 0 ){ 
	//	alert("No");
	  bool.value="0";
	} else { 
	//	alert("yes");
		bool.value="1";
		
	} 
} 
</script>

</body>
</html>