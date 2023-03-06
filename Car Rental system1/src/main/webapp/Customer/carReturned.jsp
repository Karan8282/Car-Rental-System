<%@ page import="java.sql.*,java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
        <div class="col-md-12">
            
                
            <div style="background-color:#e9ecef ;display: flex;flex-direction: row;justify-content: center;height: 10em;align-items: center;">
                <div class="mx-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-check-circle text-success" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                  </svg>
                </div>
                <div>
                <h1 class="text-success">Car returned</h1>
            </div>
            </div>
            
            

<%
Connection con;
PreparedStatement ps=null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbuser = "system";
String dbpwd = "system";

String carNo = null;
String carName = null;
int bid=0;
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con1 =  DriverManager.getConnection(url,dbuser,dbpwd);
Statement st1 = con1.createStatement();

ResultSet rs1 = st1.executeQuery("SELECT * FROM CAR");
int carID = 0;
String carName1 = request.getParameter("car");
while(rs1.next())
{
	String name1 = rs1.getString(2);
	if(name1.replaceAll("\\s+","").equalsIgnoreCase(carName1.replaceAll("\\s+","")))
	{
		carID = rs1.getInt(1);
		carNo = rs1.getString(3);
		carName = rs1.getString(2);
		System.out.println("CARID="+carID);
		
	}
}

Connection con2 =  DriverManager.getConnection(url,dbuser,dbpwd);
Statement st2 = con2.createStatement();
ResultSet rs2 = st2.executeQuery("SELECT * FROM BOOKING WHERE STATUS = 'Pending'");

int totalDays = 0;
int rent = 0;
while(rs2.next())
{
	if(carID == rs2.getInt(7))
	{
		java.util.Date d1 = rs2.getDate(3);
		java.util.Date d2 = new java.util.Date();
		 SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");  
		  String strDate= formatter.format(d2);  
		  java.util.Date d3=new SimpleDateFormat("dd/MM/yy").parse(strDate); 
		  
		  long days = d3.getTime() - d1.getTime();
 		 long diffDays = (days / (24 * 60 * 60 * 1000));
		System.out.println("diff==="+diffDays);
		if(diffDays > 0)
		{
		totalDays = rs2.getInt(5) + (int)diffDays;
		rent = rs2.getInt(6)+((int)diffDays *500);
		}
		else
		{
			totalDays = rs2.getInt(5);
			rent = rs2.getInt(6);
		}
		bid= rs2.getInt(1);
		   %>
		   <div class="mt-4" style="display: flex;flex-direction: column;align-items: center;">
                <h3>Thank you for using Car Rental System! We wish you have a safe ride.</h3>
                <b>Your Order Number :<%=bid %></b>

                <small>Please read the following information about your order.</small>
                <button class="btn btn-secondary my-2" onclick="window.print()">Print</button>
            </div>

            <div style="background-color:#e9ecef ;display: flex;flex-direction: column;height: 30em;border: 1px solid black;">

                <div style="display: flex;flex-direction: column;align-items: center;margin-top: 2%;">
                <h4 style="color: gold;">Your booking has been received and placed into out order processing system</h4>

                <p>Please make a note of your <b>order number</b> now and keep in the event you need to communicate with us about your order</p>

                <h5 style="color: gold;">Invoice</h5>
                </div>
           <div style="align-items: flex-start;margin-left: 5%;margin-top: 2%;">
           <p><b>Vehicle Name : </b><%=carName %></p>
           <p><b>Vehicle Number : </b><%=carNo %></p>
           <p><b>Start Date : </b><%=rs2.getDate(2)%></p>
           <p><b>Expected return date : </b><%=rs2.getDate(3) %></p>
           <p><b>Actual return date : </b><%= new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%></p>
           <p><b>Total days : </b><%=totalDays %></p>
           <p><b>Rent : </b><%=rent%></p>
       </div>
     <%
	}
}


con = DriverManager.getConnection(url,dbuser,dbpwd);
	//ResultSet rs = st.executeQuery("SELECT  CAR.CARNAME, CAR.CARNUMBER, BOOKING.B_FROM,BOOKING.B_TO,BOOKING.TOTALDAYS,BOOKING.RENT FROM BOOKING INNER JOIN CAR ON BOOKING.CARID = CAR.CARID");
//ps = con.prepareStatement("DELETE FROM BOOKING WHERE CARID = ?");
ps = con.prepareStatement("UPDATE BOOKING SET STATUS = 'Success' , TOTALDAYS = ? , RENT = ? WHERE BOOKINGID = ?");

ps.setInt(1,totalDays);
ps.setInt(2,rent);
ps.setInt(3,Integer.parseInt(request.getParameter("id")));
ps.executeUpdate();

%>
 
            </div>

        </div>

       </div>
</body>
</html>