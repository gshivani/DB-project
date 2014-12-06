<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.flight.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

<form>
<tr>
<td>Previous Rating: </td>
<td><%= oldrating %></td>
<td>Previous Comment</td>
<td><%= oldcomment %></td>
</tr>

</form>

<%	
	if(comment!= null && airlineCode!=null){
	
		Comment c1=daoComment.updateComment(username, airlineCode, comment);
		String newcomment = c1.getComment();

	%>
	
	<form>
<tr>
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


Thank you for your feedback!

<form action= "UserProfile.jsp" method="get">Go back to User Profile</a>
<td><input name="password" type="hidden" value="<%=password %>"/></td>
<td><input name="username" type="hidden" value="<%=username %>"/></td>
<td><input type="submit" value="Back to UserProfile"></td>

</form>
</body>
</html>