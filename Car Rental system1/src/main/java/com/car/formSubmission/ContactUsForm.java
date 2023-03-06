package com.car.formSubmission;

import java.io.IOException;
import java.sql.*;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Customer/ContactUsForm")
public class ContactUsForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context=getServletContext(); 
		String driverName=context.getInitParameter("driver");
		String url = context.getInitParameter("url");
		String user = context.getInitParameter("user");
		String pwd = context.getInitParameter("pwd");
		 HttpSession session=request.getSession();  
		 int id = (int) session.getValue("id");
		try {
		Connection con = DriverManager.getConnection(url,user,pwd);
		PreparedStatement ps = con.prepareStatement("INSERT INTO QUERIES VALUES(QUERYSEQ.NEXTVAL,?,?,?,?)");
		
		ps.setString(1, request.getParameter("Cname"));
		ps.setString(2, request.getParameter("message"));
		ps.setInt(3, id);
		ps.setString(4, request.getParameter("email"));
		
		ps.executeUpdate();
		}
		catch(Exception e )
		{
			e.printStackTrace();
		}
		RequestDispatcher rd=request.getRequestDispatcher("Customer.jsp?action=Contact&success=true");  
        rd.forward(request, response);  
	}

}
