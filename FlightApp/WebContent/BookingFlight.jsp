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
<form action="EnterPassengerDetails.jsp" class="form-control" method="get">
<tr>
<td>You are Booking with: </td>
<td><input name="airlineCode" class="form-control" value="<%=airlineCode %>" /></td>
<% for(int i=0; i<sizeOfArray; i++){
	
%>
<p>
<td>Departure Location: </td>
<td><input name="departureLocation_<%=i %>" class="form-control" value="<%= departureLocationArray[i] %>" /></td>
</p>
<p>
<td>Arrival Location: </td>
<td><input name="arrivalLocation_"<%=i %>" class="form-control" value="<%= arrivalLocationArray[i] %>" /></td>
</p>
<p>
<td>Departure Date and Time: </td>
<td><input name="departureDateTime_"<%=i %>" class="form-control" value="<%= departureDateTimeArray[i] %>" /></td>
</p>
<p>
<td>Arrival Date and Time: </td>
<td><input name="arrivalDateTime_<%=i %>" class="form-control" value="<%= arrivalDateTimeArray[i] %>" /></td>
</p>
<p>
<td>Flight Number: </td>
<td><input name="flightNumber_<%=i %>" class="form-control" value="<%= flightNumber[i] %>" /> </td>
</p>

<%}
%>
<td>The total Amount is: </td>
<td><input name="amount" class="form-control" value="<%= amount %>"/></td>
<p> Enter The Number Of Passengers
<td><select name="noOfPassengers" class = "form-control" >
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
</td>
</p>
<p> Select Class
<td><select name="class" class = "form-control" >
<option value="First Class">First Class</option>
<option value="Business Class">Business Class</option>
<option value="Economy">Economy</option>
</p>
<p>
<input type="submit" value="Confirm Booking"/>
</p>
</tr>
</form>
</body>
<%} %>
</html>
