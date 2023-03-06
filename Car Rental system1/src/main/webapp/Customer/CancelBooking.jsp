<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1><%=request.getParameter("id") %></h1>
	<%

	Connection con;
	PreparedStatement ps=null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbuser = "system";
	String dbpwd = "system";


	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url,dbuser,dbpwd);
	//ResultSet rs = st.executeQuery("SELECT  CAR.CARNAME, CAR.CARNUMBER, BOOKING.B_FROM,BOOKING.B_TO,BOOKING.TOTALDAYS,BOOKING.RENT FROM BOOKING INNER JOIN CAR ON BOOKING.CARID = CAR.CARID");
	ps = con.prepareStatement("DELETE FROM BOOKING WHERE BOOKINGID = ?");
	ps.setInt(1,Integer.parseInt(request.getParameter("id")));
	ps.executeUpdate();
	%>
	<jsp:forward page="Customer.jsp?action=MyBooking&Cancel=true" />;
</body>
</html>