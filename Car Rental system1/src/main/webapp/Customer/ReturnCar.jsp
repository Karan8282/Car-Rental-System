<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
td,th{
	text-align:center;
}

</style>
</head>
<body>
<div>
<%
	if(Boolean.parseBoolean(request.getParameter("Cancel")))
	{
		%>
		<div class="alert alert-success alert-dismissible fade show" role="alert">
      <strong>Your car booking is cancelled.</strong> 
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
		<% 
		
	}
%>
<h1>Return Car</h1>
<hr>
<form >
<%
Connection con;
Statement st=null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbuser = "system";
String dbpwd = "system";


Class.forName("oracle.jdbc.driver.OracleDriver");



Connection con1 = DriverManager.getConnection(url,dbuser,dbpwd);
Statement st1 = con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
String query = "SELECT  CAR.CARNAME, CAR.CARNUMBER, BOOKING.B_FROM,BOOKING.B_TO,BOOKING.TOTALDAYS,BOOKING.RENT,BOOKING.BOOKINGID,BOOKING.STATUS FROM BOOKING INNER JOIN CAR ON BOOKING.CARID = CAR.CARID WHERE BOOKING.STATUS='Pending' AND BOOKING.CUSTOMERID = "+session.getValue("id");
ResultSet rs1 = st1.executeQuery(query);

if(rs1.next())
{
	rs1.beforeFirst();
	%>
	<table class="table">
            <thead class="table-dark">
              <tr>
                <!-- <th scope="col">#</th> -->
                <th scope="col">Order Number</th>
                <th scope="col">Car Name</th>
                <th scope="col">Car Number</th>
                <th scope="col">Booking From</th>
                <th scope="col">Booking To</th>
                <th scope="col">Total Days</th>
                <th scope="col">Rent</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
	<%
while(rs1.next())
{
	%>
	
       				
       			
              <tr>
              <th scope="row" ><%=rs1.getString(7)%></th>
                <td><%=rs1.getString(1)%></td>
                <td><%=rs1.getString(2)%></td>
                <td><%=rs1.getDate(3)%></td>
                <td><%=rs1.getDate(4)%></td>
                <td><%=rs1.getInt(5)%></td>
                <td><%=rs1.getInt(6)%></td>
                <%
                	if(rs1.getString(8).equals("Pending"))
                	{
                		%>
               				<td><a class="btn btn-primary" href="Customer.jsp?action=CarReturned&car=<%=rs1.getString(1)%>&id=<%=rs1.getString(7) %>" role="button">Return Car</a></td>
                		<% 
                	}
                	else
                	{
                		%>
                			<td></td>
                		<% 
                	}
                %>
              </tr>
           
	<%
}
	%>
	</tbody>
          </table>
	<%
}
else
{
	%>
		<h3>No Car Booked! Please book a car for rent.</h3>
	<%
}
%>
 
</form>
</div>

</body>
</html>