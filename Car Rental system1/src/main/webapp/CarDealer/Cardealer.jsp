<%@ page import="java.sql.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Rental System</title>

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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

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
          <a class="nav-link" aria-current="page" href="Cardealer.jsp?action=home" id="Dashboard" onclick=change(event)>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link"  href="Cardealer.jsp?action=addCar" >Add Car</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Cardealer.jsp?action=viewCar">View Car</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Cardealer.jsp?action=booking">Bookings</a>
        </li>
      </ul>
      <div class="dropdown">
    <button class="btn btn-dark dropdown-toggle mx-2" type="button" id="" data-bs-toggle="dropdown" aria-expanded="false">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle mx-1" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
</svg>
<%=session.getValue("firstName") %>   
    </button>
    <ul class="dropdown-menu" aria-labelledby="">
      <li  data-bs-toggle="modal" data-bs-target="#CustomerRegister">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
  <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
</svg>
 		     <a href="Cardealer.jsp?action=EditProfile" style="text-decoration: none;color:#0e0f0f">Edit Profile</a><hr>
 	</li>
      <li id="CarDealerRegister" data-bs-toggle="modal" data-bs-target="#CardealerRegister">
     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
</svg>
     	 <a href="Cardealer.jsp?action=Logout" style="text-decoration: none;color:#0e0f0f">Log Out</a>
     </li>
    </ul>
  </div>
    </div>
  </div>
  
</nav>
</div> 
<div class="container">
    
    <% 
    	try{
    	if(request.getParameter("action").equals("home"))
    	{
			System.out.println("session id = "+session.getValue("id"));
			%>
			<%@ include file="Home.jsp" %> 
		<% 
		}

    	if(request.getParameter("action").equals("addCar"))
		{
			%>
			<%@ include file="AddCar.jsp" %> 
			<%
		}
    	if(request.getParameter("action").equals("viewCar"))
		{
			%>
			<%@ include file="ViewCar.jsp" %> 
			<%
		}
    	if(request.getParameter("action").equals("booking"))
		{
			%>
			<%@ include file="Booking.jsp" %> 
			<%
		}
    	
		if(request.getParameter("action").equals("EditProfile"))
		{
			%>
			<%@ include file="EditProfile.jsp" %> 
			<%
		}
		if(request.getParameter("action").equals("Logout"))
		{
			session.removeAttribute("id");
			session.removeAttribute("firstName");
			session.removeAttribute("lastName");
			response.sendRedirect("http://localhost:4545/Car_Rental_system1/");
			
		}
    	}catch(Exception e)
    {
    		System.out.println(e);
    }
    %>


</body>
</html>