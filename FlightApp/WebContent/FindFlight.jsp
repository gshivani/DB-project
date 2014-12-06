<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
  });
  
  $(function() {
	    $( "#datepicker1" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
	  });
  </script>
</head>


<body>
<% 
if ((session.getAttribute("userId") == null) || (session.getAttribute("userId") == "")) 
{ 
       response.sendRedirect("Logout.jsp");	
} else {
%>
<div class="container">
	<h1>Find Flight</h1>
	<form action="DisplayFlight.jsp" method="get">
		Origin:
		<input name="origin" class="form-control" value=""/>
		Destination:
		<input name="destination"  class="form-control"/>
	    Departure Date: <input name = "depatureDate" type="text" id="datepicker">
	    Arrival Date: <input name = "arrivalDate" type="text" id="datepicker1">
	    <input type ="submit" value="DisplayFlight"/>
				
	</form>	
</div>
<%
} %>
</body>


</html>