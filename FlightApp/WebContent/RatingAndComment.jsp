<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, edu.neu.cs5200.Daos.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rating and Comments</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<%
String comment = request.getParameter("comment");
String rating = request.getParameter("rating");
String airlineCode = request.getParameter("airlineCode");
String username = request.getParameter("username");
String password = request.getParameter("password");
String feedbackType = request.getParameter("feedback");

if(feedbackType!= null && feedbackType.equals("Give Feedback")){

if(comment!= null && airlineCode!=null){
	CommentDao daoComment = new CommentDao();
	Comment c = new Comment(username, airlineCode, comment);
	Comment c1=daoComment.createComment(c);

}

if(rating!= null && airlineCode!=null){
	RatingDao dao = new RatingDao();
	Rating r = new Rating(username, airlineCode, rating);
	Rating r1=dao.createRating(r);
} 
}
else if(feedbackType!= null && feedbackType.equals("Modify Feedback")){

	RatingDao daoRating = new RatingDao();
	Rating oldr = daoRating.findByUsernameAndAirlineCode(username, airlineCode);
	String oldrating = oldr.getRating();
	
	CommentDao daoComment = new CommentDao();
	Comment oldc = daoComment.findByUsernameAndAirlineCode(username, airlineCode);
	String oldcomment = oldc.getComment();
%>

<form class= "form-control"  style="color: black; border: 0px solid #000000;background: transparent" align ="center">
<tr>
<br>
<br>
<td>Previous Comment</td>
<td><%= oldcomment %></td>
<td>Previous Rating: </td>
<td><%= oldrating %></td>
</tr>

</form>

<%	
	if(comment!= null && airlineCode!=null){
	
		Comment c1=daoComment.updateComment(username, airlineCode, comment);
		String newcomment = c1.getComment();

	%>
	
<form class= "form-control"  style="color: black; border: 0px solid #000000" align ="center"  >
<tr>
<br>
<br>
<td>New Comment: </td>
<td><%= newcomment %></td>

<%	}
	
	
	if(rating!= null && airlineCode!=null){
		
		Rating r=daoRating.updateRating(username, airlineCode,rating );
		String newrating = r.getRating();
		
		%>
		<td>New Rating</td>
<td><%= newrating %></td>
</tr>

</form>
<%}		
}
%>

<br>
<br>
<center>Thank you for your feedback!</center>
<br>
<br>
<form action= "UserProfile.jsp" method="get" align= "center"  style="color: black">Go back to User Profile</a>
<td><input name="password" type="hidden" value="<%=password %>" style="border: 0px solid #000000" /></td>
<td><input name="username" type="hidden" value="<%=username %>" style="border: 0px solid #000000" /></td>
<td><input type="submit" value="Back to UserProfile" class="btn btn-success"></td>

</form>
</body>
</html>