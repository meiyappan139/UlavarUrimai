package database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GeneralLogin
 */
@WebServlet("/GeneralLogin")
public class GeneralLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String phone=request.getParameter("phno");
		String password=request.getParameter("password");
		String fc=request.getParameter("choice");
		String longi=request.getParameter("logitude");
		String lati=request.getParameter("latitude");
		if(fc.equals("f"))
		{
			String query="select * from farmer where phone=? and password=?";
			try {
				Connection con=Database_Connection.get_connection();
			    PreparedStatement preparedStatement=con.prepareStatement(query);
			    preparedStatement.setString(1, phone);
			    preparedStatement.setString(2, password);
			    ResultSet rs=preparedStatement.executeQuery();
			    if(rs.next()) {
			    	
			    //	out.println("Yes found");
			    	HttpSession session=request.getSession(true);
			    	session.setAttribute("phone", rs.getString("phone"));
			    	session.setAttribute("username", rs.getString("username"));
			    	session.setAttribute("email", rs.getString("email"));
			    	session.setAttribute("longitude",longi);
			    	session.setAttribute("latitude", lati);
			        out.println("<script>location.replace('Mainpage.jsp')</script>");
			    	
			    	
			    }
			    else {
			    	out.println("<script>alert('Invalid Phone or Password')</script>");
			    	out.println("<script>location.replace('Login.jsp')</script>");
			    	
			    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
				out.println("<script>location.replace('Login.jsp')</script>");
			}
			
		}
		else if(fc.equals("c")) 
		{
			String query="select * from consumer where phone=? and password=?";
			try {
				Connection con=Database_Connection.get_connection();
			    PreparedStatement preparedStatement=con.prepareStatement(query);
			    preparedStatement.setString(1, phone);
			    preparedStatement.setString(2, password);
			    ResultSet rs=preparedStatement.executeQuery();
			    if(rs.next()) {
			    	
			    //	out.println("Yes found");
			    	HttpSession session=request.getSession(true);
			    	session.setAttribute("phone", rs.getString("phone"));
			    	session.setAttribute("username", rs.getString("username"));
			    	session.setAttribute("email", rs.getString("email"));
			    	session.setAttribute("longitude",longi);
			    	session.setAttribute("latitude", lati);
			        out.println("<script>location.replace('MainpageCustom.jsp')</script>");
			    	
			    	
			    }
			    else {
			    	out.println("<script>alert('Invalid Phone or Password')</script>");
			    	out.println("<script>location.replace('Login.jsp')</script>");
			    	
			    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//out.println(e);
				out.println("<script>location.replace('Login.jsp')</script>");
			}
			
		}
	}

}
