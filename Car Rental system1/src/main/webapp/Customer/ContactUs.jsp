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
<%
	if(Boolean.parseBoolean(request.getParameter("success")))
	{
		%>
		<div class="alert alert-success alert-dismissible fade show" role="alert">
      <strong>Query submitted.</strong> 
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
		<% 	
	}
%>
<div style="display: flex;height: 8em;flex-direction: column;align-items: center;justify-content: center;">
<h1>Contact Us</h1>
<b>We simplify your journey!</b>

</div>
<div style="display: flex;justify-content: space-evenly;">
	<div>
	<div>
	<div style="
    display: flex;
	">
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
	
	<form method="POST" action="ContactUsForm">
	<div  style="
    display: flex;
    flex-direction: column;
	">
		<input class="my-2" type="text" Placeholder="Full Name" name="Cname"/>
		<input class="my-2" type="email" Placeholder="Email" name="email"/>
		<textarea class="my-2" rows="8" cols="25" Placeholder="Message" name="message"></textarea>
		<input class="my-2" type="submit"/>
	</div>
	</form>
</div>
</div>
</body>
</html>