<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
</head>

<% 
if ((session.getAttribute("userId") == null) || (session.getAttribute("userId") == "")) 
{ 
       response.sendRedirect("Logout.jsp");	
} else {
%>
<body>
<form action="DisplayPassengerDetails.jsp" class="form-control" method="post" >
<tr>
<h1>Passenger Details</h1>
</tr>
<% int noOfPassengers = 0;
  noOfPassengers = Integer.parseInt(request.getParameter("noOfPassengers"));
  double amount = Double.parseDouble(request.getParameter("amount"));
  String airlineClass= request.getParameter("class");
  String airlineCode = request.getParameter("airlineCode");
 
  
  
%>
<input value="<%=noOfPassengers %>" name="noOfPassengers" type="hidden">
<%
for(int i=0;i<noOfPassengers;i++)
{ %>
    <tr>
    <p>
    <td>Passenger First Name: </td>
	<td><input name="PassengerFirstName_<%=i %>" id="PassengerFirstName" class="form-control" type="text" value=""></td>
	
	</p>
	<p>
    <td>Passenger Last Name: </td>
	<td><input name="PassengerLastName_<%=i %>" id="PassengerLastName" class="form-control" type="text" value=""></td>
	</p>
	<p>
	<td>Passenger Age: </td>
	<td><input name="PassengerAge_<%=i %>" class="form-control" type="text" value=""></td>
	</p>
	<p>
	<td>Passport Details: </td>
	<td><input name="PassportNumber_<%=i %>" class="form-control" type="text" value=""></td>
	</p>
	<p>
	<td>Gender: </td>
	<td>Male</td>
	<td><input name="PassengerGender_<%=i %>" class="form-control" type="radio" value="M"></td>
	<td>Female: </td>
	<td><input name="PassengerGender_<%=i %>" class="form-control" type="radio" value="F"></td>
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
<td>Total Cost: <%= totalCost %></td>
<td><input name="totalCost" value="<%=totalCost %>" class="form-control" type="hidden" ></td>
<td><input name="airlineCode" class="form-control" type="hidden" value="<%=airlineCode %>"></td>
<td><input name="noOfPassengers" class="form-control" type="hidden" value="<%=noOfPassengers %>"></td>
<td><input name="airlineClass" class="form-control" type="hidden" value="<%=airlineClass %>"></td>
</p>
<td><input name="submit" class="form-control" type="submit" value="Confirm Booking"></td>
</form>
</body>

<% } %>
</html>