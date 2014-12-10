<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, edu.neu.cs5200.Daos.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
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


ItineraryDao daoItinerary = new ItineraryDao();
daoItinerary.removeItineraryById(itineraryId);



dao.removeBookingById(bookingId);


%>
Your Booking has been Cancelled
<td>
<td><input name="password" type="hidden" value="<%=password %>"/></td>
<td><input name="username" type="hidden" value="<%=username %>"/></td>
<td><input name="UserProfile" type="submit" value="Go Back to User Profile" class="btn btn-primary"/></td>
</td>
</form>
</body>
</html>