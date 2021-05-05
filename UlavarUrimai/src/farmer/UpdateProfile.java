package farmer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database_Connection;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
//		PrintWriter out=response.getWriter();
//		response.setContentType("text/html");
		
		//phone number from session
		HttpSession session=request.getSession(true);
		String phone=(String) session.getAttribute("phone");
		
		String query="select * from farmer where phone=?";
		
		ServletOutputStream sos=null;
		byte[] img=null;
		
		try
		{
			Connection con=Database_Connection.get_connection();
			PreparedStatement preparedStatement=con.prepareStatement(query);
			preparedStatement.setString(1, phone);
			ResultSet rs=preparedStatement.executeQuery();
			if(rs.next())
			{
//				out.println(rs.getString("username"));
//				out.println(rs.getString("address"));
//				out.println(rs.getString("email"));
//				out.println(rs.getString("pincode"));
//				out.println(rs.getString("longitude"));
				img=rs.getBytes("image");
			}
			sos=response.getOutputStream();
			sos.write(img);
		}
		catch(Exception e) {
			
		}
		
		
		
	}

	

}
