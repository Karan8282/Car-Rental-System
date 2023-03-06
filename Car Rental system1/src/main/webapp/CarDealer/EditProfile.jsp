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
	if(Boolean.parseBoolean(request.getParameter("Success")))
	{
		%>
		<div class="alert alert-success alert-dismissible fade show" role="alert">
      <strong>Profile updated successfully.</strong> 
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
		<% 
		
	}
%>
<%
Connection con;
Statement st=null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbuser = "system";
String dbpwd = "system";


Class.forName("oracle.jdbc.driver.OracleDriver");

con = DriverManager.getConnection(url,dbuser,dbpwd);
st = con.createStatement();
String query = "SELECT  * FROM CARDEALER WHERE CDID = "+session.getValue("id");
ResultSet rs = st.executeQuery(query);

while(rs.next())
{
	%>
<form method="POST" action = "ChangeProfileInfo.jsp">
<h1>Edit Profile</h1>
<hr>
	<table>
	<tr>
	<td><b>First Name : </b></td>
	<td><input type="text" value="<%=rs.getString(2)%>" name="fName"></td>
	</tr>
	<tr>
	<td><b>Last Name : </b></td>
	<td><input type="text" value="<%=rs.getString(3)%>" name="lName"></td>
	</tr>
	<tr>
	<td><b>Email ID : </b></td>
	<td><input type="text" value="<%=rs.getString(4)%>" name="email"></td>
	</tr>
	<tr>
	<tr>
	<td><b>Password : </b></td>
	<td><input type="password" value="<%=rs.getString(5)%>" name="pwd"></td>
	</tr>
	<td><b>Mobile No : </b></td>
	<td><input type="text" value="<%=rs.getString(6)%>" name="mobileNo"></td>
	</tr>
	<tr>
	<td><input type="submit"></td>
	</tr>
	</table>
	</form>
	<%
	}
%>
</body>
</html>