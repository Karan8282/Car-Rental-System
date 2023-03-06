<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
  function AdminLogin(){
    alert("clicked")

  }
</script>
</head>

<body>
	<!-- bootstrap links -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script> -->
  
    <!-- === -->

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
    	if(request.getParameter("register").equals("cardealer"))
    	{
    		%>
    		<script>alert("Car Dealer registered Successfully!!")</script>
    		<%
    	}
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
  <form action="LoginCustomer" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Label">Customer Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body container">
        <table>
          <tr>
          <td>Email-id</td><td><input type="text" name="email"></td>
          </tr>
          <tr>
            <td>Password</td><td><input type="password" name="pwd"></td>
            </tr>
      </table>
      </div>
      <div class="modal-footer">
        <input type="submit" value="Login">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Forget Password</button>
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
          <td>Email-id</td><td><input type="text" name="email"></td>
          </tr>
          <tr>
            <td>Password</td><td><input type="password" name="pwd"></td>
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
          <td>Email-id</td><td><input type="text" name="email"></td>
          </tr>
          <tr>
            <td>Password</td><td><input type="password" name="pwd"></td>
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
          <td>First Name</td><td><input type="text" name="firstName"></td>
          </tr>
          <tr>
          <td>Last Name</td><td><input type="text" name="lastName"></td>
          </tr>
          <tr>
          <td>Email-ID</td><td><input type="email" name="emailId"></td>
          </tr>
          <tr>
          <td>Password</td><td><input type="password" name="password"></td>
          </tr>
          <tr>
          <td>Confirm Password</td><td><input type="password" name="cfPassword"></td>
          </tr>
          <tr>
          <td>Mobile No</td><td><input type="tel" name="mobileNo"></td>
          </tr>
          <tr>
            <td>Adhar No</td><td><input type="number" name="adharNo"></td>
          </tr>
          <tr>
            <td>License No</td><td><input type="number" name="licenseNo"></td>
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
  <form action="RegisterCustomer" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Label">Car Dealer Register</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body container">
        <table>
          <tr>
          <td>First Name</td><td><input type="text" name="firstName"></td>
          </tr>
          <tr>
          <td>Last Name</td><td><input type="text" name="lastName"></td>
          </tr>
          <tr>
          <td>Email-ID</td><td><input type="email" name="emailId"></td>
          </tr>
          <tr>
          <td>Password</td><td><input type="password" name="password"></td>
          </tr>
          <tr>
          <td>Confirm Password</td><td><input type="password" name="cfPassword"></td>
          </tr>
          <tr>
          <td>Mobile No</td><td><input type="tel" name="mobileNo"></td>
          </tr>
          <tr>
            <td>Adhar No</td><td><input type="number" name="adharNo"></td>
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

<div>
<div class="container">
	<center>
	<h1 class="my-5">WELCOME TO <span style="color: darkorange;">CAR RENTAL SYSTEM</span></h1>
	<img src="Image/multiple-cars.png"/>
	<p class="col-md-5 mt-5">This Car Rental System is designed for a web services provider where the user can visit and book their required Car online and select their car, duration option etc. Also those people who want to give their car on rental basis, They can register themselve on CarDealer section</p>
	</center>
</div>

<div class="footer" style="background-color: midnightblue;">
<div style="color: white;">
<div class="mt-4 mx-4 py-3">
<h3>GET IN TOUCH</h3>
</div>
<div style="display: flex;gap: 10vw;" class="mx-4">
	<div style="display: flex;">
		<div class="mx-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
</svg>
		</div>
		<div>
		<b>ADDRESS</b>
		<p>12-abc, Akurdi, Pune</p>
		</div>
		</div>
		
		<div style="
    display: flex;
	">
		<div class="mx-2">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
</svg>
		</div>
		<div>
		<b>PHONE NUMBER</b>
		<p>1234567890</p>
		</div>
		</div>
		
		<div style="
    display: flex;
	">
		<div class="mx-2">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/>
</svg>
		</div>
		<div>
		<b>EMAIL</b>
		<p>help@CarRentalSystem.com</p>
		</div>
		</div>
	</div>
</div>
</div>

</div>


</div>

</body>
</html>