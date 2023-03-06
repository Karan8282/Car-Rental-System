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
       <h1>Checkout </h1> 
       <hr/>
       <form method="POST" action="Customer.jsp?action=ConfirmBooking">
       <%
       		if(request.getParameter("carID") != null)
       		{
       			Connection con;
       			Statement st=null;
       			PreparedStatement ps=null;
       			String driver = "oracle.jdbc.driver.OracleDriver";
       			String url = "jdbc:oracle:thin:@localhost:1521:xe";
       			String dbuser = "system";
       			String dbpwd = "system";
       			
       			int bookingID = 0;
       			
       			Class.forName("oracle.jdbc.driver.OracleDriver");
       			
       			con = DriverManager.getConnection(url,dbuser,dbpwd);
     
       			ps = con.prepareStatement("INSERT INTO BOOKING VALUES(BOOKSEQ.NEXTVAL,?,?,?,?,?,?,?,?)");
       			
       			st = con.createStatement();
       			ResultSet rs = st.executeQuery("SELECT  * FROM CAR");
       			int rent=0;
       			String carName =null;
       			while(rs.next())
	       			{
	       				if(rs.getInt(1) == Integer.parseInt(request.getParameter("carID")))
	       				{
	       						rent = rs.getInt(8);
	       						carName = rs.getString(2);
	       				}
	       			}
       			
       			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       			//Date bFrom=Date.valueOf(request.getParameter("bFrom"));
       			java.sql.Date bFrom = new java.sql.Date(sdf.parse(request.getParameter("bFrom")).getTime());
       			ps.setDate(1,bFrom);
       		//	Date bTo=Date.valueOf(request.getParameter("bTo"));
       			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
       			java.sql.Date bTo = new java.sql.Date(sdf1.parse(request.getParameter("bTo")).getTime());
       			
       			ps.setDate(2,bTo);
       			ps.setString(3,"Pending");
       			
       			long days = bTo.getTime() - bFrom.getTime();
       			long diffDays = (days / (24 * 60 * 60 * 1000))+1;
       		
       			ps.setInt(4,(int)diffDays);
       			ps.setInt(5,rent);
       			ps.setInt(6,Integer.parseInt(request.getParameter("carID")));
       			ps.setInt(7,(int)(session.getValue("id")));
       			ps.setString(8,request.getParameter("msg"));
       			
       			int result = ps.executeUpdate();
       			int totalRent = rent * (int)diffDays;
       			if(result == 1)
       			{
       				
       				ResultSet rs1 = st.executeQuery("SELECT  * FROM BOOKING");
       				
       				%>
       		<table class="table mt-3">
            <thead class="table-dark">
              <tr>
                <!-- <th scope="col">#</th> -->
                <th scope="col">Car Name</th>
                <th scope="col">Booking From</th>
                <th scope="col">Booking To</th>
                <th scope="col">Total Days</th>
                <th scope="col">Rent</th>
                
              </tr>
            </thead>
            <tbody>
       				
       			
              <tr>
                <th scope="row" name="carName"><%=carName%></th>
                <td><%=bFrom%></td>
                <td><%=bTo %></td>
                <td><%=diffDays %></td>
                <td><%=rent %></td>
              </tr>
        
       					 <tr>
                <th scope="row" colspan="4">Total Amount</th>
                <td><%=totalRent%></td>
              </tr>
            </tbody>
          </table>
          <input type="hidden" name="carID" value="<%= request.getParameter("carID") %>"/>
           <input type="hidden" name="totalRent" value="<%=totalRent%>"/>
       				 <input type="submit" class="btn btn-primary" value="rent now" />
       					<%
       			}
       		}
       %>
      </form>

         
      </div>
</body>
</html>