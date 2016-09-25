<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Echelon Institute Of Technology</title>
<!-- Meta Tags -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- CSS -->

<link rel="stylesheet" href="css/structure.css" type="text/css" />
<link rel="stylesheet" href="css/form.css" type="text/css" />
<link rel="stylesheet" href="css/theme.css" type="text/css" />
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/mytable.css" type="text/css">
<link rel="stylesheet" href="css/accordion.css" type="text/css">

<!-- JavaScript -->

<script type="text/javascript" src="scripts/anurag.js"></script>
<script type="text/javascript" src="scripts/menu.js"></script>
<script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="scripts/login.js"></script>
<script type="text/javascript" src="scripts/jquery1.4.2.js"></script>

<link
	href='http://fonts.googleapis.com/css?family=Julius+Sans+One|Quantico|Ruthie|Shojumaru'
	rel='stylesheet' type='text/css' />

</head>
<jsp:include page="Header.jsp" />
<body id="public">
	<div id="container">
		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>
		<form class="formatA" action="LoginCheck" method="POST">

			<ul>

				<div class="info">
					<h2>About</h2>
					<div align="justify">Echelon Institute of Technology,
						Faridabad was established in the year 2007 on a sprawling campus
						spread over 17.5 acres. In the Year 2007-08, it had an intake
						capacity of 240 seats in CSE, IT, ECE and AEI (60 seats each). The
						institute was inaugurated by Shri R.R. Shah, IAS (Retd.), Member
						Secretary, Planning Commission, Govt. of India on 19th August
						2007. The landmark feature of session 2007-08 was the lecture
						series which was inaugurated by Prof. Yashpal, the grand old man
						of science and followed by Dr. Naresh Gupta, CEO, Adobe India.</div>
				</div>

				<li class="section"><h3></h3></li>

				<li class="complex">
					<div>
						<span class="left">
							<div class="info">
								<h2>Mission & Vision</h2>
								<div align="justify">
									ECHELON is all set to produce highly skilled, trained,
									competent and confident engineers having passion for technology
									with positive attitude and an urge too become a successful
									professional and citizen.<br> Our Mission -<br>* To
									provide quality education<br>* To promote research and
									development activities in close association with industries and
									other institutions of high repute.<br> * To help our
									students develop their skills and passion and graduate as
									responsible citizens of the country.
								</div>
							</div>
						</span> <span class="right"> <% if(session.getAttribute("loggedin").equals("false")) {
%>

							<div id="forGuest">
								<div id="panelB">
									<ul>

										<table width="100%">
											<tr>
												<td colspan="4" bgcolor="#c0c0c0">Login As :</td>
											</tr>
											<tr>
												<td><input type="radio" name="group1" value="Teacher"
													checked /></td>
												<td>Teacher</td>
												<td><input type="radio" name="group1" value="Student" /></td>
												<td>Student</td>
											</tr>
										</table>


										<li><label class="desc">Username (UID/Email ID) :</label>
											<input name="uname" class="field text small" autofocus
											type="text" maxlength="50" placeholder="Enter UID Here" /></li>

										<li><label class="desc">Password :</label> <input
											name="password" class="field text small" type="password"
											maxlength="20" placeholder="Enter Password Here" /></li>

										<li class="buttons"><input id="saveForm" class="btTxt"
											type="submit" value="Login" name="other" /></li>

										<li><a href="PassForgot.jsp"> Forgot Password </a></li>

									</ul>
								</div>
							</div> <%} else{ %>
							<div id="forUser">
								<div id="panelB">
									<ul>
										<table width="100%">
											<tr>
												<th colspan="3" bgcolor="#c0c0c0">Welcome User</th>
											</tr>
											<tr>
												<td colspan="3"></td>
											</tr>
											<tr>
												<td></td>
												<td align="center" bgcolor="#ee5c42">
													<% if(session.getAttribute("loggedin").equals("ADMIN")) {
%> <a href="AdminPro.jsp"> <% } else if(session.getAttribute("loggedin").equals("PROF")) {
%><a href="teacherPro.jsp">
															<% } else if(session.getAttribute("loggedin").equals("STUD")) {
%><a href="StudPro.jsp">
																<%} %><div style="width: 100%">
																	You can view your<br>Profile
																</div>
														</a>
												</td>
												<td></td>
											</tr>
											<tr>
												<td align="center" colspan="3">or</td>
											</tr>
											<tr>
												<td></td>
												<td align="center" bgcolor="#20b2aa"><a
													href="LogoutServlet"><div style="width: 100%">
															Logout of your <br> Profile
														</div></a></td>
												<td></td>
											</tr>
										</table>
									</ul>
								</div>


								<%} %>
							</span>

					</div>
				</li>


				<li class="section">
					<h3></h3>
				</li>
				<li class="complex">
					<div>

						<span class="left">
							<div id="panelB">
								<ul id="accordion">
									<li>&plusmn &nbsp Announcements</li>
									<ul>
										Echelon welcomes Sh. Ashok Thakur I.A.S., Secretary, MHRD,
										Govt of India on Apr 23rd, 2013.
										<br>
										<br> The Institute is organizing 2nd National Conference
										NCNPECC-2013 with an objective to bring together the
										Scientists and Students.
										<br>
										<br> Dr. Naresh Gupta, CEO ADOBE India, will be present
										amongst us on 5th of May to discuss the various facets of
										"Making an organisation".
										<br>
										<br>
									</ul>
									<li>&plusmn &nbsp Admissions Open</li>
									<ul>
										Admissions are open for the academic year 2013-2014.
										<br>
										<br> Students can visit the campus during working hours
										and have a feel of life at Echelon.
										<br>
										<br> Information about various courses available can be
										gathered from the website.
										<br>
										<br> Last date to fill the admission form is April 30th,
										2013.
										<br>
										<br>
									</ul>
									<li>&plusmn &nbsp Events / Oppotunities</li>
									<ul>
										Sankalp is organizing a coding event on saturday this week.
										Students from all year are invited to participate.
										<br>
										<br> Teachers / Students can register for IEEE seminar in
										YMCA Institute, Faridabad.
										<br>
										<br>
									</ul>
								</ul>
								<SCRIPT>
$("#accordion > li").click(function(){

	if(false == $(this).next().is(':visible')) {
		$('#accordion > ul').slideUp(300);
	}
	$(this).next().slideToggle(300);
});

$('#accordion > ul:eq(0)').show();

</SCRIPT>

							</div>
						</span> <span class="right">
							<div id="panel">
								<ul>
									<li class="first section">
										<div class="mytable">
											<table>
												<tr>
													<td>
														<h3>News & Updates</h3>
													</td>
												</tr>
												<tr height="360">
													<td>
														<div>
															<marquee background-color="#fff" scrollamount="4"
																direction="up" loop="true" height="300">
																<center>
																	Date sheet for Second Sessional examinations April- May
																	2013 available for download.<br>
																	<br> Symposium is going to be held this friday on
																	"Embedded System and its Industrial application". <br>
																	<br> A Hands-on Training on the ongoing trends of
																	hacking. Basically objective is to get aware and secure
																	our self by the recent technological flaws and errors.<br>
																	<br> Students from pre-final year are invited to
																	join the Sankalp Club.<br>
																	<br>

																</center>
															</marquee>
														</div>
													</td>
												</tr>

											</table>
										</div>

									</li>
								</ul>
						</span>

					</div>
				</li>

				<li>
					<% if(session.getAttribute("loggedin").equals("false")) {%>
					<p align=right>
						<font size="2px"> <a href="" class="login_btn"><b>Admin
									Login</b> </a> &nbsp | &nbsp <a href="Home.jsp">Home</a> &nbsp | &nbsp
							<a href="">Student</a> &nbsp | &nbsp <a href="">Parents</a> &nbsp
							| &nbsp <a href="ContactUs.jsp">Contact Us</a>
						</font>
					</p> <%} else {%>
					<p align=right>
						<font size="2px"> <a href="Home.jsp">Home</a> &nbsp | &nbsp
							<a href="">Student</a> &nbsp | &nbsp <a href="">Parents</a> &nbsp
							| &nbsp <a href="ContactUs.jsp">Contact Us</a>
						</font>
					</p> <%} %>

				</li>
				<li>
					<div class="login_box" id="panel">

						<table id="AdminLogin" width="100%">
							<tr>
								<td colspan="2" bgcolor="#c0c0c0">Admin Login
								<td>
							</tr>

							<tr>
								<td>
									<div style="height: 100%; width: 100%;">
										<ul>
											<li><label class="desc">Username (UID/Email ID)
													:</label> <input name="admin_uname" class="field text medium"
												autofocus type="text" maxlength="50"
												placeholder="Enter UID Here" /></li>

											<li><label class="desc">Password :</label> <input
												name="admin_password" class="field text medium"
												type="password" maxlength="20"
												placeholder="Enter Password Here" /></li>

											<li class="buttons"><input id="saveForm" class="btTxt"
												type="submit" value="Login" name="admin" /></li>

											<li><a href="PassForgot.jsp"> Forgot Password </a> &nbsp | &nbsp <a
												href="" class="login_btn"> Close</a></li>

										</ul>
									</div>
								</td>

								<td>Welcome Administrator <br> Please Fill this Login
									Form
								</td>
							</tr>

						</table>

					</div>
				</li>

				<jsp:include page="Footer.jsp" />
		</form>
	</div>
</body>
</html>