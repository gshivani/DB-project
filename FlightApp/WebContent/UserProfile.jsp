<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
		}

  }
}
 
%>

<div class="container">
<h1>User Profile</h1>
<form action="FindFlight.jsp" method="get">
<table>
<tr>
<p>Welcome!</p>
<p><%=firstName %>   <%=lastName %> </p> 
<p>Email Id: <%=email%></p>
<p>Your Frequent Flier Miles are: <%=points%></p>


<input type ="submit" value="Find Flights"/>
</table>
</form>
<form action="RatingAndComment.jsp" method="get">
<p>Give Your Rating: 

<%
 BookingDao daoBooking = new BookingDao();
 List<Booking> bookRating = daoBooking.findByAirlineCodeUsername(username);
	%><select name="airlineCode" class = "form-control">
	
<%	for(Booking b: bookRating)
	{
	%>
	<option value="<%= b.getAirLineCode()%>"><%= b.getAirLineCode() %></option>
    
<% } %>
</select>
<select name="rating" class = "form-control" >
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
</tr>
Comment 

<input type="text" name="comment">
</p>
<td><input name="password" type="hidden" value="<%=password %>"/></td>
<td><input name="username" type="hidden" value="<%=username %>"/></td>
<input name="feedback" type ="submit" value="Give Feedback"/>
<input name="feedback" type="submit" value="Modify Feedback"/>
</form>

<form action="DeleteBooking.jsp" method="get" class="form-control">
<table>
<td>Your Bookings</td>
<%
List<Booking> bookings = daoBooking.findByUsername(username);
bookingIdArray = new int[bookings.size()];
itineraryIdArray = new int[bookings.size()];
for(int i=0;i<bookings.size();i++)
{
%>
<tr>
<p>
<td>BookingId: <%= bookings.get(i).getBookingId()%></td>
<td>Number Of Tickets: <%= bookings.get(i).getNumberOfTickets() %></td>
<td>Booking Date: <%= bookings.get(i).getBookingdate() %></td>
<td>Total Price : <%= bookings.get(i).getTotalprice() %></td>
<td>Airline Code: <%= bookings.get(i).getAirLineCode() %></td>
<td>Airline Class: <%= bookings.get(i).getAirLineclass() %></td></p>
</tr>

<% } %>

<select name="bookingId" class = "form-control">
	
<%	for(Booking b: bookings)
	{
	%>
	<option value="<%= b.getBookingId()%>"><%= b.getBookingId() %></option>
    
<% } %>
<td><input name="password" type="hidden" value="<%=password %>"/></td>
<td><input name="username" type="hidden" value="<%=username %>"/></td>
<td><input name="cancelBooking" type="submit" value="Cancel Booking"></td>
</table>
</form>

</div>

</body>
</html>