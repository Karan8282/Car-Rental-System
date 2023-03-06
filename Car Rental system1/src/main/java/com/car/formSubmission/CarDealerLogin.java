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


@WebServlet("/CardealerLogin")
public class CarDealerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context=getServletContext();  
		HttpSession session=request.getSession();  
        
		try {
			Connection con;
			Statement st=null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(context.getInitParameter("url"),context.getInitParameter("user"),context.getInitParameter("pwd"));
			st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT  * FROM CARDEALER");
			boolean flag = false;
			while(rs.next())
			{
				if(request.getParameter("email").contains(rs.getString(4)) && request.getParameter("pwd").contains(rs.getString(5)))
				{
					flag=true;
					session.setAttribute("id",rs.getInt(1));
					session.setAttribute("firstName",rs.getString(2));
					session.setAttribute("lastName",rs.getString(3));
				}
			}
			if(flag)
			{
				response.sendRedirect("CarDealer/Cardealer.jsp?action=home");  				
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
