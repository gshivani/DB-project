<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, edu.neu.cs5200.Daos.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find Flights</title>
<link href="css/bootstrap.css" rel="stylesheet"/>

<style type="text/css">
BODY {
background-image: url('images/flight2.jpg'); 
background-repeat: no-repeat; 
background-size: 100%;
}
</style>

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
	<div class="row">
	<div class="col-md-2">
	<form action="DisplayFlight.jsp" method="get">
		Origin:
		<input name="origin" class="form-control" value=""/>
		Destination:
		<input name="destination"  class="form-control"/>
		<p></p>
	    Departure Date: <input name = "depatureDate" type="text" id="datepicker" class="form-control">
	    Arrival Date: <input name = "arrivalDate" type="text" id="datepicker1" class="form-control">
	    <p></p>
	    <input type ="submit" value="DisplayFlight" class=" btn btn-success"/>
				
	</form>	
	</div>
	</div>
</div>
<%
} %>

</body>


</html>