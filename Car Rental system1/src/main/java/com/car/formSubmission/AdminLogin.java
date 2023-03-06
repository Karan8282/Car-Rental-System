package com.car.formSubmission;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context=getServletContext();  
		HttpSession session=request.getSession();  
        
		try {
		
				if(request.getParameter("email").contains("admin@car.com") && request.getParameter("pwd").contains("admin"))
				{
					
					session.setAttribute("id","7777");  
					response.sendRedirect("Admin/AdminDashboard.jsp?action=dashboard");  
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
