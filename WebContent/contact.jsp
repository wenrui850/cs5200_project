<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.1.js"></script>
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />
<body style="clear:both; font-size: 16px">
<%
	
	String movieInnerID = request.getParameter("movieId");
    String username = request.getParameter("username");
    String movieName = request.getParameter("movieName");
%>

<%
	UserDao userDao = new UserDao();
	int userId = userDao.findUserId(username);
	User user1 = userDao.getUser(userId);
	String goUser = "Index.jsp";
	
%>
<input id="movieName" type="hidden" value="<%=movieInnerID%>" />

<form action="ActorServlet">
	<div id="outer">
		<div id="wrapper">
			<div id="logo">
				<img src="http://omgghana.com/wp-content/uploads/2013/01/movie-logo.jpg" width=260px />
			</div>

			<div id="social-media-icons">
				<ul>
					<li><a href="http://www.facebook.com"><img
							src="Image/icons/facebook_32.png" /></a></li>
					<li><a href="http://www.twitter.com"><img
							src="Image/icons/twitter_32.png" /></a></li>
					<li><a href="http://www.youtube.com"><img
							src="Image/icons/youtube_32.png" /></a></li>
				</ul>
			</div>

           <div id="topnav">
				<ul>
					<li><a href="ListMyMovie.jsp">MY FAVOURITE</a></li>
					<li><a href="ListMovie.jsp">ALL MOVIES</a></li>
					<li><a href="contact.jsp">MESSAGE</a></li>
					<li><a href="login.jsp">LOGIN</a></li>
					<li><a href="UserProfile.jsp?username=<%=username %>">PROFILE</a></li>
					
				</ul>
			</div>
			
           
			<table id="movieList" style="clear:both; width:60%; ">

			</table>
			<table id="movieList1">

			</table>
            <input  type="hidden" name="actor1" id="actor1">
            <input  type="hidden" name="character1" id="character1">
            <input  type="hidden" name="actor2" id="actor2">
            <input  type="hidden" name="character2" id="character2">          
            <input  type="hidden" name="actor3" id="actor3">
            <input  type="hidden" name="character3" id="character3">
            <input  type="hidden" name="title" id="title">
            <input  type="hidden" name="image" id="image">         
            <input  type="hidden" name="username" id="username" value="<%=username %>" />
          
            <br/>
				<div id="comment" style="text-align: center;">
					<textarea name="comment"
						style="width: 600px; height: 120px; text-align: left;">
	</textarea>
					<br />
					<h1> To </h1>
				<br/>
				<div id="comment" style="text-align: center;">
					<textarea name="comment"
						style="width: 600px; height: 50px; text-align: left;">
	</textarea>
					<br />

	<table>
						<tr>
							<td><a href="contact.jsp"><u>Send the message</u></a></td>
						</tr>
					</table>
			
		</div>
	</div>
</form>
</body>