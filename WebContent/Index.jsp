<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/slider.js" type="text/javascript"></script>



<script type="text/javascript">
	$(document).ready(function() {
		$('#slider').s3Slider({
			timeOut : 6000
		});
	});
</script>
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />
<link href="css/slider.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
	%>
	<div id="outer">
		<div id="wrapper">

			<div id="logo">
				<img
					src="http://omgghana.com/wp-content/uploads/2013/01/movie-logo.jpg"
					width=260px />
			</div>
			<form action="movie-search.jsp">

				<div id="searchengine">
					<input type="hidden" name="username" value="<%=username%>" /> <input
						name="movieName" placeholder="Find Movies">
					<button id="searchMovie" style="width: 90px; height: 30px">
						<h3 id="h3">Search</h3>
					</button>
				</div>

			</form>
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
					<li><a href="UserProfile.jsp">PROFILE</a></li>

				</ul>
			</div>

			<div id="slider">
				<ul id="sliderContent">
					<li class="sliderImage"><a
						href="SearchDetail.jsp?movieId=771351912&username=<%=request.getParameter("username")%>&action=description"><img
							src="http://newsbusters7.s3.amazonaws.com/images/interstellar.jpg"
							width=900 height=300 /></a> <span class="top"><strong><a
								href="SearchDetail.jsp?movieId=771351912&username=<%=request.getParameter("username")%>&action=description">Interstellar</a></strong>
							<br />A team of explorers travel through a wormhole in an
							attempt to find a potentially habitable planet that will sustain
							humanity.<br /></span></li>

					<li class="sliderImage"><a
						href="SearchDetail.jsp?movieId=771308692&username=<%=request.getParameter("username")%>&action=description"><img
							src="http://imageserver.moviepilot.com/x_men__days_of_future_past-poll-x-men-days-of-future-past-or-the-avengers.jpeg?width=1191&height=670"
							width=900 height=300 /></a> <span class="top"><strong><a
								href="SearchDetail.jsp?movieId=771308692&username=<%=request.getParameter("username")%>&action=description">X-Men:
									Days of Future Past</a></strong> <br />The ultimate X-Men ensemble fights a
							war for the survival of the species across two time periods in
							X-Men: Days of Future Past. The characters from the original
							X-Men film trilogy join forces with their younger selves from
							X-Men: First Class in an epic battle that must change the past -
							to save our future. <br /> </span></li>

					<li class="sliderImage"><a
						href="SearchDetail.jsp?movieId=771181360&username=<%=request.getParameter("username")%>&action=description"><img
							src="http://images6.fanpop.com/image/photos/34900000/the-hobbit-the-desolation-of-smaug-the-hobbit-34960196-3547-2270.jpg"
							width=900 height=300 /></a> <span class="top"><strong><a
								href="SearchDetail.jsp?movieId=771181360&username=<%=request.getParameter("username")%>&action=description">Hobbit</a></strong>
							<br />The second in a trilogy of films adapting the enduringly
							popular masterpiece The Hobbit, by J.R.R. Tolkien, The Hobbit:
							The Desolation of Smaug continues the adventure of the title
							character Bilbo Baggins (Martin Freeman) as he journeys with the
							Wizard Gandalf (Ian McKellan) and thirteen Dwarves, led by Thorin
							Oakenshield (Richard Armitage) on an epic quest to reclaim the
							lost Dwarf Kingdom of Erebor.(c) WB <br /> </span></li>


				</ul>
			</div>

			<!-- TemplateBeginEditable name="content" -->
			<div id="content">
				<%
					String welcomemember = request.getParameter("username") == null ? ""
							: request.getParameter("username");
				%>
				<h1>
					Welcome
					<%=welcomemember%></h1>

				<p>
					Hi
					<%=welcomemember%>, Welcome to Movietime! This is the best place
					for you to review and discuss movies!
				</p>
				<table
					style="clear: both; width: 100%; text-align: center; padding: 13px;">
					<th><h2>Action</h2></th>
					<tr>
						<%
							MovieDao dao = new MovieDao();
							List<Movie> movies = dao.listActionMovie();
							for (int m = 0; m <= 2; m++) {
								Movie movie = movies.get(m);
						%>
						<td style="text-align: center; padding: 36px;">
							<form name="formname1" action="HandleServlet">
								<table>
									<tr>
										<td style="text-align: center;"><img
											style="clear: both; text-align: center;" height="126"
											src="<%=movie.getPosterImage()%>" /></td>
									</tr>
									<tr>
										<td style="text-align: center;"><button name="action"
												value="description"
												style="background-color: transparent; border: 0px; cursor: pointer;">
												<h3><%=movie.getTitle()%></h3>
											</button></td>
									</tr>
									<tr>
										<td><input type="hidden" name="title"
											value="<%=movie.getTitle()%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="username"
											value="<%=username%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="id"
											value="<%=movie.getId()%>" /></td>
									</tr>
								</table>
							</form>

						</td>
						<%
							}
						%>
					</tr>
				</table>


				<table
					style="clear: both; width: 100%; text-align: center; padding: 18px; margin-left: 6px;">
					<th><h2>Classic</h2></th>
					<tr>
						<%
							List<Movie> classic_movies = dao.listRomanceMovie();
							for (int m = 0; m <= 2; m++) {
								Movie movie = classic_movies.get(m);
						%>

						<td style="text-align: center; padding: 36px;">
							<form name="formname2" action="HandleServlet">
								<table>
									<tr>
										<td style="text-align: center;"><img
											style="clear: both; text-align: center;" height="126"
											src="<%=movie.getPosterImage()%>" /></td>
									</tr>
									<tr>
										<td style="text-align: center; margin: 6px;"><button
												name="action" value="description"
												style="background-color: transparent; border: 0px; text-align: center; cursor: pointer;">
												<h3 style="text-align: center;"><%=movie.getTitle()%></h3>
											</button></td>
									</tr>
									<tr>
										<td><input type="hidden" name="title"
											value="<%=movie.getTitle()%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="username"
											value="<%=username%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="id"
											value="<%=movie.getId()%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="id"
											value="<%=movie.getId()%>" /></td>
									</tr>
								</table>
							</form>
						</td>
						<%
							}
						%>
					</tr>
				</table>





				<p>
					Hi
					<%=welcomemember%>, Welcome to Movietime! This is the best place
					for you to review and discuss movies!
				</p>
				<ul id="2">
				</ul>
			</div>
			<!-- TemplateEndEditable -->
			<div id="rightside">
				<h2 style="text-align: center;class="inactiveLink"">Coming Soon</h2>
				<form name="formname3" action="SearchDetail.jsp">
					<p class="date" style="text-align: center;">December 19, 2014</p>
					<input type="hidden" name="movieId" value="771349839" /> <input
						type="hidden" name="username" value="<%=username%>" />

					<h3 style="text-align: center;">Night at the Museum: Secret of
						the Tomb (2014)</h3>
					<button name="action" value="description"
						style="background-color: transparent; border: 0px; text-align: center; cursor: pointer;">
						<img style="clear: both; text-align: center;" height="126"
							src="http://content9.flixster.com/movie/11/18/13/11181399_tmb.jpg" />
					</button>
				</form>
				<form name="formname6" action="SearchDetail.jsp">
					<input type="hidden" name="movieId" value="771378211" /> <input
						type="hidden" name="username" value="<%=username%>" />
					<p name="action" value="description" class="date"
						style="text-align: center;">December 17, 2014</p>
					<h3 name="action" value="description" style="text-align: center;">Goodbye
						to All That (2014)</h3>
					<button name="action" value="description"
						style="background-color: transparent; border: 0px; text-align: center; cursor: pointer;">
						<img style="clear: both; text-align: center;" height="126"
							src="http://content9.flixster.com/movie/11/18/15/11181579_tmb.jpg" />
					</button>
				</form>
				<form name="formname7" action="SearchDetail.jsp">
					<p class="date" style="text-align: center;">June 6, 2014</p>
					<h3 style="text-align: center;">Spare Parts (2015)</h3>
					<input type="hidden" name="movieId" value="771382808" /> <input
						type="hidden" name="username" value="<%=username%>" />
					<button name="action" value="description"
						style="background-color: transparent; border: 0px; text-align: center; cursor: pointer;">
						<img style="clear: both; text-align: center;" height="126"
							src="http://content6.flixster.com/movie/11/18/00/11180008_tmb.jpg" />
					</button>
				</form>
			</div>

			<div id="footer">
				<p class="footer-text">Copyright - Rui Wen database project</p>
			</div>

		</div>
	</div>
</body>
</html>