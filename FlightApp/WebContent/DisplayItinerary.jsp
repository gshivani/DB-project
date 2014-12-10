<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, edu.neu.cs5200.Daos.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Itinerary</title>
<link href="css/bootstrap.css" rel="stylesheet"/>

<style type="text/css">
BODY {
background-image: url('images/flight2.jpg'); 
background-repeat: no-repeat; 
background-size: 100%;
}
</style>

</head>
<body>
<h1 style="color: black; font-weight: bold" align= "center">Itinerary</h1>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
int bookingId = Integer.parseInt(request.getParameter("bookingId"));
int itineraryId = 0;

%>
<form action="UserProfile.jsp" method="get">
<%
BookingDao dao = new BookingDao();

Booking bi = dao.findByBookingId(bookingId);
itineraryId = bi.getItineraryId();

DepartureLocationDao dl = new DepartureLocationDao();
ArrivalLocationDao al = new ArrivalLocationDao();
DepartureDateTimeDao ddt = new DepartureDateTimeDao();
ArrivalDateTimeDao adt = new ArrivalDateTimeDao();

List<DepartureLocation> departureLocation = dl.findByItineraryId(itineraryId);
List<ArrivalLocation> arrivalLocation = al.findByItineraryId(itineraryId);
List<DepartureDateTime> departuredt = ddt.findByItineraryId(itineraryId);
List<ArrivalDateTime> arrivaldt = adt.findByItineraryId(itineraryId);


int size = departureLocation.size();
%>
<p style="color: black; font-weight: bold" align = "center">
<td>Departure Location</td>
<input value="" style="border: 0px solid #000000;background: transparent" size="5" />
<td>Arrival Location</td>
<input value="" style="border: 0px solid #000000;background: transparent"  size="15"/>
<td>Departure Date and Time</td>
<input value="" style="border: 0px solid #000000;background: transparent"  size="4"/>
<td>Arrival Date and Time</td>
<input value="" style="border: 0px solid #000000;background: transparent"  size="3"/>
</p>

<form action="UserProfile.jsp">
<table align = "center"  cellspacing="50px">
<p></p>
<%	
for(int i=0;i<size;i++)
{
	%>
<tr>	
<td style ="color: black; font-weight: bold"><%= departureLocation.get(i).getDepartureLocation()%></td>	
<td><input value="" style="border: 0px solid #000000;background: transparent" size="20" /></td>
<td style ="color: black; font-weight: bold"><%= arrivalLocation.get(i).getArrivalLocation()%></td>	
<td><input value="" style="border: 0px solid #000000;background: transparent" size="1" /></td>
<td style ="color: black; font-weight: bold"><%= departuredt.get(i).getDateTime()%></td>
<td><input value="" style="border: 0px solid #000000;background: transparent" size="8" /></td>
<td style ="color: black; font-weight: bold"><%= arrivaldt.get(i).getDateTime()%></td>
</tr>
<% } %>

<td><input name="password" type="hidden" value="<%=password %>"/></td>
<td><input name="username" type="hidden" value="<%=username %>"/></td>
<p></p>
<td><input name="UserProfile" type="submit" value="Go Back to User Profile" class="btn btn-warning" ></td>

</table>
</form>
</body>
</html>