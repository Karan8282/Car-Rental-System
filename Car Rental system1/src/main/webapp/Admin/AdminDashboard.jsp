<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
  var id="Dashboard";
  
  const change=(event)=>{
	id = event.target.id;
    console.log("inside",event.target.id);
    window.location.replace("AdminDashboard.jsp?action="+id);
  }

  
  $( '.navbar-nav a' ).on( 'click', function () {
		$( '.navbar-nav' ).find( 'li.active' ).removeClass( 'active' );
		$( this ).parent( 'li' ).addClass( 'active' );
	});
 
</script>
</head>
<body>

  <!-- navbar -->
  <div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Car Rental System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="AdminDashboard.jsp?action=dashboard" id="Dashboard" onclick=change(event)>Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link"  href="AdminDashboard.jsp?action=addCar" >Add Car</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="AdminDashboard.jsp?action=allCars">All Cars</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="AdminDashboard.jsp?action=booking">Bookings</a>
        </li>
      </ul>
      <div class="dropdown">
    <button onClick="fun()" class="btn btn-dark dropdown-toggle mx-2" type="button" id="" data-bs-toggle="dropdown" aria-expanded="false">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
</svg>
      
    </button>
    <ul class="dropdown-menu" aria-labelledby="">
     
      <li id="CarDealerRegister" data-bs-toggle="modal" data-bs-target="#CardealerRegister">
     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
</svg>
     	<a href="AdminDashboard.jsp?action=Logout" style="text-decoration: none;color:#0e0f0f">Log Out</a>
     </li>
    </ul>
  </div>
    </div>
  </div>
  
</nav>
</div> 
<div class="container">


<!-- <div class="container-fluid">
      <div class="row flex-nowrap">
          <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
              <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                  <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="AdminDashboard.jsp?action=dashboard" id="Dashboard" onclick=change(event)>Dashboard</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link"  href="AdminDashboard.jsp?action=addCar" onclick=change(event) >Add Car</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Cars</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link">Bookings</a>
                    </li>
                    
                  </ul>
                  <hr>
               
              </div>
          </div>
          </div>
          </div> -->
    
    <% 
    	try{
    	if(request.getParameter("action").equals("dashboard"))
    	{	
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
    		int totalCars = 0;
    		int petrolCars = 0;
    		int dieselCars = 0;
    		int currBooking=0;
    		int totalBooking=0;
    		while(rs.next())
    		{
    			System.out.println(rs.getString(7));
    			totalCars++;
    			if(rs.getString(7).equals("Petrol"))
    				petrolCars++;
    			if(rs.getString(7).equals("Disel"))
    				dieselCars++;
    		}
    		
    		Connection con1 = DriverManager.getConnection(url,dbuser,dbpwd);
    		Statement st1 = con1.createStatement();
    		ResultSet rs1 = st1.executeQuery("SELECT  * FROM BOOKING");
    		
    		while(rs1.next())
    		{
    			if(rs1.getString(4).equals("Pending"))
    			{
    				currBooking++;
    			}
    			totalBooking++;
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
	}
    	if(request.getParameter("action").equals("addCar"))
    	{
    		%>
    		<%@ include file="AddCar.jsp" %>  
    		<%
    	}
    	
    	if(request.getParameter("action").equals("allCars"))
    	{
    		%>
    		<%@ include file="AllCars.jsp" %>  
    		<%
    	}
    	if(request.getParameter("action").equals("booking"))
    	{
    		%>
    		<%@ include file="Booking.jsp" %>  
    		<%
    	}
    	if(request.getParameter("action").equals("Logout"))
    	{
    		session.removeAttribute("id");
			response.sendRedirect("http://localhost:4545/Car_Rental_system1/");
			
    	}
    	}catch(Exception e)
    {
    		System.out.println(e);
    }
    %>


</body>
</html>