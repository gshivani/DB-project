<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<% 
if ((session.getAttribute("userId") == null) || (session.getAttribute("userId") == "")) 
{ 
       response.sendRedirect("Logout.jsp");	
} else {
%>
<body>

<% 
	String origin = request.getParameter("origin");
	String destination = request.getParameter("destination");
	String departureDate = request.getParameter("depatureDate");
	String arrivalDate = request.getParameter("arrivalDate");
	List<DisplayFlight> arr = new ArrayList<DisplayFlight>();
	
	
	if(origin != null)
	{
		FlightWebServiceClient client = new FlightWebServiceClient();
		arr = client.parseJSON(origin,destination,departureDate,arrivalDate);
	}
%>

<table class="table">
<tr>
<th>Flights </th>
</tr>
<tr>


</tr>
<% 
for(DisplayFlight array : arr){
	List<String> departureCode = array.getDepartureLocationCode();
	List<String> arrivalCode = array.getArrivalLocationCode();
	List<String> departureDateTime = array.getDepartureDateTime();
	List<String> arrivalDateTime = array.getArrivalDateTime();
	List<Integer> flightNumber = array.getFlightNumber();
	List<String> airlineCode = array.getAirlineCode();
	Double amount = array.getAmount();
%>

<form action="BookingFlight.jsp" method="get">
<tr>

<% String departureLocationArray[] = new String[departureCode.size()];
String arrivalLocationArray[] = new String[arrivalCode.size()];
String departureDateTimeArray[] = new String[departureDateTime.size()];
String arrivalDateTimeArray[] = new String[arrivalDateTime.size()];
String airlineCodeArray[] = new String[airlineCode.size()];%>

<% for(int i=0;i<departureCode.size();i++){ %>
<td>Departure Location</td> 
<td><input name="departureLocation_<%=i %>" class="form-control" value="<%=departureCode.get(i)%>"/></td>
<%departureLocationArray[i]=departureCode.get(i);%>
<td>Arrival Location</td>
<td><input name="arrivalLocation_<%=i %>" class="form-control" value="<%=arrivalCode.get(i) %>"/></td>
<%arrivalLocationArray[i]=arrivalCode.get(i);%>
<td>Departure Date and Time</td>
<td><input name="departureDateTime_<%=i %>" class="form-control" value="<%=departureDateTime.get(i) %>"/></td>
<%departureDateTimeArray[i]=departureDateTime.get(i);%>
<td>Arrival Date and Time</td>
<td><input name="arrivalDateTime_<%=i %>" class="form-control" value="<%=arrivalDateTime.get(i) %>"/></td>
<%arrivalDateTimeArray[i]=arrivalDateTime.get(i);%>
<td>Flight Number</td>
<td><input name="flightNumber_<%=i %>" class="form-control" value="<%=flightNumber.get(i) %>"/></td>
<td>Airline Code</td>
<td><input name="airlineCode" class="form-control" value="<%=airlineCode.get(i) %>"/></td>
<%airlineCodeArray[i]=airlineCode.get(i);%>


<%System.out.println("DepartureLocationArray"+departureLocationArray.length);
for(int j=0;j<departureLocationArray.length;j++){
System.out.println("Inside Array: "+departureLocationArray[j]);
System.out.println("Inside Arrival Code: "+arrivalLocationArray[j]);
System.out.println("Inside DepartureDateTime Code: "+departureDateTimeArray[j]);
System.out.println("Inside ArrivalDateTime Code: "+arrivalDateTimeArray[j]);
System.out.println("Inside Airline Code: "+airlineCodeArray[j]);

/*
session.setAttribute("departureLocationArray",departureLocationArray);
session.setAttribute("arrivalLocationArray",arrivalLocationArray);
session.setAttribute("departureDateTimeArray",departureDateTimeArray);
session.setAttribute("arrivalDateTimeArray",arrivalDateTimeArray);
session.setAttribute("airlineCodeArray",airlineCodeArray);
*/
}
%>



<%} %>
<td>Amount</td>
<td><input name="amount" class="form-control" value="<%= amount %>"/></td>
<td><input name="sizeOfArray" class="form-control" value="<%=departureLocationArray.length  %>" type="hidden"/></td>
<td> <input type ="submit" value="Book Flight"/>
</td>


</tr>
</form>
<%} %>
</tr>
</table>


</body>
<%} %>
</html>