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
           String phone="9994556635";
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
        <form  method="post" action="RemoveItem" onsubmit="return Validate();">
	    <label for="vegetables">Choose a Vegetable:</label>
	    <select name="vegetables" id="vegetables" required>
	    <option value="">select vegetables</option>
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
		 <br><br>
		 <label for="quantity">Enter quantity:</label>
		 <input type="text" name="quantity" id="quantity" placeholder="Quantity" required>
		 <br><br>
		 <input type="submit" value="Submit">
		</form>


</body>
</html>