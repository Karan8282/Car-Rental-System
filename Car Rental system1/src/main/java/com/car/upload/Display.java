package com.car.upload;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Display")
public class Display extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("herereee");
		byte[] img = null;
		ServletOutputStream sos =null;
		Connection con;
		Statement st=null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbuser = "system";
		String dbpwd = "system";
		
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,dbuser,dbpwd);
			st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT  * FROM CAR");
			System.out.println("id = "+request.getParameter("id"));
			System.out.println("img = "+request.getParameter("img"));
			while(rs.next())
			{
			
				if(request.getParameter("id") != null && request.getParameter("img") == null)
				{
					int id = Integer.parseInt(request.getParameter("id"));
					//int image = Integer.parseInt(request.getParameter("img"));
					if(id == rs.getInt(1))
					{
						img = rs.getBytes(10);
					}
				}
				
				if(request.getParameter("id") != null && request.getParameter("img") != null)
				{
					int id = Integer.parseInt(request.getParameter("id"));
					int image = Integer.parseInt(request.getParameter("img"));
					if(id == rs.getInt(1))
					{
						img = rs.getBytes(image);
					}
				}
				
			}
			sos = response.getOutputStream();
			sos.write(img);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}

}
