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
<form action="Payment.jsp" class="form-control" method="get" >
<% 
 int noOfPassengers = 0;
double total_amount = 0.0;
noOfPassengers = Integer.parseInt(request.getParameter("noOfPassengers"));
total_amount = Double.parseDouble(request.getParameter("totalCost"));
String airlineCode = request.getParameter("airlineCode");
String airlineClass = request.getParameter("airlineClass");
session.setAttribute("airlineCode", airlineCode);
session.setAttribute("airlineClass", airlineClass);


String departureLocation[] = (String[])session.getAttribute("departureLocationSession");
String arrivalLocation[] = (String[])session.getAttribute("arrivalLocationSession");
String departureDateTime[] = (String[])session.getAttribute("departureDateTimeSession");
String arrivalDateTime[] = (String[])session.getAttribute("arrivalDateTimeSession");
//String flightNumber[] = (String[])session.getAttribute("flightNumberSession");
int sizeOfArray = departureLocation.length;

if(noOfPassengers != 0)
{	
// String a[] = new String[noOfPassengers];
String passengerFirstNamesession[] = new String[noOfPassengers];
String passengerLastNamesession[] = new String[noOfPassengers];
String passengerAgesession[] = new String[noOfPassengers];
String passportNumbersession[] = new String[noOfPassengers];
String passengerGendersession[] = new String[noOfPassengers];
%>
<%
for(int i=0;i<noOfPassengers;i++)
{
	passengerFirstNamesession[i]=request.getParameter("PassengerFirstName_"+i);
	passengerLastNamesession[i]=request.getParameter("PassengerLastName_"+i);
	passengerAgesession[i]=request.getParameter("PassengerAge_"+i);
	passportNumbersession[i]=request.getParameter("PassportNumber_"+i);
	passengerGendersession[i]=request.getParameter("PassengerGender_"+i);
}
%>
	Passenger Details are:
<%
for(int i=0;i<noOfPassengers;i++)
{
	
	%>

	<table>
	<p>
	<tr>
	<td><input type="text" value="<%=passengerFirstNamesession[i] %>"/>
	<td><input type="text" value="<%=passengerLastNamesession[i] %>"/>
	<td><input type="text" value="<%=passengerAgesession[i] %>"/>
	<td><input type="text" value="<%=passportNumbersession[i] %>"/>
	<td><input type="text" value="<%=passengerGendersession[i] %>"/> 
	</tr>
	</p>
	</table>
	<%
}
 System.out.println(total_amount);
 
 session.setAttribute("PassengerFirstName", passengerFirstNamesession);
 session.setAttribute("PassengerLastName", passengerLastNamesession);	
 session.setAttribute("PassengerAge" , passengerAgesession);	
 session.setAttribute("PassportNumber", passportNumbersession);	
 session.setAttribute("PassengerGender", passengerGendersession);	
 
}

%>
<table>
<p><tr>You have Booked the Tickets with : <%=airlineCode %></tr></p>
<tr>
<td>Airline Rating : </td>

<%


RatingDao daoRating = new RatingDao();
double avgrating = daoRating.findAvgByAirlineCode(airlineCode);

%>
<td><%= avgrating %> stars</td>
</tr>
<%
CommentDao daoComment = new CommentDao();
List<Comment> comments = daoComment.findByAirlineCode(airlineCode);

for(Comment c : comments){
%>
<p>
<td><%= c.getUsername() %> says: </td>
<td><input name= "comment" class="form-control" value="<%= c.getComment() %>" /></td>
</p>
<%
}

%>


<% for(int i=0; i<sizeOfArray; i++){
	
%>
<p>
<td>Departure Location: </td>
<td><input name="departureLocation_<%=i %>" class="form-control" value="<%= departureLocation[i] %>" /></td>
</p>
<p>
<td>Arrival Location: </td>
<td><input name="arrivalLocation_"<%=i %>" class="form-control" value="<%= arrivalLocation[i] %>" readonly="readonly" /></td>
</p>
<p>
<td>Departure Date and Time: </td>
<td><input name="departureDateTime_"<%=i %>" class="form-control" value="<%= departureDateTime[i] %>" /></td>
</p>
<p>
<td>Arrival Date and Time: </td>
<td><input name="arrivalDateTime_<%=i %>" class="form-control" value="<%= arrivalDateTime[i] %>" /></td>
</p>

<%
}
%>
<p><tr>The Airline Class is : <%= airlineClass %></tr></p>
<p>
	<td>Choose type of Payment: </td>
	<td>Dollars</td>
	<td><input name="PaymentType" class="form-control" type="radio" value="Dollars"></td>
	<td>FrequentFlierMiles</td>
	<td><input name="PaymentType" class="form-control" type="radio" value="ffm"></td>
</p>
<td><input name="totalAmount" class="form-control" type="hidden" value="<%= total_amount %>" /></td>
<td><input name="noOfPassengers" class="form-control" type="hidden" value="<%= noOfPassengers %>" /></td>
<p>
<input type ="submit" value="Payment"/>
</p>
</table>

</form>
</body>
<% } %>
</html>