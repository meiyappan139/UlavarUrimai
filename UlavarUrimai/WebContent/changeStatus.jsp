<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="database.*" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
    String id=request.getParameter("id");
	String query="update purchase set status=? where id=?";
	String query_pic="select * from purchase where id=?";
	try
	{
	  Connection con=Database_Connection.get_connection();
	  PreparedStatement preparedStatement=con.prepareStatement(query);
	  preparedStatement.setString(1,"true");
	  preparedStatement.setInt(2,Integer.parseInt(id));
	  preparedStatement.executeUpdate();
	  
	  PreparedStatement pre=con.prepareStatement(query_pic);
	  pre.setInt(1, Integer.parseInt(id));
	  ResultSet rs=pre.executeQuery();
	  
	  String farmer_phone="";
	  String farmer_name="";
	  String consumer_phone="";
	  String consumer_name="";
	  String vegname="";
	  String quantity="";
	  String price="";
	  String total="";
	  
	  if(rs.next())
	  {
		  farmer_name=rs.getString("farmer_name");
		  farmer_phone=rs.getString("farmer_no");
		  consumer_name=rs.getString("cus_name");
		  consumer_phone=rs.getString("cus_no");
		  vegname=rs.getString("vegname");
		  quantity=rs.getString("quantity");
		  price=rs.getString("price");
		  total=rs.getString("total");
		  
		  
	  }
	  String emailtoBeSent="";
	  
	  String query_email="select email from consumer where phone=?";
	  PreparedStatement pre1=con.prepareStatement(query_email);
	  pre1.setString(1, consumer_phone);
	  ResultSet rs1=pre1.executeQuery();
	  if(rs1.next()){
		  emailtoBeSent=rs1.getString("email");}
	  
	  SendEmail.function(emailtoBeSent, "Acknowledge of Item Purchased!" ,farmer_name, farmer_phone,consumer_name, consumer_phone, vegname, quantity, price, Integer.toString(((Integer.parseInt(quantity))*(Integer.parseInt(price)))), "FtoC");
	  
	  
	  out.println("<script>location.replace('Mainpage.jsp#customers')</script>");
	//  out.println("Ok done");
	}catch(Exception e){
		out.println(e);
	}
  

%>
<h1><%=id %></h1>
</body>
</html>