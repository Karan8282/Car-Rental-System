<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



</head>

<body>
    <div>
    <%
    	if(request.getParameter("register") != null )
    	{
    	if(request.getParameter("register").equals("customer"))
    	{
    		%>
    		<script>alert("Customer registered Successfully!!")</script>
    		<%
    	}
    	if(request.getParameter("register").equals("CarDealer"))
    	{
    		%>
    		<script>alert("Car Dealer registered Successfully!!")</script>
    		<%
    	}
    	if(request.getParameter("register").equals("passwordWrong"))
    	{
    		%>
    		<script>alert("Passwords are not matching")</script>
    		<%
    	}
    	
    	}
	if(request.getParameter("login")!=null)
	if(request.getParameter("login").equals("false"))
	{
		%>	
		<script>alert("INVALID CREDENTIALS")</script><%	
	}
    %>

    <!-- Navbar -->
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
          <a class="nav-link active" aria-current="page" href="/Car_Rental_system1/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="AboutUs.jsp">About Us</a>
        </li>
     
      </ul>
    </div>
  </div>
  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle mx-2" type="button" id="" data-bs-toggle="dropdown" aria-expanded="false">
   	  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
		  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
		  <path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
		  <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
		</svg>
      Login
    </button>
    <ul class="dropdown-menu" aria-labelledby="">
      <li id="CustomerLogin" data-bs-toggle="modal" data-bs-target="#CustomerLog">
      	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  			<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
		</svg>
      		Customer<hr>
      </li>
      <li id="CarLogin"  data-bs-toggle="modal" data-bs-target="#CarDealerLog">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  		<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  	   </svg>
	 	   Car Dealer<hr>
	 </li>
      <li id="AdminLogin"  data-bs-toggle="modal" data-bs-target="#AdminLog">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
		  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
		</svg>
      		Admin
      </li>
    </ul>
  </div>
  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle mx-2" type="button" id="" data-bs-toggle="dropdown" aria-expanded="false">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
		  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
		  <path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
		  <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
		</svg>
      Register
    </button>
    <ul class="dropdown-menu" aria-labelledby="">
      <li  data-bs-toggle="modal" data-bs-target="#CustomerRegister">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
		  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
		</svg>
 		     Customer<hr>
 	</li>
      <li id="CarDealerRegister" data-bs-toggle="modal" data-bs-target="#CardealerRegister">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
		  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
	</svg>
     	 Car Dealer
     </li>
    </ul>
  </div>
</nav>
</div>

  <!-- modal for customer login -->
<div class="modal fade" id="CustomerLog" tabindex="-1" aria-labelledby="Label" aria-hidden="true">
  <div class="modal-dialog">
  <form action="CustomerLogin" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Label">Customer Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body container">
        <table>
        <div>
          <tr>
          <td>Email-id</td><td style="padding:0 15px 0 15px;"><input type="text" name="email" required></td>
          </tr>
        </div>
          <tr>
            <td style="padding:7px 0 0 0;">Password</td><td style="padding:7px 15px 0 15px;"><input type="password" name="pwd" required></td>
            </tr>
      </table>
      </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="Login">
      </div>
    </div>
    </form>
  </div>
</div>

 <!-- modal for Car Dealer login -->
 <div class="modal fade" id="CarDealerLog" tabindex="-1" aria-labelledby="Label" aria-hidden="true">
  <div class="modal-dialog">
  <form action="CardealerLogin" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Label">Car Dealer Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body container">
        <table>
          <tr>
          <td>Email-id</td><td><input type="text" name="email" required></td>
          </tr>
          <tr>
            <td>Password</td><td><input type="password" name="pwd" required></td>
            </tr>
      </table>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Login</button>
        
      </div>
    </div>
    </form>
  </div>
</div>

 <!-- modal for Admin login -->
 <div class="modal fade" id="AdminLog" tabindex="-1" aria-labelledby="Label" aria-hidden="true">
  <div class="modal-dialog">
  <form action="AdminLogin" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Label">Admin Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body container">
        <table>
          <tr>
          <td>Email-id</td><td><input type="text" name="email" id="email" required></td>
          </tr>
          <tr>
            <td>Password</td><td><input type="password" name="pwd" id="pwd" required></td>
            </tr>
      </table>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Login</button>
      </div>
    </div>
    </form>
  </div>
</div>

  <!-- modal for customer Registration -->
<div class="modal fade" id="CustomerRegister" tabindex="-1" aria-labelledby="Label" aria-hidden="true">
  <div class="modal-dialog">
  <form action="RegisterCustomer" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Label">Customer Register</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body container">
        <table>
          <tr>
          <td>First Name</td><td><input type="text" name="firstName" required></td>
          </tr>
          <tr>
          <td>Last Name</td><td><input type="text" name="lastName" required></td>
          </tr>
          <tr>
          <td>Email-ID</td><td><input type="email" name="emailId" required></td>
          </tr>
          <tr>
          <td>Password</td><td><input type="password" name="password" required></td>
          </tr>
          <tr>
          <td>Confirm Password</td><td><input type="password" name="cfPassword" required></td>
          </tr>
          <tr>
          <td>Mobile No</td><td><input type="tel" name="mobileNo" pattern="[0-9]{10}" required></td>
          </tr>
          <tr>
            <td>Adhar No</td><td><input type="tel" name="adharNo" pattern="[0-9]{12}" required></td>
          </tr>
          <tr>
            <td>License No</td><td><input type="number" name="licenseNo" required></td>
          </tr>
      </table>
      </div>
      <div class="modal-footer">
        <input type="submit"  value="Register">
        <input type="hidden" name="register" value ="registerCustomer">
      </div>
    </div>
    </form>
  </div>
</div>

  <!-- modal for car Dealer Registration -->
<div class="modal fade" id="CardealerRegister" tabindex="-1" aria-labelledby="Label" aria-hidden="true">
  <div class="modal-dialog">
  <form action="RegisterCarDealer" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Label">Car Dealer Register</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body container">
        <table>
          <tr>
          <td>First Name</td><td><input type="text" name="firstName" required></td>
          </tr>
          <tr>
          <td>Last Name</td><td><input type="text" name="lastName" required></td>
          </tr>
          <tr>
          <td>Email-ID</td><td><input type="email" name="emailId" required></td>
          </tr>
          <tr>
          <td>Password</td><td><input type="password" name="password" required></td>
          </tr>
          <tr>
          <td>Confirm Password</td><td><input type="password" name="cfPassword" required></td>
          </tr>
          <tr>
          <td>Mobile No</td><td><input type="tel" name="mobileNo" pattern="[0-9]{10}" required></td>
          </tr>
          <tr>
            <td>Adhar No</td><td><input type="tel" name="adharNo" required></td>
          </tr>
      </table>
      </div>
      <div class="modal-footer">
        <input type="submit"  value="Register">
        <input type="hidden" name="register" value ="registerCardealer">
      </div>
    </div>
    </form>
  </div>
</div>

	<!-- carousel -->
	
	<div id="carouselExampleIndicators" class="carousel slide w-70" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="Images/dash1.jpg" class="d-block w-100"  alt="..." height="670vh" >
    </div>
    <div class="carousel-item">
      <img src="Images/dash2.jpg" class="d-block w-100" alt="..." height="670vh" >
    </div>
    <div class="carousel-item">
      <img src="Images/dash3.jpg" class="d-block w-100" alt="..." height="670vh">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>



  
</div>

</body>
</html>