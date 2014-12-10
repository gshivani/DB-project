<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, edu.neu.cs5200.Daos.*, java.util.* , java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
</head>

<% 
if ((session.getAttribute("userId") == null) || (session.getAttribute("userId") == "")) 
{ 
       response.sendRedirect("Logout.jsp");	
} else {
%>

<body>
<form action="Payment.jsp" class="form-control" method="get" style="border: 0px solid #000000;background: transparent">
<%
String paymentType = request.getParameter("PaymentType");
double totalCost = Double.parseDouble(request.getParameter("totalAmount"));
String username = (String)session.getAttribute("userId");
String password = (String)session.getAttribute("password");
String airlineCode = (String)session.getAttribute("airlineCode");
String airlineClass = (String)session.getAttribute("airlineClass");
int noOfPassengers = Integer.parseInt(request.getParameter("noOfPassengers"));

String passengerFirstName[] = (String[])session.getAttribute("PassengerFirstName");
String passengerLastName[] = (String[])session.getAttribute("PassengerLastName");
String PassengerAge[] = (String[])session.getAttribute("PassengerAge");
String PassportNumber[] = (String[])session.getAttribute("PassportNumber");
String PassengerGender[] = (String[])session.getAttribute("PassengerGender");



String bookingDate = new SimpleDateFormat("MM-dd-yyyy").format(new Date());
String ffmstatus=null;

if (paymentType.equals ("ffm")) {
	
	 
	 FrequentFlierMilesDao daoFfm = new FrequentFlierMilesDao();
	 FrequentFlierMiles ffm2 = daoFfm.findByUsername(username);
	 int points = ffm2.getPoints();
	 int ffmId = ffm2.getFfmId();
	 
	 System.out.println(ffm2.getFfmId());
	 System.out.println(ffm2.getPoints());
	 System.out.println(ffm2.getUsername());
	 
	 if (points >= totalCost) {
		 
		 
		 
		 int totalCostInt = (int)totalCost;
		 
		 int result = points - totalCostInt;
		 	
		 System.out.println(result);
		 ffmstatus="redeemed";
		 FrequentFlierMiles ffm3 = daoFfm.updateFFM(ffmId, result);
		 
		 
		 	 
	 } else {
		 
		 out.println("Sorry, You don't have enough Frequent Flier Miles.");
		 %>
		 <br>
		 <br>
		 <%
		 out.println("Please choose payment type as 'Dollars'"); 
		 ffmstatus="not redeemed";
		 %>
		  <br>
		 <br>
		 <form action= 'Payment.jsp' class= 'form-control' method = 'get' style="border: 0px solid #000000;background: transparent">
<p>
	<td>Choose type of Payment: </td>
	<p></p>
	<td>Dollars</td>
	<div class="row">
	<div class="col-md-1">
	<td><input name="PaymentType" class="form-control" type="radio" value="Dollars"></td>
	</div>
</p>
<td><input name="totalAmount" class= "form-control" type="hidden" value="<%=totalCost %>"></td>
<td><input name="noOfPassengers" class= "form-control" type="hidden" value="<%=noOfPassengers %>"></td>
<input type ="submit" value="Payment" class= "btn btn-warning"/>
</form>


		 <%
	 }
} 

else {
		 %>
		 
		 <center>
		 <%
		 out.println("Payment of " + totalCost+" has been made.");
		 out.println("Booking :<booking Id> Confirmed.");
		 ffmstatus="not redeemed";
		 int pointToAdd = (int)totalCost/100;
		 
		 FrequentFlierMilesDao daoFfm = new FrequentFlierMilesDao();
		 FrequentFlierMiles ffm1 = daoFfm.findByUsername(username);
		 pointToAdd += ffm1.getPoints();
		 
		 FrequentFlierMiles ffm3 = daoFfm.updateFFM(ffm1.getFfmId(), pointToAdd);
		 System.out.println("New points after Payment"+ffm3.getPoints());
	 }


	 
%>

</form>
<form action="UserProfile.jsp" method="get">
<td><input name="password" type="hidden" value="<%=password %>" style="border: 0px solid #000000;"/></td>
<td><input name="username" type="hidden" value="<%=username %>" style="border: 0px solid #000000;"/></td>
<br>
<td><input type ="submit" value="Go Back To Profile Page" class=" btn btn-warning"/></td>
<a href="Logout.jsp">Logout</a>
</form>

<%

String departureLocation[] = (String[])session.getAttribute("departureLocationSession");
String arrivalLocation[] = (String[])session.getAttribute("arrivalLocationSession");
String departureDateTime[] = (String[])session.getAttribute("departureDateTimeSession");
String arrivalDateTime[] = (String[])session.getAttribute("arrivalDateTimeSession");
//String flightNumber[] = (String[])session.getAttribute("flightNumberSession");
int sizeOfArray = departureLocation.length;

ItineraryDao daoItinerary = new ItineraryDao();
Itinerary itinerary = new Itinerary(airlineCode,airlineClass);
Itinerary itinerary2 = daoItinerary.createItinerary(itinerary);

int itineraryId = itinerary2.getItineraryId();

for(int i=0; i<sizeOfArray; i++){
	
DepartureLocationDao dao = new DepartureLocationDao();
DepartureLocation d1 = new DepartureLocation(itineraryId, departureLocation[i]);
DepartureLocation d2 = dao.createDepartureLocation(d1);
}

for(int i=0; i<sizeOfArray; i++){
	
ArrivalLocationDao dao = new ArrivalLocationDao();
ArrivalLocation a1 = new ArrivalLocation(itineraryId, arrivalLocation[i]);
ArrivalLocation a2 = dao.createArrivalLocation(a1);
}

for(int i=0; i<sizeOfArray; i++){
	
DepartureDateTimeDao dao = new DepartureDateTimeDao();
DepartureDateTime dt1 = new DepartureDateTime(itineraryId, departureDateTime[i]);
DepartureDateTime dt2 = dao.createDepartureDateTime(dt1);
}

for(int i=0; i<sizeOfArray; i++){
	
ArrivalDateTimeDao dao = new ArrivalDateTimeDao();
ArrivalDateTime dt1 = new ArrivalDateTime(itineraryId, arrivalDateTime[i]);
ArrivalDateTime dt2 = dao.createArrivalDateTime(dt1);
}

BookingDao daoBook = new BookingDao();
Booking booking = new Booking(username, noOfPassengers, bookingDate, totalCost, ffmstatus, itineraryId,
		airlineCode, airlineClass);

Booking booking2 = daoBook.createBooking(booking);
int bookingId = booking2.getBookingId();

System.out.println(bookingId);
System.out.println(booking2.getAirLineCode());

for(int i=0; i<noOfPassengers; i++){
	
PassengerDao daoPassenger = new PassengerDao();
Passenger p1 = new Passenger(bookingId,passengerFirstName[i],passengerLastName[i],PassportNumber[i],
		PassengerGender[i],PassengerAge[i]);
Passenger p2 = daoPassenger.createPassenger(p1);
}




%>

</body>
<% }
%>
</html>