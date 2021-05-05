<%@page import="database.VegetableDetails"%>
<%@page import="database.Calculate_Distance"%>
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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
.ulavar-modal{z-index:3;display:none;padding-top:100px;position:fixed;left:0;top:0;width:100%;height:100%;overflow:auto;background-color:rgb(0,0,0);background-color:rgba(0,0,0,0.4)}
.ulavar-modal-content{margin:auto;background-color:#fff;position:relative;padding:0;outline:0;width:600px}
.ulavar-animate-top{position:relative;animation:animatetop 0.4s}@keyframes animatetop{from{top:300px;opacity:0} to{top:0;opacity:1}}
.ulavar-card-4{box-shadow:0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19)}
.ulavar-teal,.ulavar-hover-teal:hover{color:#fff!important;background-color:#009688!important}
.ulavar-center .ulavar-bar{display:inline-block;width:auto}
.ulavar-center .ulavar-bar-item{text-align:center}.ulavar-block{display:block;width:100%}
.ulavar-padding-32{padding-top:12px!important;padding-bottom:12px!important}
.ulavar-button,.ulavar-dropdown-click.ulavar-mobile,.ulavar-dropdown-click.ulavar-mobile .ulavar-btn,.ulavar-dropdown-click.ulavar-mobile .ulavar-button{width:100%;height:50%}}
.ulavar-xlarge{font-size:24px!important}
.ulavar-display-topright{position:absolute;right:0;top:0}
.ulavar-container,.ulavar-panel{padding:0.01em 16px}.ulavar-panel{margin-top:16px;margin-bottom:16px}
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
<script type="text/javascript">
function getDistanceFromLatLonInKm(lat1,lon1,lat2,lon2) {
  var R = 6371; // Radius of the earth in km
  var dLat = deg2rad(lat2-lat1);  // deg2rad below
  var dLon = deg2rad(lon2-lon1); 
  var a = 
    Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
    Math.sin(dLon/2) * Math.sin(dLon/2)
    ; 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
  var d = R * c; // Distance in km
  alert(d);
  return d;
}

function deg2rad(deg) {
  return deg * (Math.PI/180)
}

</script>
<script type="text/javascript">
	navigator.geolocation
</script>
<body>
       <%
          //session
          //11.652596539012492, 78.13070119089343
          String longitude=(String)session.getAttribute("longitude");
          String latitude=(String)session.getAttribute("latitude");
          if(longitude==null)
          {
        	  out.println("<script>location.replace('Login.jsp')</script>");
          }
         
       
       %>
		 <br> <br> <br>
         <h1 style="font-size: 40px;color: green;"><b>Dashboard</b></h1>
         <hr style="margin-left:0px;width:220px;border:5px solid red;border-radius: 4px;">
         
         
          <div id="carouselExampleSlidesOnly"  class="carousel slide" data-ride="carousel">
				  <div class="carousel-inner" style="height:415px;object-fit: contain;">
				    <div class="carousel-item active">
				      <img class="d-block w-100" src="images/img6.jpg" width="10" height="400"  alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="images/img1.jpg" width="10" height="400"  alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="images/img3.jpg" width="10" height="400" alt="Third slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="images/img4.jpg" width="10" height="400"  alt="Third slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="images/img5.jpg" width="10" height="400"  alt="Third slide">
				    </div>
				  </div>
           </div>
         <form action="MainpageCustom.jsp">
         <b><label>Select Item</label></b>
         <select  class="ulavar-input ulavar-border" style="width:70%"  name="vegname" required>
         <option value="">Select</option>
          <option value="">Select Vegetable</option>
       
         <%
           Map<String,Integer> map1=VegetableDetails.list();
         //out.println(map1);
         for(Map.Entry<String,Integer> entry : map1.entrySet())
         {
          %> 
	        <option value="<%=entry.getKey()%>"><%=entry.getKey() %></option>
	       <%
	           }
	       %>
         </select>
         
         <br>
          <b><label>Filter Options</label></b>
         <select  class="ulavar-input ulavar-border" style="width:70%"  name="filter" required>
         <option value="Price">Filter by Price</option>
         <option value="Location">Filter by Location</option>
         <option value="Rating">Filter by Ratings</option>
         </select>
         <br>
         <input type="submit" value="Search">
         </form>
         <br><br>
         <%
            String vegname=request.getParameter("vegname");
            String filter=request.getParameter("filter");
            Map<String,ArrayList<String>> map=null;
            if(vegname!=null && filter!=null)
            {
              Connection con=Database_Connection.get_connection();
              String query="select * from vegetable where vegname=?";
              PreparedStatement preparedStatement=con.prepareStatement(query);
              preparedStatement.setString(1,vegname);
              ResultSet rs=preparedStatement.executeQuery();
              map=new HashMap<String,ArrayList<String>>();
              while(rs.next())
              {
            	  if(!map.containsKey(rs.getString("phone")))
 	        	 {
 	        		 ArrayList<String> al=new ArrayList<String>();
 	        		 al.add(rs.getString("quantity"));
 	        		 al.add(rs.getString("price"));
 	        		 map.put(rs.getString("phone"),al);
 	        		 String query1="select * from farmer where phone=?";
 	        		 PreparedStatement preparedStatement1=con.prepareStatement(query1);
 	        		 preparedStatement1.setString(1,rs.getString("phone"));
 	        		 ResultSet rs1=preparedStatement1.executeQuery();
 	        		 String longi="";
 	        		 String lat="";
 	        		 if(rs1.next())
 	        		 {
 	        			 al.add(rs1.getString("username"));
 	        			 longi=rs1.getString("longitude");
 	        			 lat=rs1.getString("latitude");
 	        		 }
 	        		 
 	        		// out.println("lati1--->"+latitude);
 	        		 //out.println("longi--->"+longitude);
 	        		// out.println("lati2-->"+lat);
 	        		// out.println("long2-->"+longi);
 	        		 
 	        		 double d=Calculate_Distance.distance(Double.parseDouble(latitude), Double.parseDouble(longitude), Double.parseDouble(lat), Double.parseDouble(longi), 'K');
 	        		 int dis=(int)d;
 	        		// out.println(dis);
 	        		 al.add(String.valueOf(dis));
 	        		 
 	        		 %>
 	        		
 	        		 <%
 	        	 }
 	        	 else
 	        	 {
 	        		 ArrayList<String> al=map.get(rs.getString("phone"));
 	        		 String quantity_FromList=al.get(0);
 	        		 String quantity_FromDB=rs.getString("quantity");
 	        		 String price_FromDB=rs.getString("price");
 	        		 al.set(1,price_FromDB);
 	        		 int total_quantity=Integer.parseInt(quantity_FromDB)+Integer.parseInt(quantity_FromList);
 	        		 al.set(0,Integer.toString(total_quantity));
 	        		 
 	        	 }
              }
              
       //      out.println(map);  
             %>
                 <div class="row">     
				      <%
				      
				        int ind=0;
				        int size_map=map.size();
				     
				        int price[]=new int[size_map];
				        int location[]=new int[size_map];
				        int rating[]=new int[size_map];
				        String farmer_name[]=new String[size_map];
				        String farmer_phone[]=new String[size_map];
				        String Quantity[]=new String[size_map];
				        for(Map.Entry<String,ArrayList<String>> entry : map.entrySet())
				        {
				        	
				        	String no=entry.getKey();
				        	farmer_phone[ind]=no;
				        	rating[ind]=0;
				        	try
				        	{
				        		Connection connection=Database_Connection.get_connection();
				        		String query_rating="select * from rating where phone=?";
				        		PreparedStatement preStatement=connection.prepareStatement(query_rating);
				        		preStatement.setString(1, no);
				        		ResultSet rsrate=preStatement.executeQuery();
				        		if(rsrate.next())
				        		{
				        			int rate=rsrate.getInt("rating");
				        			int count=rsrate.getInt("count");
				        			rating[ind]=rate/count;
				        		}
				        		
				        	}
				        	catch(Exception ex)
				        	{
				        		out.println(ex);
				        	}
				        	ArrayList<String> al=entry.getValue();
				        	Quantity[ind]=al.get(0);
				        	price[ind]=Integer.parseInt(al.get(1));
				        	location[ind]=Integer.parseInt(al.get(3));
				        	farmer_name[ind]=al.get(2);
				        	ind++;
				      
				        }
				        if(filter.equals("Location"))
				        {
				        	for(int i=0;i<ind;i++)
				        	{
				        		for(int j=i+1;j<ind;j++)
				        		{
				        			if(location[i]>location[j])
				        			{
				        				int tempLoc=location[i];
				        				location[i]=location[j];
				        				location[j]=tempLoc;
				        				
				        				int tempPrice=price[i];
				        				price[i]=price[j];
				        				price[j]=tempPrice;
				        				
				        				String tempQuan=Quantity[i];
				        				Quantity[i]=Quantity[j];
				        				Quantity[j]=tempQuan;
				        				
				        				String tempname=farmer_name[i];
				        				farmer_name[i]=farmer_name[j];
				        				farmer_name[j]=tempname;
				        				
				        				String tempPhone=farmer_phone[i];
				        				farmer_phone[i]=farmer_phone[j];
				        				farmer_phone[j]=tempPhone;
				        				
				        				int tempRate=rating[i];
				        				rating[i]=rating[j];
				        				rating[j]=tempRate;
				        				
				        			}
				        		}
				        	}
				        }
				        else if(filter.equals("Price"))
				        {
				        	for(int i=0;i<ind;i++)
				        	{
				        		for(int j=i+1;j<ind;j++)
				        		{
				        			if(price[i]>price[j])
				        			{
				        				int tempLoc=location[i];
				        				location[i]=location[j];
				        				location[j]=tempLoc;
				        				
				        				int tempPrice=price[i];
				        				price[i]=price[j];
				        				price[j]=tempPrice;
				        				
				        				String tempQuan=Quantity[i];
				        				Quantity[i]=Quantity[j];
				        				Quantity[j]=tempQuan;
				        				
				        				String tempname=farmer_name[i];
				        				farmer_name[i]=farmer_name[j];
				        				farmer_name[j]=tempname;
				        				
				        				String tempPhone=farmer_phone[i];
				        				farmer_phone[i]=farmer_phone[j];
				        				farmer_phone[j]=tempPhone;
				        				
				        				int tempRate=rating[i];
				        				rating[i]=rating[j];
				        				rating[j]=tempRate;
				        				
				        			}
				        		}
				        	}
				        }
				        else if(filter.equals("Rating"))
				        {
				        	for(int i=0;i<ind;i++)
				        	{
				        		for(int j=i+1;j<ind;j++)
				        		{
				        			if(rating[i]<rating[j])
				        			{
				        				int tempRate=rating[i];
				        				rating[i]=rating[j];
				        				rating[j]=tempRate;
				        				
				        				int tempLoc=location[i];
				        				location[i]=location[j];
				        				location[j]=tempLoc;
				        				
				        				int tempPrice=price[i];
				        				price[i]=price[j];
				        				price[j]=tempPrice;
				        				
				        				String tempQuan=Quantity[i];
				        				Quantity[i]=Quantity[j];
				        				Quantity[j]=tempQuan;
				        				
				        				String tempname=farmer_name[i];
				        				farmer_name[i]=farmer_name[j];
				        				farmer_name[j]=tempname;
				        				
				        				String tempPhone=farmer_phone[i];
				        				farmer_phone[i]=farmer_phone[j];
				        				farmer_phone[j]=tempPhone;
				        				
				        				
				        				
				        			}
				        		}
				        	}
				        }
				         
				        for(int i=0;i<ind;i++)
				        {
				        	
				      %>
					   <div class="card column" style="width:400px;z-index: 1;">
					    <div class="card-body"  onclick="setVisible(this);">
					      <b>Name:</b>
					      <h3 id="farmer_name"  class="card-title"><%=farmer_name[i] %></h3>
					      <b>Phone:</b>
					      <h3 id="farmer_phone" class="card-title"><%= farmer_phone[i]%></h3>
					      <b>Ratings:</b>
					      <h3 class="card-title"><%= rating[i]%>/5</h3>
					      <b>Vegetable Name:</b>
					      <h4 class="card-title"><%=vegname %></h4>
					      <b>Avaliable quantity:</b>
					      <h4 class="card-text"><%=Quantity[i] %>kg</h4>
					      <b>Price per kg:</b>
					      <h4 id="farmer_price" class="card-text"><%=price[i] %></h4>
					       <button  style="width:150px;margin-left:100px;"  >Buy</button>
					    </div>
					   
					  </div>  
					  <%
				        }
					  %>
	 			</div>
             
             <%
             
            }
            
            session.setAttribute("vegname", vegname);
            
            	
            
         %>
        <div id="buyModal" class="ulavar-modal">
		    <div class="ulavar-modal-content ulavar-animate-top ulavar-card-4">
		      <div class="ulavar-container">
		        <form action="AddToCart.jsp">
		        <p><label><i class="fa fa-square"></i>Enter Quantity:</label></p>
		        <input name="quantity" class="ulavar-input ulavar-border" type="text" placeholder="Quantity:" pattern="[0-9]+" title="Quantity should be number and greater than 0" required>
		        <br>
		        <p><label><i class="fa fa-user"></i>Farmer Name:</label></p>
		        <input name="fname" id="name_farmer" class="ulavar-input ulavar-border" type="text" value="">
		        <br>
		        <p><label><i class="fa fa-phone"></i>Farmer Phone:</label></p>
		        <input name="fphone" id="phone_farmer" class="ulavar-input ulavar-border" type="text" value="">
		        <br>
		        <input type="hidden"  id="vegprice" name="vegprice" value="" />
		        
		        <input type="submit" value="Buy" class="ulavar-button ulavar-block ulavar-teal ulavar-padding-32 ulavar-section ulavar-right"><i class="fa fa-check"></i>
		         </form>
		        <button class="ulavar-button ulavar-padding-32 ulavar-red ulavar-section" onclick="setVisibleFalse();">Close <i class="fa fa-remove"></i></button>
		        <p class="ulavar-right">Need <a href="#" class="ulavar-text-blue">help?</a></p>
		       
		      </div>
		    </div>
         </div>
      
	  <script>
var modal = document.getElementById('buyModal');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}


</script>
<script>
   function setVisible(ele)
   {
	   var x=ele.children;
	 //  alert(x[11].innerHTML);
	   document.getElementById('buyModal').style.display='block';
	   document.getElementById('name_farmer').value=x[1].innerHTML;
	   document.getElementById('phone_farmer').value=x[3].innerHTML;
	   document.getElementById('vegprice').value=x[11].innerHTML;
	  // alert(document.getElementById('farmer_name').innerHTML);
	   
   }

</script>
<script>
function setVisibleFalse()
{
    	document.getElementById('buyModal').style.display='none'
	   document.getElementById('name_farmer').value='';
	   document.getElementById('phone_farmer').value='';
	   document.getElementById('vegprice').value='';
	  // alert(document.getElementById('farmer_name').innerHTML);
	   
}

</script>
        
</body>
</html>