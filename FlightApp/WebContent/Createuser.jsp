<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, edu.neu.cs5200.Daos.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create User</title>
<link href="css/bootstrap.css" rel="stylesheet"/>

<style type="text/css">
BODY {
background-image: url('images/flight2.jpg'); 
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
<h1><center>Enter all Credentials</center></h1>

<div class="row">
<div align="center" class="col-md-5">

<form action="UserCreateSucess.jsp" method="get"  style="color: black">

Username 
<input name="username" class="form-control" />
		Password
	<input name="password"  type="password" class="form-control"/>
First Name
	<input name="firstname"  class="form-control"/> 
	   Last Name
	<input name="lastname"  class="form-control" />
	Date Of Birth 
	<input name="dob"  class="form-control" id="datepicker1" /> 
Email 
	<input name="email"  class="form-control"/>
		<br>
	<input type ="submit" value="Login" class= "btn btn-success"/> 
		
		</form>
		
		</div>
		</div>
</body>
</html>