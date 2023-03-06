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
<%! 
int totalCars = 0;
int petrolCars = 0;
int dieselCars = 0;
int currBooking=0;
int totalBooking = 0;
%>

 <% 
    	try{
    	
    		Connection con;
    		Statement st=null;
    		String driver = "oracle.jdbc.driver.OracleDriver";
    		String url = "jdbc:oracle:thin:@localhost:1521:xe";
    		String dbuser = "system";
    		String dbpwd = "system";
    		
    		
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		
    		con = DriverManager.getConnection(url,dbuser,dbpwd);
    		st = con.createStatement();
    		String query = "SELECT  * FROM CAR WHERE ADDEDBY = "+session.getAttribute("id");
    		ResultSet rs = st.executeQuery(query);
    		
    		Connection con1 = DriverManager.getConnection(url,dbuser,dbpwd);
    		Statement st1 = con1.createStatement();
    		String query1 = "SELECT  B.STATUS,B.CARID FROM Booking B,car C WHERE B.CARID = C.CARID AND C.ADDEDBY = "+session.getAttribute("id");
    		ResultSet rs1 = st1.executeQuery(query1);
    		
    		while(rs.next())
    		{
    			totalCars++;
    			if(rs.getString(7).equals("Petrol"))
    				petrolCars++;
    			if(rs.getString(7).equals("Disel"))
    				dieselCars++;
    		}
    		
    		while(rs1.next())
    		{
    			if(rs1.getString(1).equals("Pending"))
    			{
    				currBooking++;	
    			}
    			totalBooking++;
    				
    		}
    	}
 catch(Exception e)
 {
	 e.printStackTrace();
 }
    %>

      <div>
    <h1 class="mt-3">Dashboard</h1><hr>

    <!-- cards -->
    <div style="flex-direction: row;display: flex;flex-wrap: wrap;gap:4vw">
    <div class="card" style="width: 18rem;">
  <div class="card-img-top" style="background-color:goldenrod;height:150px;display: flex;justify-content: center;align-items: center;text-align:center;"><h2><%=totalCars%></h2></div>
  <div class="card-body">
    <p class="card-text"><b>Total Cars Added</b></p>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-img-top" style="background-color:blueviolet;height:150px;display: flex;justify-content: center;align-items: center;text-align:center;"><h2><%=petrolCars%></h2></div>
  <div class="card-body">
    <p class="card-text"><b>Petrol Cars</b></p>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <div class="card-img-top" style="background-color:crimson;height:150px;display: flex;justify-content: center;align-items: center;text-align:center;"><h2><%=dieselCars%></h2></div>
  <div class="card-body">
    <p class="card-text"><b>Diesel Cars</b></p>
  </div>
</div>

<div class="card" style="width: 18rem;">
  <div class="card-img-top" style="background-color:yellowgreen;height:150px;display: flex;justify-content: center;align-items: center;text-align:center;"><h2><%=currBooking%></h2></div>
  <div class="card-body">
    <p class="card-text"><b>Current Bookings</b></p>
  </div>
</div>

 <div class="card" style="width: 18rem;">
  <div class="card-img-top" style="background-color:hotpink;height:150px;display: flex;justify-content: center;align-items: center;text-align:center;"><h2><%=totalBooking%></h2></div>
  <div class="card-body">
    <p class="card-text"><b>Total Cars Booked</b></p>
  </div>
</div>
</div>
<%
totalCars = 0;
petrolCars = 0;
dieselCars = 0;
currBooking=0;
totalBooking = 0;
%>
</body>
</html>