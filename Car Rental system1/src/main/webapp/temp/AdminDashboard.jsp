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
          <a class="nav-link active" aria-current="page" href="AdminDashboard.jsp?action=dashboard" id="Dashboard" onclick=change(event)>Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link"  href="AdminDashboard.jsp?action=addCar" >Add Car</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">All Cars</a>
        </li>
        <li class="nav-item">
          <a class="nav-link">Bookings</a>
        </li>
      </ul>
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
    %>

    <div>
    <h1>Dashboard</h1><hr>

    <!-- cards -->
    <div class="card" id="card" style="width: 18rem;">
      <div class="card-img-top" style={{height:"500px",background-color: #EBEBEB}} ></div>
      <div class="card-body">
        <h5 class="card-title">Cars Added</h5>
      </div>
    </div>
  </div>
 
    <%
	}
    	if(request.getParameter("action").equals("addCar"))
    	{
    		%>
    		<%@ include file="AddCar.html" %>  
    		<%
    	}
    	}catch(Exception e)
    {
    		System.out.println(e);
    }
    %>


</body>
</html>