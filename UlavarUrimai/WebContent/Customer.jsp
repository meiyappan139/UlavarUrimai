<%@page import="database.Database_Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="database.*" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
  <%@ page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<style>
table
	{
		width:1200px;
		margin: auto;
		text-align: center;
		table-layout: fixed;
		margin-top: 20px;
		margin-left: 0px;
	}
	table, th, td,tr
	{
		border: 1px solid #080808;
		padding:20px;
		color:white;
		border-collapse: collapse;
		font-size: 18px;
		font-family: arial;
		background:  gray;
        
     }
     th
      {
          background:purple;
       }
       td{
         color: black;
       }
   </style>
</head>
<body>
 <h1 style="font-size: 40px;color: green;"><b>Customers</b></h1>
         <hr style="margin-left:0px;width:220px;border:5px solid red;border-radius: 4px;">
<%
//Getting phone number form session
  String phone=(String)session.getAttribute("phone");
  String query="select * from purchase where farmer_no=?";
  try
  {
	  Connection con=Database_Connection.get_connection();
	  PreparedStatement preparedStatement=con.prepareStatement(query);
	  preparedStatement.setString(1,phone);
	  ResultSet rs=preparedStatement.executeQuery();
	  %>
  	<table>
  	<thead>
	    <tr>
	      <th scope="col">S.NO</th>
	      <th scope="col">Customer Name</th>
	      <th scope="col">Customer Mobile Number</th>
	      <th scope="col">Vegetable</th>
	      <th scope="col">Quantity</th>
	       <th scope="col">Price</th>
	        <th scope="col">Total</th>
	        <th scope="col">Delivery Status</th>
	    </tr>
	  </thead>
	  <tbody>
  	<%
  	int i=1;
	  while(rs.next())
	  {
		  
			%>
			<tr>
		      <td scope="row"><%=i %></td>
		      <td><%=rs.getString("cus_name") %></td>
		      <td><%=rs.getString("cus_no") %></td>
		      <td><%=rs.getString("vegname") %></td>
		      <td><%=rs.getString("quantity") %></td>
		      <td><%=rs.getString("price") %></td>
		      <td><%=rs.getString("total") %></td>
		      <%
		         if(rs.getString("status").equals("true"))
		         {
		        	 %>
		        	 <td><input type="submit" value="Delivered" style="background:green;"></td>
		        	 <% 
		         }
		         else
		         {
		        	 %>
		        	 <form action="changeStatus.jsp">
		        	 <input type="hidden" name="id" value="<%=rs.getInt("id")%>" >
		        	 <td><input type="submit" value="Deliver"  id="button" onclick="isClicked()"></td>
		        	 </form>
		        	 <%
		         }
		      %>
		      
		    </tr>
			<% 
		
			i++;
	  }
		%>
    	</table>
    	<%
  }
  catch(Exception e){
	  
	  
  }

%>
<script type="text/javascript">
 function isClicked()
 {
	 document.getElementById('button').value="Delivered";
	 document.getElementById('button').style.background="green";
 }
</script>
</body>
</html>