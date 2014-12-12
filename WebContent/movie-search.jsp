<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*,java.io.*"%>

<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.1.js"></script>
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />

<br />
	<%
		String movieName = request.getParameter("movieName");
	    String username = request.getParameter("username");
	%>
	<%
	UserDao userDao = new UserDao();
	int userId = userDao.findUserId(username);
	User user1 = userDao.getUser(userId);
	String goUser = "Index.jsp";
	
%>
	<div id="outer">
	<div id="wrapper">
					<div id="logo">
					<img src="http://omgghana.com/wp-content/uploads/2013/01/movie-logo.jpg" width=260px />
				</div>
				
				<div id="social-media-icons">
					<ul>
						<li><a href="http://www.facebook.com"><img
								src="Image/icons/facebook_32.png" /></a></li>
						<li><a href="#"><img src="Image/icons/rss_32.png" /></a></li>
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
	<div id="login">
	<h1>Welcome Search</h1>
	<input id="movieName" value="<%=movieName%>" />
	<button id="searchMovie">Search</button>
<form  action="SearchDetail.jsp">
	<input id="movieName"  type="hidden" name="movieName" value="<%=movieName%>" />
	<input id="username" type="hidden" name="username" value="<%=username%>" />
	
	<ol id="movieList">
	</ol>

	<ol id="movieList">
	</ol>

	<script>
		jQuery(init);

		function init() {
			jQuery("#searchMovie").click(searchMovieClicked);
		}

		function searchMovieClicked() {
			var movieName = jQuery("#movieName").val();

			var key = "m88h3a3m37pbjpfx8ug9wtfb";

			jQuery
					.ajax({
						url : "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey="
								+ key + "&q=" + movieName + "&page_limit=10",
						dataType : "jsonp",
						success : handleResponse
					});
			// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
		}

		function handleResponse(response) {
			var movies = response.movies;

			var list = jQuery("#movieList");
			list.empty();

			var liStr = '<li id="1234"><img height="100" src="http://content8.flixster.com/movie/10/94/47/10944718_mob.jpg"/>'
					+ '<button name="movieId" value="" style="background-color:transparent; border:0px; cursor:pointer;">'
					+ '<u><span class="title" value="">Star Wars Episode V</span></u></button>';

			for (var m = 0; m < movies.length; m++) {
				var movie = movies[m];
				var title = movie.title;
				var id = movie.id;
				var thumbnail = movie.posters.thumbnail;
				console.log([ id, title, thumbnail ]);

				var li = jQuery(liStr);
				li.find("button").attr("value", movie.id);
				li.find("input").attr("value", movie.title);

				li.attr("id", id);
				li.find("img").attr("src", thumbnail);
				li.find(".title").html(title);
				//li.find(".synopsis").html(synopsis);
				list.append(li);
			}

		}
		window.onload = function(){
			
			      document.getElementById('searchMovie').click();
			}
	</script>
</form>
</div>
</div>
</div>