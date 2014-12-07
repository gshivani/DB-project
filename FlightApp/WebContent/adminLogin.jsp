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
<form action="adminLogin.jsp" method="get">
		Admin Username
		<input name="username" class="form-control" />
		Admin Password
		<input name="password"  class="form-control"/>
		<input type ="submit" value="Login"/>
   </form>	
   
   <%
   String username = request.getParameter("username");
   String password = request.getParameter("password");
   
   if (username!= null)
   {
      UserAdminDao dao = new UserAdminDao();
      UserAdmin u = dao.findByUsername(username,password);
      //System.out.println(u.getFirstname());
     
     if (u== null)
      {
   	 %>
   	 Not an admin!
   	 <%
      }
   	  
     else{
   	  
   	  if(! u.getPassword().equals(password) || u.getUsername()==null)
   		{
   		   
   		   response.sendRedirect("IncorrectPassword.jsp");
   		   
   		} else {
   			
   			response.sendRedirect("user.html");
   		}
   		
     }
   }
   
   %>
</body>
</html>