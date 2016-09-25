
<header id="public">

	<ul id="nav">

		<li><a href="Home.jsp">HOME</a></li>
		<li><a href="Courses.jsp">COURSES &raquo;</a>
			<ul>
				<li><a href="Courses.jsp">BE/Btech. &raquo</a>
					<ul>
						<li><a href="Courses.jsp">CSE</a></li>
						<li><a href="Courses.jsp">ECE</a></li>
						<li><a href="Courses.jsp">IT</a></li>
						<li><a href="Courses.jsp">Mechanical</a></li>
					</ul></li>

				<li><a href="Courses.jsp">MBA</a></li>
				<li><a href="Courses.jsp">MTech.</a></li>
			</ul></li>

		<li><a href="#">ADMISSIONS &raquo</a>
			<ul>

				<li><a href="#">Prospectus</a></li>
				<li><a href="#">Fee Details</a></li>
				<li><a href="#">Enquiry</a></li>
				<li><a href="#">Scholarship</a></li>
			</ul></li>
		<li><a href="#">STUDENTS &raquo</a>
			<ul>
				<li><a href="#">Results</a></li>
				<li><a href="#">Tutorials &raquo;</a>
					<ul>
						<li><a href="#">Notes</a></li>
						<li><a href="#">Questions</a></li>
					</ul></li>
				<li><a href="#">ExtraCurricular Activity</a></li>
				<li><a href="#">Good Reads</a></li>
				<li><a href="#">Clubs</a></li>
			</ul></li>

		<li><a href="#">LIFE @ EIT &raquo;</a>
			<ul>
				<li><a href="#">Campus Tour</a></li>
				<li><a href="#">Events</a></li>
			</ul></li>

		<li><a href="ContactUs.jsp">CONTACT US</a></li>

	</ul>
</header>
<br>
<br>
<p style="width: 100%; background-color: #63B8FF" align="right">
	Welcome
	<%=session.getAttribute("name")%>
	,
	<% if(session.getAttribute("loggedin").equals("false")) {
%><a href="loginPage.jsp">Login</a>
	<%} else {%>
	<a href="LogoutServlet">Logout</a>
	<%} %>
</p>



