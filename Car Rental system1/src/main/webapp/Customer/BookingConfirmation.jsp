<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
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
                <h1 class="text-success">Booking confirmed</h1>
            </div>
            </div>
            
          
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
            	ResultSet rs = st.executeQuery("SELECT  * FROM BOOKING");
            	
            	String carNo = null;
    			String carName = null;
    			int bid = 0;
    			java.sql.Date bdate = null;
            	while(rs.next())
            	{
            		if(Integer.parseInt(request.getParameter("carID")) == rs.getInt(7) && rs.getString(4).equals("Pending"))
            		{
            			
            			Connection con1 = DriverManager.getConnection(url,dbuser,dbpwd);
                    	Statement st1 = con.createStatement();
            			ResultSet rs1 = st1.executeQuery("SELECT  * FROM CAR");
            			while(rs1.next())
            			{
            				if(Integer.parseInt(request.getParameter("carID")) == rs1.getInt(1))
            					{
            					carNo = rs1.getString(3);
            					carName = rs1.getString(2);
            					bid = rs.getInt(1);
            					}
            			}
            			Connection con2 = DriverManager.getConnection(url,dbuser,dbpwd);
                    	PreparedStatement st2 = con.prepareStatement("UPDATE BOOKING  SET STATUS = 'Complete' WHERE CARID =?");
                    	st2.setInt(1,(Integer.parseInt(request.getParameter("carID"))));
            		//	st2.execute();
				
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
                <p><b>Rent : </b><%=request.getParameter("totalRent") %></p>
                <p><b>booking Date : </b><%= new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%></p>
                <p><b>Start Date : </b><%=rs.getDate(2)%></p>
                <p><b>Return Date : </b><%=rs.getDate(3) %></p>
            </div>
          <%
            		}
            	}
          %>  
            </div>

        </div>

       </div>
</body>
</html>