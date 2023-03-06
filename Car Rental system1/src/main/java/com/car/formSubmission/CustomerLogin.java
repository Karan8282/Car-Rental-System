package com.car.formSubmission;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con;
		Statement st=null;
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		ServletContext context=getServletContext(); 
		
		con = DriverManager.getConnection(context.getInitParameter("url"),context.getInitParameter("user"),context.getInitParameter("pwd"));
		st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT  * FROM CUSTOMER");
		HttpSession session = request.getSession();
		boolean flag = false;
		while(rs.next())
		{
			
			String email =request.getParameter("email"); 
			String pwd = request.getParameter("pwd");
			if(rs.getString(4).equals(email) && rs.getString(5).equals(pwd))
			{
				flag = true;
				session.putValue("id", rs.getInt(1));
				session.putValue("firstName", rs.getString(2));
				session.putValue("lastName", rs.getString(3));
			}
			
		}
		if(flag)
		{
			response.sendRedirect("Customer/Customer.jsp?action=home");
		}
		else
		{
			response.sendRedirect("Home.jsp?login=false");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
