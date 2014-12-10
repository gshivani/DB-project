<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
BODY { 
background-image: url(flights.png); 
background-repeat: no-repeat; 
background-size: 100%;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FlightApp</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
<link href="css/flight.css" rel="stylesheet"/>
</head>
<body>
 <div id="centered">  
<h1>User Login</h1>


	<form action="UserProfile.jsp" method="get">
	
	Username
	<input name="username" class="form-control" align="right"  placeholder="Username"/>
		Password
		
		<input name="password"  class="form-control" type="password" placeholder="Password"/>
		<input type ="submit" value="Login" class="btn btn-primary"/>
	
   </form>

New User?

		<form action="Createuser.jsp" method="get">
	
		<input type ="submit"  value="Create Account" class="btn btn-primary"/>
		</form>
		
			</div>
			
			
	<a href="adminLogin.jsp">Admin Login</a>

	
		
</body>
</html>
