package farmer;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import database.Database_Connection;

/**
 * Servlet implementation class UpdateProfile1
 */
@WebServlet("/UpdateProfile1")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
	maxFileSize=1024*1024*50,      	// 50 MB
		maxRequestSize=1024*1024*100) 
public class UpdateProfile1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		//phone from session variable:
		HttpSession session=request.getSession(true);
		String phone=(String) session.getAttribute("phone");
		
		//Getting resquest data
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String pincode=request.getParameter("pincode");
	    Part part=request.getPart("photo");
		String bool=request.getParameter("bool");
		
		//checking
//		out.println(phone);
//		out.println(username);
//		out.println(email);
//		out.println(address);
//		out.println(pincode);
//		out.println("----->"+bool);
//		out.println(part);
		
		if(bool.equals("0"))
		{
			
			String query="update farmer set username=?,email=?,address=?,pincode=?  where phone=?";
			try
			{
			 Connection con=Database_Connection.get_connection();
			 PreparedStatement preparedStatement=con.prepareStatement(query);
			 preparedStatement.setString(1, username);
			 preparedStatement.setString(2, email);
			 preparedStatement.setString(3, address);
			 preparedStatement.setString(4, pincode);
			 preparedStatement.setString(5, phone);
			 preparedStatement.executeUpdate();
		//	 out.println("hello without image");
			 
			}
			catch(Exception e) {
				out.println(e.getMessage());
			}
		}
		else
		{
			String query="update farmer set username=?,email=?,address=?,pincode=?,image=? where phone=?";
			try
			{
			 Connection con=Database_Connection.get_connection();
			 PreparedStatement preparedStatement=con.prepareStatement(query);
			 InputStream in=part.getInputStream();
			 preparedStatement.setString(1, username);
			 preparedStatement.setString(2, email);
			 preparedStatement.setString(3, address);
			 preparedStatement.setString(4, pincode);
			 preparedStatement.setBlob(5, in);
			 preparedStatement.setString(6, phone);
			 preparedStatement.executeUpdate();
		//	 out.println("hello with image");
			 
			}
			catch(Exception e) {
				out.println(e.getMessage());
			}
			
		}
		//out.println("<script>alert('Updated Successfully');</script>");
		out.println("<script>location.replace('Mainpage.jsp#profileSetting')</script>");
		
		
		
		
		
		
		
	}

}
