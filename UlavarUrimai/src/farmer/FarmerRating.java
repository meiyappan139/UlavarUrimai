package farmer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database_Connection;

/**
 * Servlet implementation class FarmerRating
 */
@WebServlet("/FarmerRating")
public class FarmerRating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String phone=request.getParameter("farmer_select");
		String rating=request.getParameter("rate");
		
		String query="select * from rating where phone=?";
		try
		{
			Connection con=Database_Connection.get_connection();
			PreparedStatement preparedStatement=con.prepareStatement(query);
			preparedStatement.setString(1, phone);
			ResultSet rs=preparedStatement.executeQuery();
			if(rs.next()) {
				int rating_from_DB=rs.getInt("rating");
				int count=rs.getInt("count");
				count++;
				int total_rating=Integer.parseInt(rating)+rating_from_DB;
			//	out.println(total_rating);
				String query_update="update rating set rating=?,count=? where phone=?";
				PreparedStatement preparedStatement2=con.prepareStatement(query_update);
				preparedStatement2.setInt(1, total_rating);
				preparedStatement2.setInt(2, count);
				preparedStatement2.setString(3, phone);
				preparedStatement2.executeUpdate();
				//out.println("Updation Successfull");
				out.println("<script>location.replace('MainpageCustom.jsp#Rating')</script>");
				
			}
			else {
				String query_insert="insert into rating(phone,rating,count) values(?,?,?)";
				PreparedStatement preparedStatement2=con.prepareStatement(query_insert);
				preparedStatement2.setString(1,phone);
				preparedStatement2.setInt(2, Integer.parseInt(rating));
				preparedStatement2.setInt(3, 1);
				preparedStatement2.executeUpdate();
				//out.println("Created");
				out.println("<script>location.replace('MainpageCustom.jsp#Rating')</script>");
			}
				
		}
		catch(Exception e) {
			out.println(e);
		}
//		out.println(phone);
//		out.println(rating);
		
	}

}
