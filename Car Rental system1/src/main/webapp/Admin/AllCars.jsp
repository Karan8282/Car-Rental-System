<%@ page import="java.sql.*,java.io.*,com.car.formSubmission.FetchCars,java.util.*,com.car.beans.Car"%>
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
		<h1>Cars Available</h1>
		<hr>
		<div style="display: flex; flex-direction: row;">
		

			

		</div>

		<br>
		<div style="flex-direction: row; display: flex; flex-wrap: wrap;">
		<%
			List<Car> l = FetchCars.fetch();
			for(Car c :l) {
			%>
			<div class="temp" style="flex-wrap: wrap;">
				<div class="mx-2 my-2">
					<div class="card" style="width: 500px;">
						<div class="row no-gutters">
							<div class="col-sm-5">
								<img src="/Car_Rental_system1/Display?id=<%=c.getCarId()%>"
									class="card-img" alt="...">
							</div>
							<div class="col-sm-7">
								<div class="card-body">
									<h5 class="card-title"><%=c.getCarName()%></h5>
									<p>
										price :
										<%=c.getCarRent()%></p>
							<a
									href="/Car_Rental_system1/Admin/RemoveCar.jsp?id=<%=c.getCarId()%>"
									class="btn btn-danger">Remove Car</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<%
			}
			
			%>
		</div>
	</div>

</body>
</html>