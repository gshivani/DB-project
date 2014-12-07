<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
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
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String dob = request.getParameter("dob");
String email = request.getParameter("email");
String status = "online";
int frequentfliermiles = 0;

if (username!= null)
{
 User user1 = new User(username,password,firstname,lastname,dob,email,status);

 UserDao dao = new UserDao();
 User user2 = dao.createUser(user1);
 
 FrequentFlierMiles ffm1 = new FrequentFlierMiles(0, username);
 FrequentFlierMilesDao daoFfm = new FrequentFlierMilesDao();
 FrequentFlierMiles ffm2 = daoFfm.createFFM(ffm1);
 
}

%>

<h1>User Successfully Created</h1>
<form action="Login.jsp" method="get">
		<input type ="submit" value="Login"/>
</body>
</html>