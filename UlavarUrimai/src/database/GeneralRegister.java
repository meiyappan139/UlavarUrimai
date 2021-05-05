package database;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class GeneralRegister
 */
@WebServlet("/GeneralRegister")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
	maxRequestSize=1024*1024*100) 
public class GeneralRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		    response.setContentType("text/html");
		    PrintWriter out=response.getWriter();
		    String phno=request.getParameter("phno");
    		String username=request.getParameter("username");
    		String email=request.getParameter("email");
			String address=request.getParameter("address");
			String pincode=request.getParameter("pincode");
			//out.println("--->");
			String longitude=request.getParameter("logitude");
			String latitude=request.getParameter("latitude");
			String password=request.getParameter("password");
			String confirmpassword=request.getParameter("confirmpassword");
			String fc=request.getParameter("option");
			
			Part part=request.getPart("photo"); //->photo part
			InputStream in=part.getInputStream();//In  part
			
			
			   
					if(fc.equals("f"))
					{
						try
						{
							String query_search="select * from farmer where phone=?";
							Connection connection=Database_Connection.get_connection();
							PreparedStatement preStatement=connection.prepareStatement(query_search);
							preStatement.setString(1, phno);
							ResultSet rs=preStatement.executeQuery();
							
							
							if(rs.next())
							{
								out.println("<script>alert('User Already Exists')</script>");
								out.println("<script>location.replace('Register.jsp')</script>");
							}
							else
							{
						
								String query="insert into farmer(phone,username,email,password,address,pincode,image,longitude,latitude) values(?,?,?,?,?,?,?,?,?)";
								try
								{
									 Connection con=Database_Connection.get_connection();
									 PreparedStatement preparedStatement=con.prepareStatement(query);
									 preparedStatement.setString(1, phno);
									 preparedStatement.setString(2, username);
									 preparedStatement.setString(3, email);
									 preparedStatement.setString(4, password);
									 preparedStatement.setString(5, address);
									 preparedStatement.setString(6, pincode);
									 preparedStatement.setBlob(7, in);
									 preparedStatement.setString(8, longitude);
									 preparedStatement.setString(9, latitude);
									 preparedStatement.executeUpdate();
									 SendEmail.function(email, "Registration Successfull!" ,"", "",username, "", "", "", "","", "to");
									 out.println("<script>location.replace('Login.jsp')</script>");
								 
								}
								catch(Exception e) {
									out.println(e.getMessage());
								}
							}
						}
							catch (Exception e) {
								// TODO: handle exception
							}
					}
					else if(fc.equals("c")) {
						
						try
						{
							String query_search="select * from consumer where phone=?";
							Connection connection=Database_Connection.get_connection();
							PreparedStatement preStatement=connection.prepareStatement(query_search);
							preStatement.setString(1, phno);
							ResultSet rs=preStatement.executeQuery();
							
							
							if(rs.next())
							{
								out.println("<script>alert('User Already Exists')</script>");
								out.println("<script>location.replace('Register.jsp')</script>");
							}
							else
							{
						
								String query="insert into consumer(phone,username,email,password,address,pincode,image) values(?,?,?,?,?,?,?)";
								try
								{
								 Connection con=Database_Connection.get_connection();
								 PreparedStatement preparedStatement=con.prepareStatement(query);
								 preparedStatement.setString(1, phno);
								 preparedStatement.setString(2, username);
								 preparedStatement.setString(3, email);
								 preparedStatement.setString(4, password);
								 preparedStatement.setString(5, address);
								 preparedStatement.setString(6, pincode);
								 preparedStatement.setBlob(7, in);
								 preparedStatement.executeUpdate();
								 SendEmail.function(email, "Registration Successfull!" ,"", "",username, "", "", "", "","", "to");
								 out.println("<script>location.replace('Login.jsp')</script>");
								}
								catch(Exception e) {
									out.println(e.getMessage());
								}
							}
							
							}
						catch (Exception e) {
							// TODO: handle exception
						}
			   }
			
			
	}

}
