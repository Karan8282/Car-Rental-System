<%@ page import="com.car.beans.CustomerBean,com.car.beans.CarDealerBean,java.sql.*" %>

<%!
	private Connection con;
	private PreparedStatement ps1;
	
%>

<%

try{
	ServletConfig cg = getServletConfig();
	String driver = cg.getInitParameter("driver");
	String url = cg.getInitParameter("url");
	String dbuser = cg.getInitParameter("user");
	String dbpwd = cg.getInitParameter("pwd");
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url,dbuser,dbpwd);
	
	ps1 = con.prepareStatement("INSERT INTO CUSTOMER VALUES(CUSTSEQ.NEXTVAL,?,?,?,?,?,?,?)");
	
}

catch(Exception se)
{
	se.printStackTrace();
}

	String val = request.getParameter("register");
	if(val.equals("registerCustomer")){
	CustomerBean cb = new CustomerBean();
	cb.setFirstName(request.getParameter("firstName"));
	cb.setLastName(request.getParameter("lastName"));
	cb.setEmail(request.getParameter("emailId"));
	cb.setMobileNo(request.getParameter("mobileNo"));
	cb.setPassword(request.getParameter("password"));
	cb.setAdharNo(request.getParameter("adharNo"));
	cb.setLicenseNo(request.getParameter("licenseNo"));
	
	ps1.setString(1,cb.getFirstName());
	ps1.setString(2,cb.getLastName());
	ps1.setString(3,cb.getEmail());
	ps1.setString(4,cb.getPassword());
	ps1.setInt(5,Integer.parseInt(cb.getMobileNo()));
	ps1.setInt(6,Integer.parseInt(cb.getAdharNo()));
	ps1.setString(7,cb.getLicenseNo());
	
	int result = ps1.executeUpdate();
	if(result == 1)
	{
		response.sendRedirect("http://localhost:4545/Car_Rental_system1/Home.jsp?register=customer");
	}
	
%>
	<h1><%= request.getParameter("register") %></h1>
	<h1><%= cb.getFirstName() %></h1>
	<h1><%= cb.getLastName() %></h1>
	<h1><%= cb.getEmail() %></h1>
	<h1><%= cb.getPassword() %></h1>
	<h1><%= cb.getMobileNo() %></h1>
	<h1><%= cb.getAdharNo() %></h1>
	<h1><%= cb.getLicenseNo() %></h1>
	
<% }
	if(val.equals("registerCardealer"))
	{
		CarDealerBean cdb = new CarDealerBean();
		cdb.setFirstName(request.getParameter("firstName"));
		cdb.setLastName(request.getParameter("lastName"));
		cdb.setEmail(request.getParameter("emailId"));
		cdb.setMobileNo(request.getParameter("mobileNo"));
		cdb.setPassword(request.getParameter("password"));
		cdb.setAdharNo(request.getParameter("adharNo"));
		System.out.println(System.getProperty("user.dir"));
		
		PreparedStatement ps2 = con.prepareStatement("INSERT INTO CARDEALER VALUES(CDSEQ.NEXTVAL,?,?,?,?,?,?)");
		
		ps2.setString(1,request.getParameter("firstName"));
		ps2.setString(2,request.getParameter("lastName"));
		ps2.setString(3,request.getParameter("emailId"));
		ps2.setString(4,request.getParameter("password"));
		ps2.setInt(5,Integer.parseInt(request.getParameter("mobileNo")));
		ps2.setInt(6,Integer.parseInt(request.getParameter("adharNo")));
		
		int result1 = ps2.executeUpdate();
		if(result1 == 1)
		{
			response.sendRedirect("http://localhost:4545/Car_Rental_system1/Home.jsp?register=cardealer");
		}
	%>	
	<h1><%= request.getParameter("register") %></h1>
	<h1><%= cdb.getFirstName() %></h1>
	<h1><%= cdb.getLastName() %></h1>
	<h1><%= cdb.getEmail() %></h1>
	<h1><%= cdb.getPassword() %></h1>
	<h1><%= cdb.getMobileNo() %></h1>
	<h1><%= cdb.getAdharNo() %></h1>
	<% 
	}
%>
