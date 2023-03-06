package com.car.formSubmission;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RegisterCarDealer")
public class RegisterCarDealer extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterCarDealer() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con;
			PreparedStatement ps;
			ServletContext context=getServletContext();
			Class.forName(context.getInitParameter("driver"));
			
			if(request.getParameter("password").equals("cfPassword"))
			{
				response.sendRedirect("Home.jsp?register=passwordWrong");
			}
			else {
			con = DriverManager.getConnection(context.getInitParameter("url"),context.getInitParameter("user"),context.getInitParameter("pwd"));
			
			ps = con.prepareStatement("INSERT INTO CARDEALER VALUES(CDSEQ.NEXTVAL,?,?,?,?,?,?)");
			
			ps.setString(1,request.getParameter("firstName"));
			ps.setString(2,request.getParameter("lastName"));
			ps.setString(3,request.getParameter("emailId"));
			ps.setString(4,request.getParameter("password"));
			ps.setInt(5,Integer.parseInt(request.getParameter("mobileNo")));
			ps.setInt(6,Integer.parseInt(request.getParameter("adharNo")));
			
			int result = ps.executeUpdate();
			if(result == 1)
			{
				response.sendRedirect("Home.jsp?register=CarDealer");
			}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	}

