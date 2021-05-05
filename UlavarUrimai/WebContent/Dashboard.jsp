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
		 <link rel="stylesheet" href="mainpage.css">
		 <meta name="viewport" content="width=device-width, initial-scale=1">
		 <link rel="stylesheet" href="mainpage.css">
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
		 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
		
		<style type="text/css">
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
         <h1 style="font-size: 50px; color:green;"><b>Welcome Farmer</b></h1>
         <h1 style="font-size: 40px;color: green;"><b>Dashboard</b></h1>
         <hr style="margin-left:0px;width:220px;border:5px solid red;border-radius: 4px;">
         
        <%
           //Getting phone number form session
           String phone=(String)session.getAttribute("phone");
           int rate_=0;
	        try
	    	{
	    		Connection connection=Database_Connection.get_connection();
	    		String query_rating="select * from rating where phone=?";
	    		PreparedStatement preStatement=connection.prepareStatement(query_rating);
	    		preStatement.setString(1, phone);
	    		ResultSet rsrate=preStatement.executeQuery();
	    		if(rsrate.next())
	    		{
	    			int rate=rsrate.getInt("rating");
	    			int count=rsrate.getInt("count");
	    			rate_=rate/count;
	    		}
	    		
	    	}
	    	catch(Exception ex)
	    	{
	    		out.println(ex);
	    	}
	        %>
	        <h3><b>Your Ratings :</b> <%=rate_%>/5</h3>
          <%
           Map<String,ArrayList<String>> map=null;
           //Database Connection
           try
           {
	           Connection con=Database_Connection.get_connection();
	           String query="select * from vegetable where phone=?";
	           PreparedStatement preparedStatement=con.prepareStatement(query);
	           preparedStatement.setString(1,phone);
	           ResultSet rs=preparedStatement.executeQuery();
	           map=new HashMap<String,ArrayList<String>>();
	           // t 40  map  t 50
	           while(rs.next())
	           {
	        	 if(!map.containsKey(rs.getString("vegname")))
	        	 {
	        		 ArrayList<String> al=new ArrayList<String>();
	        		 al.add(rs.getString("quantity"));
	        		 al.add(rs.getString("price"));
	        		 map.put(rs.getString("vegname"),al);
	        	 }
	        	 else
	        	 {
	        		 ArrayList<String> al=map.get(rs.getString("vegname"));
	        		 String quantity_FromList=al.get(0);
	        		 String quantity_FromDB=rs.getString("quantity");
	        		 String price_FromDB=rs.getString("price");
	        		 al.set(1,price_FromDB);
	        		 int total_quantity=Integer.parseInt(quantity_FromDB)+Integer.parseInt(quantity_FromList);
	        		 al.set(0,Integer.toString(total_quantity));
	        		 
	        	 }
	        	
	           }
	          // out.println(map);
           }
       		catch(Exception e)
           {
       			out.println(e);
           }
            
        %>
      
    <div class="row">     
      <%
        for(Map.Entry<String,ArrayList<String>> entry : map.entrySet())
        {
        	
        	String vegname=entry.getKey();
        	ArrayList<String> al=entry.getValue();
      %>
	   <div class="card column" style="width:400px;z-index: 1;">
	   <img class="card-img-bottom" src="images/<%=vegname %>.jpg" alt="Card image" style="width:100%;height:50%">
	    <div class="card-body">
	      <h4 class="card-title"><b><%=vegname %></b></h4>
	      <p class="card-text"><b>Avalibable quantity :</b><%=al.get(0) %>kg</p>
	      <p class="card-text"><b>Price per kg :</b><%=al.get(1) %></p>
	    </div>
	  </div>  
	  <%
        }
	  %>
	 </div>
	  
</body>
</html>