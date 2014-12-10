<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, edu.neu.cs5200.Daos.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Passenger Details</title>
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
	<p></p>
	<table>
	<td><input type="text" value= "First Name" style="border: 0px solid #000000;"  readonly="readonly" /></td>
	<td><input type="text" value= "Last Name" style="border: 0px solid #000000;"  readonly="readonly" /></td>
	<td><input type="text" value= "Age" style="border: 0px solid #000000;"  readonly="readonly" /></td>
	<td><input type="text" value= "Passport Number" style="border: 0px solid #000000;"  readonly="readonly" /></td>
	<td><input type="text" value= "Gender" style="border: 0px solid #000000;"  readonly="readonly" /></td>
	
	</table>
<%
for(int i=0;i<noOfPassengers;i++)
{
	
	%>

	<table>
	
	<p>
	<tr>
	<td><input type="text" style="border: 0px solid #000000;"  readonly="readonly" value="<%=passengerFirstNamesession[i] %>"/>
	<td><input type="text" style="border: 0px solid #000000;"  readonly="readonly" value="<%=passengerLastNamesession[i] %>"/>
	<td><input type="text" style="border: 0px solid #000000;"  readonly="readonly" value="<%=passengerAgesession[i] %>"/>
	<td><input type="text" style="border: 0px solid #000000;"  readonly="readonly" value="<%=passportNumbersession[i] %>"/>
	<td><input type="text" style="border: 0px solid #000000;"  readonly="readonly" value="<%=passengerGendersession[i] %>"/> 
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

double avgrating = 0.0;

RatingDao daoRating = new RatingDao();
avgrating = daoRating.findAvgByAirlineCode(airlineCode);

%>
<td><%= avgrating %> stars</td>
</tr>
<tr>
<td>Comments on the airline</td>
<%
CommentDao daoComment = new CommentDao();
List<Comment> comments = daoComment.findByAirlineCode(airlineCode);

for(Comment c : comments){
%>
<p>

<td>&nbsp <%= c.getUsername() %>&nbsp says: </td>
<td><input name= "comment" class="form-control" value="<%= c.getComment() %>" readonly="readonly" /></td>

</p>

<%
}

%>
</tr>

<% for(int i=0; i<sizeOfArray; i++){
	
%>
<p>
<div class="row">
<div class="col-md-3">
<tr>
<p>

<td>Departure Location: </td>

<td><input name="departureLocation_<%=i %>" class="form-control" value="<%= departureLocation[i] %>" size= "4" readonly="readonly" /></td>

<td>&nbsp Arrival Location: &nbsp</td>
<td><input name="arrivalLocation_"<%=i %>" class="form-control" value="<%= arrivalLocation[i] %>" size= "4" readonly="readonly" /></td>


<td>&nbsp Departure Date and Time:&nbsp </td>
<td><input name="departureDateTime_"<%=i %>" class="form-control" value="<%= departureDateTime[i] %>" readonly="readonly" /></td>


<td>&nbsp Arrival Date and Time: &nbsp </td>
<td><input name="arrivalDateTime_<%=i %>" class="form-control" value="<%= arrivalDateTime[i] %>" readonly="readonly"  /></td>
</p>
</tr>
</div></div>

<%
}
%>
</p>
<p><tr>The Airline Class is : <%= airlineClass %></tr></p>

	<td>Choose type of Payment: </td>
	<td>Dollars</td>
	<td><input name="PaymentType" class="form-control" type="radio" value="Dollars"></td>
	<td>FrequentFlierMiles</td>
	<td><input name="PaymentType" class="form-control" type="radio" value="ffm"></td>

<td><input name="totalAmount" class="form-control" type="hidden" value="<%= total_amount %>" /></td>
<td><input name="noOfPassengers" class="form-control" type="hidden" value="<%= noOfPassengers %>" /></td>
<p>

</p>
</table>
<p></p>
<input type ="submit" value="Payment" class = "btn btn-success" />
</form>
</body>
<% } %>
</html>