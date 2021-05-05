<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="database.Database_Connection" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UlavarUrimai</title>
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
         
         <h1 style="font-size: 40px;color: green;"><b>Cart</b></h1>
         <hr style="margin-left:0px;width:90px;border:5px solid red;border-radius: 4px;">
<%
    //session number
    String phone=(String)session.getAttribute("phone");

    if(phone==null)
    {
    	out.println("<script>location.replace('Login.jsp')</script>");
    }
    try
    {
		Connection con=Database_Connection.get_connection();
	    String query="select * from purchase where cus_no=?";
    	PreparedStatement preparedStatement=con.prepareStatement(query);
    	preparedStatement.setString(1, phone);
    	ResultSet rs=preparedStatement.executeQuery();
    	%>
    	<table>
    	<thead>
	    <tr>
	      <th scope="col">S.NO</th>
	      <th scope="col">Famer Name</th>
	      <th scope="col">Famer Mobile Number</th>
	      <th scope="col">Vegetable</th>
	      <th scope="col">Quantity</th>
	       <th scope="col">Price</th>
	        <th scope="col">Total</th>
	    </tr>
	  </thead>
	  <tbody>
    	<%
    	int i=1;
    	while(rs.next())
    	{
    	
    		if(rs.getString("status").equals("false"))
    		{
    			%>
    			<tr>
			      <td scope="row"><%=i %></td>
			      <td><%=rs.getString("farmer_name") %></td>
			      <td><%=rs.getString("farmer_no") %></td>
			      <td><%=rs.getString("vegname") %></td>
			      <td><%=rs.getString("quantity") %></td>
			      <td><%=rs.getString("price") %></td>
			      <td><%=rs.getString("total") %></td>
			    </tr>
    			<% 
    		//	out.println(rs.getString("cus_name")+" "++" "++"  "++"  "++" "++" "+);
    			//out.println("<br>");
    			i++;
    		}
    	}
    	%>
    	</table>
    	<%
    }
    catch(Exception e)
    {
    	
    }
    

%>

<br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>