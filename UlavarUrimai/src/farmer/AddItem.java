package farmer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database_Connection;


/**
 * Servlet implementation class AddItem
 */
@WebServlet("/AddItem")
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession(true);
		String phone=(String) session.getAttribute("phone");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//Getting Fields from addItem
		String vegname=request.getParameter("vegname");
		String quantity=request.getParameter("quantity");
		String price=request.getParameter("price");
		
		//Getting the current Date
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");  
		LocalDateTime now = LocalDateTime.now();  
		String today_date=dtf.format(now);

		//Adding the item
		try
		{
			Connection con=Database_Connection.get_connection();
			String query="insert into vegetable(phone,vegname,date,quantity,price) values(?,?,?,?,?)";
			PreparedStatement preparedStatement=con.prepareStatement(query);
			preparedStatement.setString(1, phone);
			preparedStatement.setString(2, vegname);
			preparedStatement.setString(3, today_date);
			preparedStatement.setString(4,quantity);
			preparedStatement.setString(5, price);
			preparedStatement.executeUpdate();
			con.close();
			//out.println("inserted successfully");
		//	out.println("<script>alert('Successfully Added');</script>");
			out.println("<script>location.replace('Mainpage.jsp#addItems')</script>");
		
		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}	
	}

}
