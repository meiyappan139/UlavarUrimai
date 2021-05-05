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
   //Session variables
   String phone_customer=(String)session.getAttribute("phone");
   String name_customer=(String)session.getAttribute("username");
   String vegname=(String)session.getAttribute("vegname");

   //request variables
   String quantity=request.getParameter("quantity");
   String farmer_name=request.getParameter("fname");
   String farmer_phone=request.getParameter("fphone");
   String vegprice=request.getParameter("vegprice");
   
   farmer_phone=farmer_phone.trim();
   
%>

<%  //  quantity -->Farmer vegname--->Farmer ()
	
	try
	{
		Connection con=Database_Connection.get_connection();
    	String query="insert into purchase(cus_name,cus_no,farmer_name,farmer_no,vegname,quantity,price,total,status) values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement=con.prepareStatement(query);
		preparedStatement.setString(1,name_customer);
		preparedStatement.setString(2,phone_customer);
		preparedStatement.setString(3,farmer_name);
		preparedStatement.setString(4,farmer_phone);
		preparedStatement.setString(5,vegname);
		preparedStatement.setString(6,quantity);
		preparedStatement.setString(7,vegprice);
		String total=Integer.toString(((Integer.parseInt(quantity))*(Integer.parseInt(vegprice))));
		preparedStatement.setString(8,total);
		preparedStatement.setString(9,"false");
		preparedStatement.executeUpdate();
		
		String query_expen="insert into expenditure(phone,vegname,price,status)values(?,?,?,?)";
		PreparedStatement preparedStatement2=con.prepareStatement(query_expen);
		preparedStatement2.setString(1, farmer_phone);
		preparedStatement2.setString(2,vegname);
		preparedStatement2.setString(3,total);
		preparedStatement2.setInt(4,1);
		preparedStatement2.executeUpdate();
		
		//out.println("Hello Succesfully done");
		//out.println("");
		//		preparedStatement.
	}
	catch(Exception e){
		out.println(e);
	}
		Map<String,ArrayList<String>> map=null;
		//Database Connection
		try
		{
			Connection con=Database_Connection.get_connection();
			String query="select * from vegetable where phone=?";
			PreparedStatement preparedStatement=con.prepareStatement(query);
			preparedStatement.setString(1,farmer_phone);
			ResultSet rs=preparedStatement.executeQuery();
			map=new HashMap<String,ArrayList<String>>();
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
			con.close();
			 //out.println(map);
		}
		catch(Exception e)
		{
		out.println(e);
		}
		ArrayList<String> al1=map.get(vegname);
		//System.out.println(al1.get(0)+" ------ "+quantity);
		if(Integer.parseInt(quantity)<=Integer.parseInt(al1.get(0)))
		{
			//out.println("<script>window.alert('possible');</script>");
			int quantity_to_be_deleted=Integer.parseInt(quantity);
			
			try
			{
				Connection con=Database_Connection.get_connection();
				String query="select * from vegetable where phone=? and vegname=?";
				PreparedStatement pst=con.prepareStatement(query);
				pst.setString(1, farmer_phone);
				pst.setString(2, vegname);
				ResultSet rs=pst.executeQuery();
				//ArrayList<Integer> row_no=new ArrayList<Integer>();
				while(rs.next())
				{
					int quantity_in_db=Integer.parseInt(rs.getString("quantity"));
					if(quantity_to_be_deleted>=quantity_in_db)
					{
						quantity_to_be_deleted-=quantity_in_db;
						String query1="delete from vegetable where id=?";
						PreparedStatement pst1=con.prepareStatement(query1);
						pst1.setString(1, rs.getString("id"));
						pst1.executeUpdate();
					}
					else
					{
						int update_quantity_in_db=quantity_in_db-quantity_to_be_deleted;
						quantity_to_be_deleted=0;
						String query1="update vegetable set quantity=? where id=?";
						PreparedStatement pst1=con.prepareStatement(query1);
						pst1.setString(1, String.valueOf(update_quantity_in_db));
						pst1.setString(2, rs.getString("id"));
						pst1.executeUpdate();
					}
					if(quantity_to_be_deleted==0)
						break;
				}
				
				  String emailtoBeSent="";
				  
					  String query_email="select email from farmer where phone=?";
					  PreparedStatement pre=con.prepareStatement(query_email);
					  pre.setString(1, farmer_phone);
					  ResultSet rs1=pre.executeQuery();
					  if(rs1.next()){
						  emailtoBeSent=rs1.getString("email");}
		
				//    out.println("<script>alert('"+emailtoBeSent+"');</script>");
				  //  SendEmail sendEmail=new SendEmail(emailtoBeSent, "Request to buy Item:", farmer_name, farmer_phone,name_customer, phone_customer, vegname, quantity, vegprice,Integer.toString(((Integer.parseInt(quantity))*(Integer.parseInt(vegprice)))), "CtoF");
				   // SendEmail.sendEmail();
				  
				    SendEmail.function(emailtoBeSent, "Request for Buy Item!" ,farmer_name, farmer_phone, name_customer, phone_customer, vegname, quantity, vegprice, Integer.toString(((Integer.parseInt(quantity))*(Integer.parseInt(vegprice)))), "CtoF");
					out.println("<script>alert('Successfully Purchased');</script>");
					out.println("<script>location.replace('MainpageCustom.jsp')</script>");
					con.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			
		}
		else
		{
			out.println("<script>window.alert('un sufficient');</script>");
		}
		
		


%>

</body>
</html>