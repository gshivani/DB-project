<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">


<% 
	String origin = request.getParameter("origin");
	String destination = request.getParameter("destination");
	
	if(origin != null)
	{
		FlightWebServiceClient client = new FlightWebServiceClient();
		client.parseJSON(origin,destination);
	}
	
	%>
	
	<h1>Find Flight</h1>
	<form action="FindFlight.jsp" method="get">
		Origin:
		<input name="origin" class="form-control" value=""/>
		Destination:
		<input name="destination"  class="form-control"/>
		<input type ="submit" value="DisplayFlight"/>
	
		
				
	</form>	
</div>
</body>
</html>