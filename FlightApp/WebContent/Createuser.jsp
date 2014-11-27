<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Enter all Credentials</h1>

<form action="UserCreateSucess.jsp" method="get">
		Username
		<input name="username" class="form-control" />
		Password
		<input name="password"  type="password" class="form-control"/>
		First Name
		<input name="firstname"  class="form-control"/>
	     Last Name
		<input name="lastname"  class="form-control"/>
		Date Of Birth
		<input name="dob"  class="form-control"/>
		Email
		<input name="email"  class="form-control"/>
		
		<input type ="submit" value="Login"/>
</body>
</html>