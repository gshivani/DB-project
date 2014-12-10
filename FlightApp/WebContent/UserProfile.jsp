<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
<link href="css/flight.css" rel="stylesheet"/>

<style type="text/css">
BODY {
background-image: url('flights.png'); 
background-size: 100%;
}



</style>
</head>
<a href='Logout.jsp'>Logout</a>
<body>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String firstName="";
String lastName="";
String dob="";
String status="";
String email="";
int frequentfliermiles=0;
int points=0;
int bookingIdArray[] = null;
int itineraryIdArray[] = null;

if (username!= null)
{
   UserDao dao = new UserDao();
   User u = dao.findByUsername(username,password);
   //System.out.println(u.getFirstname());
  
  if (u== null)
   {
	  response.sendRedirect("Createuser.jsp");
   }
	  
  else{
	  
	  if(! u.getPassword().equals(password) || u.getUsername()==null)
		{
		   
		   response.sendRedirect("IncorrectPassword.jsp");
		   
		}
		else
		{
			firstName=u.getFirstname();
			lastName=u.getLastname();
			dob=u.getDob();
			status=u.getStatus();
			email=u.getEmail();
			
			FrequentFlierMilesDao daoFfm = new FrequentFlierMilesDao();
			FrequentFlierMiles ffm =  daoFfm.findByUsername(username);
		    points = ffm.getPoints();
			
			session.setAttribute("userId",u.getUsername());
			session.setAttribute("password", u.getPassword());
		}

  }
}
 
%>

<div class="container">
<form action="FindFlight.jsp" method="get">
<table>
<tr>
<p style="color: black">Welcome!</p>
<p style="color: black"><%=firstName %> <%=lastName %> </p> 
<p style="color: black">Email Id: <%=email%></p>
<p style="color: black">Your Frequent Flier Miles are: <%=points%></p>


<input type ="submit" value="Find Flights" class="btn btn-primary"/>
</table>
</form>


<form action="RatingAndComment.jsp" method="get">
<p></p>
<p></p>
<p style="color: black">Give Your Rating: 

<%
 BookingDao daoBooking = new BookingDao();
 List<Booking> bookRating = daoBooking.findByAirlineCodeUsername(username);
	%>
	
	<div class="row">
	<div class="col-md-2">
	<select name="airlineCode" class = "form-control">
	
<%	for(Booking b: bookRating)
	{
	%>
	<option value="<%= b.getAirLineCode()%>"><%= b.getAirLineCode() %></option>
  
    
<% } %>
</select>
</div>
</div>
<div class="row">
<div class="col-md-2"><select name="rating" class = "form-control" >
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select></div>
</div>
</tr>
<p style="color: black">Comment</p> 
<div class="row">
<div class="col-md-5">
<input type="text" name="comment" class="form-control" />
</div>
</div>
<p></p>
<input name="password" type="hidden" value="<%=password %>" />
<input name="username" type="hidden" value="<%=username %>" />
<input name="feedback" type ="submit" value="Give Feedback" class="btn btn-primary"/>
<input name="feedback" type="submit" value="Modify Feedback" class="btn btn-primary" />
</form>

<p></p>
<p></p>


<p style="color: black">Your Bookings:</p>
<form action="DeleteBooking.jsp" method="get" class="form-control" style="border: 0px solid #000000;background: transparent" >
<%
List<Booking> bookings = daoBooking.findByUsername(username);
bookingIdArray = new int[bookings.size()];
itineraryIdArray = new int[bookings.size()];
%>
<p style="color: black; font-weight: bold">
<td>Booking ID</td>
<input value="" style="border: 0px solid #000000;background: transparent" size="3" />
<td>No. Of Tickets</td>
<input value="" style="border: 0px solid #000000;background: transparent"  size="3"/>
<td>Booking Date</td>
<input value="" style="border: 0px solid #000000;background: transparent"  size="3"/>
<td>Total Price</td>
<input value="" style="border: 0px solid #000000;background: transparent"  size="3"/>
<td>Airline Code</td>
<input value="" style="border: 0px solid #000000;background: transparent"  size="3"/>
<td>Airline Class</td>
</p>
<%

for(int i=0;i<bookings.size();i++)
{
%>
<table>
<p>
<tr>

<td style ="color: black; font-weight: bold"><%= bookings.get(i).getBookingId()%></td>
<td><input value="" style="border: 0px solid #000000;background: transparent" size="12"/></td>
<td style ="color: black; font-weight: bold"><%= bookings.get(i).getNumberOfTickets() %></td>
<td><input value="" style="border: 0px solid #000000;background: transparent" size="15"/></td>
<td style ="color: black; font-weight: bold"><%= bookings.get(i).getBookingdate() %></td>
<td><input value="" style="border: 0px solid #000000;background: transparent" size="7"/></td>
<td style ="color: black; font-weight: bold"><%= bookings.get(i).getTotalprice() %></td>
<td><input value="" style="border: 0px solid #000000;background: transparent" size="10"/></td>
<td style ="color: black; font-weight: bold"><%= bookings.get(i).getAirLineCode() %></td>
<td><input value="" style="border: 0px solid #000000;background: transparent" size="9"/></td>
<td style ="color: black; font-weight: bold"><%= bookings.get(i).getAirLineclass() %></td></p>
<td><input value="" style="border: 0px solid #000000;background: transparent" size="12"/></td>
</tr>
</p>
<% } %>


<td><input name="password" type="hidden" value="<%=password %>" style="border: 0px solid #000000;"/></td>
<td><input name="username" type="hidden" value="<%=username %>" style="border: 0px solid #000000;"/></td>

</table>
<p></p>
<p style ="color: black">Select the Booking Id to Cancel Booking</p>
<div class="row">
<div class="col-md-2">
<select name="bookingId" class = "form-control">
	
<%	for(Booking b: bookings)
	{
	%>
	<option value="<%= b.getBookingId()%>"><%= b.getBookingId() %></option>
    
<% } %>
</select>
</div>
</div>
<p></p>
<input name="cancelBooking" type="submit" value="Cancel Booking" class="btn btn-primary">
</form>

</div>




<form action="DisplayItinerary.jsp" method="get" class="form-control" style="border: 0px solid #000000;background: transparent" >
<p></p>
<br>
<p></p>

<p style ="color: black">Select the Booking Id to Display Itinerary</p>
<div class="row">
<div class="col-md-2">
<select name="bookingId" class = "form-control">
	
<%	for(Booking b: bookings)
	{
	%>
	<option value="<%= b.getBookingId()%>"><%= b.getBookingId() %></option>
    
<% } %>
</select>
</div>
</div>
<p></p>
<input name="password" type="hidden" value="<%=password %>" style="border: 0px solid #000000;"/>
<input name="username" type="hidden" value="<%=username %>" style="border: 0px solid #000000;"/>

<input name="DisplayItinerary" type="submit" value="Display Itinerary" class="btn btn-primary">


</form>
</body>
</html>