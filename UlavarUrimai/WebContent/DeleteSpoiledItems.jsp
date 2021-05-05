<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="database.*" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
  <%@ page import="java.time.*" %>
	<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");  
	LocalDateTime now = LocalDateTime.now();  
	String today_date=dtf.format(now);
	Map<String,Integer> map=VegetableDetails.list();
  ///  out.println(today_date);
//	out.println("<br>");
	ArrayList<Integer> al=new ArrayList<Integer>();
    try
    {
    	Connection con=Database_Connection.get_connection();
    	String query="select * from vegetable";
    	String query_expen="insert into expenditure(phone,vegname,price,status)values(?,?,?,?)";
    	PreparedStatement preparedStatement=con.prepareStatement(query);
    	ResultSet rs=preparedStatement.executeQuery();
    	while(rs.next()){
    		
    		String vegtable_date=rs.getString("date");
    		int no_of_days=Calculate_No_of_Days.Calculate(vegtable_date, today_date);
    		String vegname=rs.getString("vegname");
    		int n=map.get(vegname);
              		
    	//	out.println(n+"------->"+no_of_days+"----> "+vegname+"------>"+rs.getInt("id"));
    		if(no_of_days>n)
    		{
    			al.add(rs.getInt("id"));// no vegname price 
    			int quantity=Integer.parseInt(rs.getString("quantity"));
    			int price=Integer.parseInt(rs.getString("price"));
    			int total=quantity*price;
    			String total_price=String.valueOf(total);
    			PreparedStatement preparedStatement2=con.prepareStatement(query_expen);
    			preparedStatement2.setString(1,rs.getString("phone"));
    			preparedStatement2.setString(2,rs.getString("vegname"));
    			preparedStatement2.setString(3,total_price);
    			preparedStatement2.setInt(4, 0);
    			preparedStatement2.executeUpdate();
    			
    			
    		}
    	//	out.println("<br>");
    		
    		
    		
    	}
    }
    catch(Exception e){
    	
    }
   // out.println(al);
    if(al.size()>0)
    {
    	for(int i=0;i<al.size();i++)
    	{
    		try
    		{
    			Connection con=Database_Connection.get_connection();
    			String query="delete from vegetable where id=?";
    			PreparedStatement preparedStatement=con.prepareStatement(query);
    			preparedStatement.setInt(1, al.get(i));
    			preparedStatement.executeUpdate();
    					
    		}
    		catch(Exception e){
    			out.println(e);
    		}
    	}
    }



%>

</body>
</html>