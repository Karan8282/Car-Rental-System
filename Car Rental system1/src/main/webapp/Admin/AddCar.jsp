<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
    
    <script>
        var id = "Dashboard";

        const change = (event) => {
            id = event.target.id;
            console.log("inside", event.target.id);
            window.location.replace("AdminDashboard.jsp?action=" + id);
        }

    </script>
</head>

<body>
    <form action="/Car_Rental_system1/FileUpload" method="POST" ENCTYPE="multipart/form-data">
    <div>
            <div class="container">
                
                    <div>
                        <h1 class="mt-3">Add Car</h1>
                        <hr style="border: 2px;">
                    </div>
                    <div style="display: table;width: 100%;">
                    <div class="col-md-8" style="display: table-cell;width: 50%;">
                    <div style="flex-direction:column;">
                        <div class="col-md-4">
                            <label for="CarName"><b>Car Name</b></label>
                            <input type="text" class="form-control my-2" id="CarName" name="CarName" placeholder="Car Name" required>
                        </div>
                        <div class="col-md-4">
                            <label for="CarNumber"><b>Car Number</b></label>
                            <input type="text" class="form-control my-2" id="CarNumber" name="CarNumber"
                                placeholder="Car License Plate No" required>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="NoOfSeats"><b>Number Of Seats</b></label>
                        <input type="text" class="form-control my-2" id="NoOfSeats" name="NoOfSeats" placeholder="eg: 2,4" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="CarColor"><b>Car Color</b></label>
                        <input type="text" class="form-control my-2" id="CarColor" name="CarColor" placeholder="Color of the car" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="ModelYear"><b>Model Year</b></label>
                            <input type="text" class="form-control my-2" id="ModelYear" name="ModelYear" placeholder="eg: 2015,2011" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="FuelType"><b>Fuel Type</b></label>
                            <select id="FuelType" class="form-control my-2" name="FuelType">
                                <option selected>Choose...</option>
                                <option>Petrol</option>
                                <option>Disel</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4 my-2">
                            <label for="CarDocuments"><b>Car Documents</b></label>
                            <input type="file" class="form-control my-2" id="CarDocuments"  name="CarDocuments" required>
                        </div>
                    </div>
                    <div class="form-group col-md-4 my-2">
                        <label for="CarRent"><b>Car rent</b></label>
                        <input type="text" class="form-control my-2" id="CarRent" name="CarRent" required>
                    </div>

              
                    <input type="submit" class="btn btn-primary my-2" value="Add Car">
                    <input type="hidden" name="addCar" value="addCar"/>
                    <input type="hidden" name="user" value="admin"/>

                </div>
                
           

                
        <div class="col-md-5" style="display: table-cell;">
            <h3>Upload Car Images</h3>
            <br>
            <div class="form-group col-md-6 my-2">
                <label for="Image1"><b>Image 1</b></label>
                <input type="file" class="form-control my-2" id="Image1" name="Image1" required>
            </div>
            <div class="form-group col-md-6 my-2">
                <label for="Image2"><b>Image 2</b></label>
                <input type="file" class="form-control my-2" id="Image2" name="Image2" required>
            </div>
            <div class="form-group col-md-6 my-2">
                <label for="Image3"><b>Image 3</b></label>
                <input type="file" class="form-control my-2" id="Image3" name="Image3" required>
            </div>
            <div class="form-group col-md-6 my-2">
                <label for="Image4"><b>Image 4</b></label>
                <input type="file" class="form-control my-2" id="Image4" name="Image4" required>
            </div>
            <div class="form-group col-md-6 my-2">
                <label for="Image5"><b>Image 5</b></label>
                <input type="file" class="form-control my-2" id="Image5" name="Image5" required>
            </div>
        </div>
        </div>

            </div>
    </div>
</form>
<%
	if(Boolean.parseBoolean(request.getParameter("success")))
	{
		%>
		<script>alert("Car addded successfully!!!")</script>
		<%
	}
%>

      
      


</body>

</html>