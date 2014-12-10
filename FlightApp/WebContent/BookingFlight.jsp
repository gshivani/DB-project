<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, edu.neu.cs5200.Daos.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Flight</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
<style type="text/css">
BODY {
background-image: url('images/clouds.jpg'); 
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
<%
	
    int sizeOfArray = Integer.parseInt(request.getParameter("sizeOfArray"));
    String departureLocationArray[] = new String[sizeOfArray];
    String arrivalLocationArray[] = new String[sizeOfArray];
    String departureDateTimeArray[] = new String[sizeOfArray];
    String arrivalDateTimeArray[] = new String[sizeOfArray];
   // String airlineCodeArray[] = (String[])session.getAttribute("airlineCodeArray");
	Integer flightNumber[] =  new Integer[sizeOfArray];
	double amount = Double.parseDouble(request.getParameter("amount"));
	String airlineCode = request.getParameter("airlineCode");
	
%>
<%
for(int i=0;i<sizeOfArray;i++)
{
	
	departureLocationArray[i]=request.getParameter("departureLocation_"+i);
	arrivalLocationArray[i]=request.getParameter("arrivalLocation_"+i);
	departureDateTimeArray[i]=request.getParameter("departureDateTime_"+i);
	arrivalDateTimeArray[i]=request.getParameter("arrivalDateTime_"+i);
	flightNumber[i]= Integer.parseInt(request.getParameter("flightNumber_"+i));
	
	System.out.println("BookingFlight: DepartureArray: "+departureLocationArray[i]);
	System.out.println("BookingFlight: ArrivalArray: "+arrivalLocationArray[i]);
	System.out.println("BookingFlight: DepartureTimeArray:"+departureDateTimeArray[i]);
	System.out.println("BookingFlight: ArrivalArray: "+arrivalDateTimeArray[i]);
	System.out.println("BookingFlight: FlightNumberArray: "+flightNumber[i]);
}

session.setAttribute("departureLocationSession", departureLocationArray);
session.setAttribute("arrivalLocationSession", arrivalLocationArray);
session.setAttribute("departureDateTimeSession", departureDateTimeArray);
session.setAttribute("arrivalDateTimeSession", arrivalDateTimeArray);
session.setAttribute("flightNumberSession", flightNumber);

 //System.out.println(total_amount);

%>
<form action="EnterPassengerDetails.jsp" class="form-control" method="get" style="border: 0px solid #000000;background: transparent">
<tr>
<div class="row">
<div class="col-md-5">
<p style="color: black; font-weight: bold">You are Booking with: </p>
<td><input name="airlineCode" class="form-control" value="<%=airlineCode %>" style="border: 0px solid #000000;"  readonly="readonly"/></td>
<% for(int i=0; i<sizeOfArray; i++){
	
%>
<p>
<p style="color: black; font-weight: bold">Departure Location: </p>
<td><input name="departureLocation_<%=i %>" class="form-control" value="<%= departureLocationArray[i] %>" style="border: 0px solid #000000;" readonly="readonly"/></td>
</p>
<p>
<p style="color: black; font-weight: bold">Arrival Location: </p>
<td><input name="arrivalLocation_"<%=i %>" class="form-control" value="<%= arrivalLocationArray[i] %>" style="border: 0px solid #000000;"  readonly="readonly"/></td>
</p>
<p>
<p style="color: black; font-weight: bold">Departure Date and Time: </p>
<td><input name="departureDateTime_"<%=i %>" class="form-control" value="<%= departureDateTimeArray[i] %>" style="border: 0px solid #000000;"  readonly="readonly"/></td>
</p>
<p>
<p style="color: black; font-weight: bold">Arrival Date and Time: </p>
<td><input name="arrivalDateTime_<%=i %>" class="form-control" value="<%= arrivalDateTimeArray[i] %>" style="border: 0px solid #000000;"  readonly="readonly"/></td>
</p>
<p>
<p style="color: black; font-weight: bold">Flight Number: </p>
<td><input name="flightNumber_<%=i %>" class="form-control" value="<%= flightNumber[i] %>" style="border: 0px solid #000000;"  readonly="readonly"/> </td>
</p>

<%}
%>
<p style="color: black; font-weight: bold">The total Amount is: </p>
<td><input name="amount" class="form-control" value="<%= amount %>" style="border: 0px solid #000000;"  readonly="readonly"/></td>
<p style="color: black; font-weight: bold"> Enter The Number Of Passengers</p>
<p>
<td><select name="noOfPassengers" class = "form-control" >
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
</td>
</p>
<p style="color: black; font-weight: bold"> Select Class</p>
<p>
<td><select name="class" class = "form-control" >
<option value="First Class">First Class</option>
<option value="Business Class">Business Class</option>
<option value="Economy">Economy</option>
</p>
<p></p>
<p>
<input type="submit" value="Confirm Booking" class= "btn btn-success"/>
</p>
<p  style="color: black; font-weight: bold">Please Note: *Choosing First Class will increase your ticket price by $1000 and Business Class by $500</p> 
</tr>
</form>
</div>
</div>
</body>
<%} %>
</html>
