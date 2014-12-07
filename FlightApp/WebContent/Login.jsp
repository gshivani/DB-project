<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>User Login</h1>


	<form action="UserProfile.jsp" method="get">
		Username
		<input name="username" class="form-control" />
		Password
		<input name="password"  class="form-control"/>
		<input type ="submit" value="Login"/>
   </form>
		
		<form action="Createuser.jsp" method="get">
		<input type ="submit" value="Create Account"/>
		</form>
		
	<a href="adminLogin.jsp">Admin Login</a>


	
		
</body>
</html>
