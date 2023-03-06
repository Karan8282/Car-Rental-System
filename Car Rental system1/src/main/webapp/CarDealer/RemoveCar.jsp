<%@ page import="java.sql.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbuser = "system";
String dbpwd = "system";


Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con = DriverManager.getConnection(url,dbuser,dbpwd);

PreparedStatement ps = con.prepareStatement("DELETE FROM CAR WHERE CARID = ?");
ps.setInt(1, Integer.parseInt(request.getParameter("id")));
 ps.executeUpdate();
 RequestDispatcher r = request.getRequestDispatcher("Cardealer.jsp?action=viewCar");
 r.forward(request,response);
%>

</body>
</html>