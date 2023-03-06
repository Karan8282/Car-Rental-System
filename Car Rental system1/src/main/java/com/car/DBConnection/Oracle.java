package com.car.DBConnection;
import java.sql.*;
public class Oracle {
	static Connection con;
	public static Connection getConnection()
	{
		
		try {
		//Connection con;
		Statement st=null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbuser = "system";
		String dbpwd = "system";
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url,dbuser,dbpwd);
		//return con;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	

}
