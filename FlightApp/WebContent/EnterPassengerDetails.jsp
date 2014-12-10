<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Passenger Details</title>
<link href="css/bootstrap.css" rel="stylesheet"/>

<style type="text/css">
BODY {
background-image: url('flight3.jpg'); 
background-size: 100%;
}
</style>


</head>

<% 
if ((session.getAttribute("userId") == null) || (session.getAttribute("userId") == "")) 
{ 
       response.sendRedirect("Logout.jsp");	
} else {
%>
<body>
<form action="DisplayPassengerDetails.jsp" class="form-control" method="post" style="border: 0px solid #000000;background: transparent" >
<tr>
<h1 style="color: black; font-weight: bold">Passenger Details</h1>
</tr>
<% int noOfPassengers = 0;
  noOfPassengers = Integer.parseInt(request.getParameter("noOfPassengers"));
  double amount = Double.parseDouble(request.getParameter("amount"));
  String airlineClass= request.getParameter("class");
  String airlineCode = request.getParameter("airlineCode");
 
  
  
%>
<div class="row">
<div class="col-md-4">
<input value="<%=noOfPassengers %>" name="noOfPassengers" type="hidden">
<%
for(int i=0;i<noOfPassengers;i++)
{ %>
    <tr>
    <p>
    <p style="color: black; font-weight: bold">Passenger First Name: </p>
	<td><input name="PassengerFirstName_<%=i %>" id="PassengerFirstName" class="form-control" type="text" value=""></td>
	
	</p>
	<p>
    <p style="color: black; font-weight: bold">Passenger Last Name: </p>
	<td><input name="PassengerLastName_<%=i %>" id="PassengerLastName" class="form-control" type="text" value=""></td>
	</p>
	<p>
	<p style="color: black; font-weight: bold">Passenger Age: </p>
	<td><input name="PassengerAge_<%=i %>" class="form-control" type="text" value=""></td>
	</p>
	<p>
	<p style="color: black; font-weight: bold">Passport Details: </p>
	<td><input name="PassportNumber_<%=i %>" class="form-control" type="text" value=""></td>
	</p>
	<p>
	<p style="color: black; font-weight: bold">Gender: </p>
	<p style="color: black; font-weight: bold">Male</p>
	<div class="row">
	<div class="col-md-2">
	<td><input name="PassengerGender_<%=i %>" class="form-control" type="radio" value="M"></td>
	<p style="color: black; font-weight: bold">Female: </p>
	<td><input name="PassengerGender_<%=i %>" class="form-control" type="radio" value="F"></td>
	</div>
	</div>
	</p>	
	</tr>
<%
} 
%>
<p>

<%



     double totalCost = 0.0;
     if(airlineClass.equals("First Class"))
     {
    	 amount+=1000.0;
     }else 
    	 {
    	 if (airlineClass.equals("Business Class"))
    	 {
    		 amount+=500.0;
    	 }
    	 else
    	 {
    		 amount+=0.0;
    	 }
    	 }   	

     totalCost = amount*noOfPassengers;
%>
<p style="color: black; font-weight: bold">Total Cost: <%= totalCost %></p>
<td><input name="totalCost" value="<%=totalCost %>" class="form-control" type="hidden" ></td>
<td><input name="airlineCode" class="form-control" type="hidden" value="<%=airlineCode %>"></td>
<td><input name="noOfPassengers" class="form-control" type="hidden" value="<%=noOfPassengers %>"></td>
<td><input name="airlineClass" class="form-control" type="hidden" value="<%=airlineClass %>"></td>
</p>
<td><input name="submit" class="form-control" type="submit" value="Confirm Booking" class= "btn btn-success" /></td>
</form>
</div>
</div>
</body>

<% } %>
</html>