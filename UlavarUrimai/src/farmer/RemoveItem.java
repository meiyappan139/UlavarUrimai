package farmer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database_Connection;

/**
 * Servlet implementation class RemoveItem
 */
@WebServlet("/RemoveItem")
public class RemoveItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

		String vegetables=request.getParameter("vegetables");
		String quantity=request.getParameter("quantity");
		HttpSession session=request.getSession(true);
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
		      con.close();
	      // out.println(map);
	        }
	        catch(Exception e)
	        {
	        	out.println(e);
	        }
	        ArrayList<String> al1=map.get(vegetables);
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
					pst.setString(1, phone);
					pst.setString(2, vegetables);
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
			        //out.println("<script>alert('Successfully Deleted');</script>");
					out.println("<script>location.replace('Mainpage.jsp#DeleteItems')</script>");
			        con.close();
		        }
		        catch(Exception e)
		        {
		        	System.out.println(e);
	        	}
		       
		   }
        else
        {
	        out.println("<script>window.alert('insufficient Quantity');</script>");
	        out.println("<script>location.replace('Mainpage.jsp#DeleteItems')</script>");
        }
		       
	}

}
