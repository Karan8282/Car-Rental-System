<%@ page import="java.sql.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function myFunction(val) {
	location.replace("http://localhost:4545/Car_Rental_system1/Customer/Customer.jsp?action=home&val="+val)
	}
</script>
</head>
<body>
	 <div class="container">
      <h1>Cars Available</h1>
      <hr>
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
		
		%>
      
      <div style="display: flex;flex-direction: row;">
      <div class="dropdown mx-2">
        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
          Fuel Type        </button>
        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
        
          <li><a class="dropdown-item active" href="Customer.jsp?action=home">None</a></li>
          <li><a class="dropdown-item" href="Customer.jsp?action=home&fuel=Petrol">Petrol</a></li>
          <li><a class="dropdown-item" href="Customer.jsp?action=home&fuel=Diesel">Diesel</a></li>
        </ul>
      </div>

      <div class="dropdown mx-2">
        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
          Model Year        </button>
        <ul class="dropdown-menu  dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
          <li><a class="dropdown-item active" href="Customer.jsp?action=home">None</a></li>
          <%
          ResultSet rs = st.executeQuery("SELECT  DISTINCT MODELYEAR FROM CAR ORDER BY MODELYEAR ASC");
          while(rs.next())
          {
        	  String q = "Customer.jsp?action=home&year="+rs.getInt(1);
        	  %>
        	  <li><a class="dropdown-item" href="<%=q%>"><%=rs.getInt(1) %></a></li>
        	  <% 
          }
          %>
        
        </ul>
      </div>
      
    </div>

      <br>
      <div style="flex-direction: row;display: flex;flex-wrap: wrap;">

		<% 
		
		if(request.getParameter("fuel") != null)
		{
		if(request.getParameter("fuel").equals("Petrol"))
		{
		ResultSet rs1 = st.executeQuery("SELECT  * FROM CAR WHERE FUELTYPE = 'Petrol'");
		
		while(rs1.next())
		{
      %>
        <div class="temp" style="flex-wrap: wrap;">
			<div class="mx-2 my-2">
				<div class="card" style="width: 500px;">
            <div class="row no-gutters">
                <div class="col-sm-5">
                    <img src = "/Car_Rental_system1/Display?id=<%=rs1.getInt(1)%>" class="card-img"  alt="...">
                </div>
                <div class="col-sm-7">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs1.getString(2)%></h5>
                        <a href="/Car_Rental_system1/Customer/Customer.jsp?action=view&id=<%=rs1.getInt(1)%>" class="btn btn-primary">View Car</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>


				<%
		}
		
		}
		
		if(request.getParameter("fuel").equals("Diesel"))
		{
		ResultSet rs2 = st.executeQuery("SELECT  * FROM CAR  WHERE FUELTYPE = 'Disel'");
		
		while(rs2.next())
		{
      %>
        <div class="temp" style="flex-wrap: wrap;">
			<div class="mx-2 my-2">
				<div class="card" style="width: 500px;">
            <div class="row no-gutters">
                <div class="col-sm-5">
                    <img src = "/Car_Rental_system1/Display?id=<%=rs2.getInt(1)%>" class="card-img"  alt="...">
                </div>
                <div class="col-sm-7">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs2.getString(2)%></h5>
                        <a href="/Car_Rental_system1/Customer/Customer.jsp?action=view&id=<%=rs2.getInt(1)%>" class="btn btn-primary">View Car</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>


				<%
		}
		
		}
		}
		else if(request.getParameter("year")!=null)
		{
			int val = Integer.parseInt(request.getParameter("year"));
			String query = "SELECT  * FROM CAR WHERE MODELYEAR = '%s'".formatted(val);
			ResultSet rs4 = st.executeQuery(query);
			while(rs4.next())
			{
	      %>
	        <div class="temp" style="flex-wrap: wrap;">
				<div class="mx-2 my-2">
					<div class="card" style="width: 500px;">
	            <div class="row no-gutters">
	                <div class="col-sm-5">
	                    <img src = "/Car_Rental_system1/Display?id=<%=rs4.getInt(1)%>" class="card-img"  alt="...">
	                </div>
	                <div class="col-sm-7">
	                    <div class="card-body">
	                        <h5 class="card-title"><%= rs4.getString(2)%></h5>
	                        <p>price : <%=rs4.getInt(8) %></p>
	                        <a href="/Car_Rental_system1/Customer/Customer.jsp?action=view&id=<%=rs4.getInt(1)%>" class="btn btn-primary">View Car</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	        </div>
	        </div>


					<%
			}
		}
		
		else
		{
			ResultSet rs3 = st.executeQuery("SELECT  * FROM CAR");
			
			while(rs3.next())
			{
	      %>
	        <div class="temp" style="flex-wrap: wrap;">
				<div class="mx-2 my-2">
					<div class="card" style="width: 500px;">
	            <div class="row no-gutters">
	                <div class="col-sm-5">
	                    <img src = "/Car_Rental_system1/Display?id=<%=rs3.getInt(1)%>" class="card-img"  alt="...">
	                </div>
	                <div class="col-sm-7">
	                    <div class="card-body">
	                        <h5 class="card-title"><%= rs3.getString(2)%></h5>
	                        <p>price : <%=rs3.getInt(8) %></p>
	                        <a href="/Car_Rental_system1/Customer/Customer.jsp?action=view&id=<%=rs3.getInt(1)%>" class="btn btn-primary">View Car</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	        </div>
	        </div>


					<%
			}
		}
		
		
		
		
			
	%>
	</div>
       </div>

</body>
</html>