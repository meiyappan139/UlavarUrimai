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
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body{
   font-family: "Poppins", sans-serif;
}
  .column{
    float:left;
    padding:10px;
    width:25.5%;
    }
    row::after { 
  content: "";
  display: table;
   clear: both;
   }
</style>
</head>
<body>
         <h1 style="font-size: 40px;color: green;"><b>Expenditure</b></h1>
         <hr style="margin-left:0px;width:220px;border:5px solid red;border-radius: 4px;">
<%
     //Getting phone number form session
     String phone=(String)session.getAttribute("phone");
	 String query="select * from expenditure where phone=?";
	 Map<String,ArrayList<Integer>> map=new HashMap<>();
	 try
	 {
		 Connection con=Database_Connection.get_connection();
		 PreparedStatement preparedStatement=con.prepareStatement(query);
		 preparedStatement.setString(1,phone);
		 ResultSet rs=preparedStatement.executeQuery();
		 while(rs.next())
         {
      	 if(!map.containsKey(rs.getString("vegname")))
	      	 {
	      		 ArrayList<Integer> al=new ArrayList<Integer>();
	      		 
	      		 al.add(0);
	      		 al.add(0);
	      		 if(rs.getInt("status")==1)
	      		 {
	      			 al.set(0,al.get(0)+Integer.parseInt(rs.getString("price")));
	      		 }
	      		 else
	      		 {
	      			al.set(1,al.get(1)+Integer.parseInt(rs.getString("price")));
	      		 }
	      		 
	      		 map.put(rs.getString("vegname"),al);
	      	 }
	      	 else
	      	 {
	      		 ArrayList<Integer> al=map.get(rs.getString("vegname"));
	      		 if(rs.getInt("status")==1)
	      		 {
	      			 al.set(0,al.get(0)+Integer.parseInt(rs.getString("price")));
	      		 }
	      		 else
	      		 {
	      			al.set(1,al.get(1)+Integer.parseInt(rs.getString("price")));
	      		 }
	      		 
	      		 
	      	 }
      	
         }
	 }
	 catch(Exception e){
		 out.println(e);
	 }%>
   
     <div class="row">     
     <%
       for(Map.Entry<String,ArrayList<Integer>> entry : map.entrySet())
       {
       	
       	String vegname=entry.getKey();
       	ArrayList<Integer> al=entry.getValue();
     %>
	   <div class="card column" style="width:400px;z-index: 1;">
	   <img class="card-img-bottom" src="images/<%=vegname %>.jpg" alt="Card image" style="width:150px;height:150px">
	    <div class="card-body">
	      <h4 class="card-title"><b><%=vegname %></b></h4>
	     
	      <p class="card-text"><b>Amount Sold :</b> Rs:<%=al.get(0) %></p>
	      <p class="card-text"><b>Amount of Rotten Vegetables :</b> Rs:<%=al.get(1) %></p>
	      
			  <%
			    int total=al.get(0)+al.get(1);
			  
			     if(total-al.get(1)==total)
			     {%>
			     
			     <% }
			     else
			     {
			    	 %>
			    	
			    <% }
			    %>
			     </div>
				  </div>
			    <%
		       }
			  %>
	     
	 </div>


</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</html>