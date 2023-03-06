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
<%
Connection con;
PreparedStatement ps=null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbuser = "system";
String dbpwd = "system";


Class.forName("oracle.jdbc.driver.OracleDriver");

con = DriverManager.getConnection(url,dbuser,dbpwd);
String query = "UPDATE CARDEALER SET FIRSTNAME = ? , LASTNAME = ? , EMAIL = ? , PASSWORD = ? , MOBILENO = ? WHERE CDID = "+session.getValue("id");
ps = con.prepareStatement(query);

ps.setString(1,request.getParameter("fName"));
ps.setString(2,request.getParameter("lName"));
ps.setString(3,request.getParameter("email"));
ps.setString(4,request.getParameter("pwd"));
ps.setString(5,request.getParameter("mobileNo"));

ps.executeUpdate();


%>
<jsp:forward page="Cardealer.jsp?action=EditProfile&Success=true" />;
</body>
</html>