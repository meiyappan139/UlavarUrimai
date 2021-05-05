package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database_Connection 
{
	
	public static Connection get_connection()
	{
		Connection con = null;
		try
		{
			String str="jdbc:mysql://localhost:3306/ulavarurimai";
			con=DriverManager.getConnection(str,"root","");
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
	

}
