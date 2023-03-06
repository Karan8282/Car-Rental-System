<%@ page import="com.car.beans.AddCarBean,java.sql.*,java.io.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<%!
	private Connection con;
	private PreparedStatement ps1;
	FileInputStream fis= null;
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
	
	ps1 = con.prepareStatement("INSERT INTO CAR VALUES(CARSEQ.NEXTVAL,?,?,?,?,?,?,?,?)");
	
}

catch(Exception se)
{
	se.printStackTrace();
}

	String val = request.getParameter("addCar");
	//if(val.equals("addCar")){
	AddCarBean acb = new AddCarBean();
	acb.setCarName(request.getParameter("carName"));
	acb.setCarNo(request.getParameter("carNo"));
	acb.setNoOfSeats(request.getParameter("noOfSeats"));
	acb.setCarColor(request.getParameter("carColor"));
	acb.setModelYear(request.getParameter("modelYear"));
	acb.setFuelType(request.getParameter("fuelType"));
	acb.setCarDocuments(request.getParameter("carDocuments"));
	acb.setCarRent(request.getParameter("carRent"));
	System.out.println(acb.getCarDocuments());
	
	System.out.println(System.getProperty("user.dir"));


	
%>
	<h1><%= request.getParameter("addCar") %></h1>
	<h1><%= acb.getCarName() %></h1>
	<h1><%= acb.getCarNo() %></h1>
	<h1><%= acb.getNoOfSeats() %></h1>
	<h1><%= acb.getCarColor() %></h1>
	<h1><%= acb.getModelYear() %></h1>
	<h1><%= acb.getFuelType() %></h1>
	<h1><%= acb.getCarDocuments() %></h1>
	<h1><%= acb.getCarRent() %></h1>
	
<% 
//}

%>
