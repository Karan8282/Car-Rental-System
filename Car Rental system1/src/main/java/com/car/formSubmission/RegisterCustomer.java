package com.car.formSubmission;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RegisterCustomer")
public class RegisterCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Connection con;
			PreparedStatement ps;
			ServletContext context=getServletContext();
			Class.forName(context.getInitParameter("driver"));
			
			con = DriverManager.getConnection(context.getInitParameter("url"),context.getInitParameter("user"),context.getInitParameter("pwd"));
			
			ps = con.prepareStatement("INSERT INTO CUSTOMER VALUES(CUSTSEQ.NEXTVAL,?,?,?,?,?,?,?)");
			
			ps.setString(1,request.getParameter("firstName"));
			ps.setString(2,request.getParameter("lastName"));
			ps.setString(3,request.getParameter("emailId"));
			ps.setString(4,request.getParameter("password"));
			ps.setInt(5,Integer.parseInt(request.getParameter("mobileNo")));
			ps.setInt(6,Integer.parseInt(request.getParameter("adharNo")));
			ps.setString(7,request.getParameter("licenseNo"));
			
			int result = ps.executeUpdate();
			if(result == 1)
			{
				response.sendRedirect("Home.jsp?register=customer");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
