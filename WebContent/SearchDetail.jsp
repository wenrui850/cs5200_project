<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*,java.io.*,java.util.*"%>

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
	MovieDao dao=new MovieDao();
	int id=dao.findMovieIdForRottenTomatoesId(movieInnerID);
	Movie movie=dao.getMovieForId(id);
	ReviewDao reviewDao = new ReviewDao();
	List<Movie> movies=dao.listAllMovies();
	List<Review> reviews = reviewDao.listNReviewsForMovie(5,id);
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
			
            <!--<a href="movie-search.jsp?username=<%=username%>&movieName=<%=movieName %>">return</a>-->
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
            <div id="review">
            </form>
   
	<%
		for(Review review:reviews)
		{
			User user = review.getUser();
			
			String realreview = review.getReviews() == null?"":review.getReviews();
	%>
		<table style="width=36px; height=6px;text-align:center; ">
		<tr style="border:1px solid;"><td><h3><%=username %>:<%=realreview%></h3></td></tr>
		</table>
	<%} %>
	<form action="ReviewServlet">
	</div>
	<br/>
				<div id="comment" style="text-align: center;">
					<textarea name="comment"
						style="width: 600px; height: 100px; text-align: left;">
	</textarea>
					<br /> <select name="stars" style="background-color: #0099FF;">
						<option value="1">1 star</option>
						<option value="2">2 star</option>
						<option value="3" selected="selected">3 star</option>
						<option value="4">4 star</option>
						<option value="5">5 star</option>
					</select>
					<button name="action" value="comment">submit comment</button>
					<br />

				</div>
			</div>
			<input type="hidden" name="username"
				value="<%=request.getParameter("username")%>"></input> 
				<input
				type="hidden" name="id"
				value="<%=id%>"></input>
				<input
				type="hidden" name="title"
				value="<%=movieName%>"></input>
		</div>
      </form>      


			<script>
				jQuery(init);

				function init() {
					var movieName = jQuery("#movieName").val();

					var key = "m88h3a3m37pbjpfx8ug9wtfb";

					jQuery
							.ajax({
								url : "http://api.rottentomatoes.com/api/public/v1.0/movies/"
										+ movieName + ".json?apikey=" + key,
								dataType : "jsonp",
								success : handleResponse
							});
					// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
				}

				function handleResponse(response) {
					var title = response.title;
					var id = response.id;
					var thumbnail = response.posters.thumbnail;
					var genres = response.genres[1];
					var year = response.year;
					if (response.abridged_directors != null) {
						var director = response.abridged_directors[0].name;
					}

					var list = jQuery("#movieList");
					list.empty();

					var liStr = '<tr id="1234"><td><img height="166" src=""/><button name="movieId" value="" class="">Like</button></td></tr>'
							+ '<tr><td><span style="color:blue;">Year:      </span><span class="year" value="">Star Wars Episode V</span></td></tr>'
							+ '<tr><td><span style="color:blue;">Title:     </span><span class="title" value="">Star Wars Episode V</span></td></tr>'
							+ '<tr><td><span style="color:blue;">Genres:    </span><span class="genres" value=""></span></td></tr>'
							+ '<tr><td><span style="color:blue;">Director:  </span><span class="director" value=""></span></td></tr>'
							+ '<tr><td>&nbsp;</td></tr>';
							
				   document.getElementById("title").value=title;
				   document.getElementById("image").value=thumbnail;


					//var cast =  movie.abridged_cast[0];
					//var synopsis = cast;
					if (response.abridged_directors != null) {
						console.log([ id, title, thumbnail, year, genres,
								director ]);
					} else {
						console.log([ id, title, thumbnail, year, genres ]);
					}

					var li = jQuery(liStr);

					li.attr("id", id);
					li.find("img").attr("src", thumbnail);
					li.find(".year").html(year);
					li.find(".title").html(title);
					li.find(".genres").html(genres);
					li.find("button").attr("value",id);
					
					if (response.abridged_directors != null) {
						li.find(".director").html(director);
					}

					list.append(li);

					
					if (response.abridged_cast != null) {
						if(response.abridged_cast.length<=3){
						for (var m = 0; m < response.abridged_cast.length; m++) {
							var name = response.abridged_cast[m].name;
							var character = response.abridged_cast[m].characters[0];
							var listString = '<tr style="clear:both;"><td><span style="color:blue;">Actor:              </span><span id="actor" class="actor" value=""></span></td><td><span style="color:blue;">as:</span><span class="character" value=""></span></td><td><button id="btn" name="btn" value="">save the actor</button></td></tr>'
							var lit = jQuery(listString);
							lit.find("button").attr("value",name);
							lit.find("input").attr("value",this.character);
							lit.find(".actor").html(name);
							lit.find(".character").html(character);
							list.append(lit);
						}
						}else{
							for (var m = 0; m < 3; m++) {
								var name = response.abridged_cast[m].name;
								var character = response.abridged_cast[m].characters[0];
								var listString = '<tr style="clear:both;"><td><span style="color:blue;">Actor:              </span><span id="actor" class="actor" value=""></span></td><td><span style="color:blue;">as:</span><span class="character" value=""></span></td></tr>'
								var lit = jQuery(listString);
								lit.find("input").attr("value",this.character);
								lit.find(".actor").html(name);
								lit.find(".character").html(character);
								list.append(lit);
								if(m==0){
								    document.getElementById("actor1").value=name;
								    document.getElementById("character1").value=character;
								}else if(m==1){
								    document.getElementById("actor2").value=name;
								    document.getElementById("character2").value=character;
								}else{
								    document.getElementById("actor3").value=name;
								    document.getElementById("character3").value=character;
								}
							}
						}
					}
					

					if (response.synopsis != null) {
						var list11 = jQuery("#movieList1");
						list11.empty();
						var synopsis = response.synopsis;
						var listString = '<tr><td>&nbsp;</td></tr><tr><td><span class="synopsis" value=""></span></td></tr><tr><td>&nbsp;</td></tr>'
						var lit = jQuery(listString);
						lit.find(".synopsis").html(synopsis);
						list11.append(lit);
					}
					
					
				}
			</script>
		</div>
	</div>
</form>
</body>