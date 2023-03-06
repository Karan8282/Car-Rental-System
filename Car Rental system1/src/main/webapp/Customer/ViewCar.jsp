<%@ page import="java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime,com.car.DBConnection.Oracle" %>
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
	Statement st=null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbuser = "system";
	String dbpwd = "system";
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url,dbuser,dbpwd);
	st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT  * FROM CAR");
	
	int id = Integer.parseInt(request.getParameter("id"));

	
	while(rs.next())
	{
		if(rs.getInt(1) == id)
		{
			%>
				 <div class="container">
				 <div>
        <center>
        <div class="carousel mt-5" style="width: 70%;">
        <div id="carouselExampleFade" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner" >
            <%
            		for(int i=10;i<15;i++)
            		{
            			if(rs.getBinaryStream(i) != null)
            			{
            				String active = (i == 10)?"active" :"";
            				%>
            				  <div class="carousel-item <%=active%>">
            	                <img src="/Car_Rental_system1/Display?id=<%=rs.getInt(1)%>&img=<%=i%>" class="d-block w-50" alt="...">
            	              </div>
            	              <% 
            			}
            		}
            %>
              
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>
    </center>
    </div>

   <div style=" display: flex;flex-direction: row;">
        <div class="col-md-9">
    <div>
        <h1><%=rs.getString(2) %></h1>
    </div>

    <div class="mt-5" style=" display: flex;flex-direction: row;">
        
        <div class="mx-3" style="display: flex;flex-direction: column;width: 13%;height: 7em;outline: 2px solid black;">
            <center>
        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-calendar mt-1" viewBox="0 0 16 16">
            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
          </svg>
          <div>
            <b>Model Year</b>
          </div>
          <div>
            <%=rs.getString(6) %>
          </div>
        </center>
          </div>

          <div class="mx-3" style="display: flex;flex-direction: column;width: 13%;height: 7em;outline: 2px solid black;">  
            <center> 
          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-gear mt-1" viewBox="0 0 16 16">
            <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
            <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
          </svg>
          <div>
            <b>Fuel Type</b>
          </div>
          <div>
             <%=rs.getString(7) %>
          </div>
        </center>
          </div>
        
          <div class="mx-3" style="display: flex;flex-direction: column;width: 13%;height: 7em;outline: 2px solid black;">
        <center>
          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-plus mt-1" viewBox="0 0 16 16">
            <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
            <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
          </svg>
          <div>
            <b>Seats</b>
          </div>
          <div>
             <%=rs.getString(4) %>
          </div>
          </center>
          </div>
    </div>
</div>
<div style="display: flex;flex-direction: column">
	<form method="POST" action="Customer.jsp?action=checkout">
     <div name = "<%=rs.getString(8) %>">
     <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-cash" viewBox="0 0 16 16">
  <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
  <path d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z"/>
</svg>
     	<b><%=rs.getString(8) %></b> Rs/Day
     </div>
     
     
    <div>
    <div class="mt-2">
    <div>
    <b>Booking From</b>
    </div>
    <%
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
    LocalDateTime now = LocalDateTime.now();  
    String date = dtf.format(now).toString();
    System.out.println(date);
    %>
    <div>
    <input type="date" min="<%=date%>" name="bFrom" required/>
    </div>
    </div>
    <div class="my-2">
    <div>
    <b>Booking To</b>
    </div>
    <input type="date" min="<%=date%>" name="bTo" required/>
    </div>
    </div>
    <div>
    <div>
    <b>Message</b>
    </div>
    <div>
    <textarea rows="4" cols=30" name="msg" ></textarea>
    </div>
    </div>
    <%
    	Connection con1 = DriverManager.getConnection(url,dbuser,dbpwd);
   		Statement st1 = con1.createStatement();
		ResultSet rs1 = st1.executeQuery("SELECT  * FROM BOOKING");
    	
		boolean flag = false;
		while(rs1.next())
		{
			if(rs1.getInt(7) == Integer.parseInt(request.getParameter("id")) && rs1.getString(4).equals("Pending"))
			{
				
				flag = true;
				
			}
		}
		
		if(flag)
		{
			%><button type="button" class="btn btn-md btn-primary" disabled>Already Booked</button><% 
		}
		else
		{
			%>
			<input type="hidden" name="carID" value="<%=rs.getInt(1)%>"/>
    	<input type="submit" class="btn btn-md btn-primary"/><%
		}
    %>
    
    </form>
</div>

</div>
    </div>
			<% 
		}
	}
	%>
	
</body>
</html>