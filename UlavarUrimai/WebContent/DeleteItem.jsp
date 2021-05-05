<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
    <%@ page import="database.Database_Connection" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	    <link rel="stylesheet" href="mainpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <style>
    option,select,button,input
    {
     font-family: "Poppins", sans-serif;
    }
    </style>
    <script type="text/javascript">
		function Validate()
		{
		
			var mobile=document.getElementById("quantity").value;
			
			    var mobile_pattern=new RegExp("[0-9]+");
			
			if(mobile_pattern.test(mobile))
			{
				//window.alert("success");
				return true;
			}
			else
			{
				window.alert("quantity should contain only numbers");
				return false;
			}
		}
	</script>
</head>
<body>
<%
           //Getting phone number form session
           String phone=(String)session.getAttribute("phone");
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

<div class="ulavar-container" id="deleteItem">
 
    <h1 style="font-size: 40px;color:green;display: inline;text-align:center"><b>DeleteItem:</b></h1>
      <p>
     <img style="width:150px;height:150px;border-radius:50%;display: inline;" name="image-swap1" src="images/vegetables.jpg"></img></p>
    <hr style="margin-left:0px;border-radius:4px;width:150px;border:5px solid red" class="ulavar-round">
   
    <form method="post" action="RemoveItem">
 
      <div class="ulavar-section">
        <b><label for="vegetables">Select Item</label></b>
        <br><br>
        <select  class="ulavar-input ulavar-border" name="vegetables" id="vegetables" required style="width:70%"  name="vegname" onchange="setImage2(this);" required>
        <option value="">Select Vegetable</option>
           <%
	        for(Map.Entry<String,ArrayList<String>> entry : map.entrySet())
	        {
	       
	        String vegname=entry.getKey();
	        ArrayList<String> al=entry.getValue();
	        %>
	        <option value='<%=vegname%>' ><%=vegname%></option>
	       
	      <%
	        }
	      %>
        </select>
       
      </div>
      <div class="ulavar-section">
        <b><label for="quantity">Quantity as Kg</label></b>
        <br><br>
        <input class="ulavar-input ulavar-border" type="text" name="quantity"  id="quantity" placeholder="Quantity" required>
      </div>
      <button type="submit" class="ulavar-button ulavar-block ulavar-padding-large ulavar-red ulavar-margin-bottom" style="width:70%">DeleteItem</button>
    </form>  
    
    <br><br>
  </div>
  <script type="text/javascript">
function setImage2(select){
  var image = document.getElementsByName("image-swap1")[0];
  image.src = "images/"+select.options[select.selectedIndex].value+".jpg";
}
</script>

</body>
</html>