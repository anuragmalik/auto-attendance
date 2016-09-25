<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Login / Logout</title>


<!-- Meta Tags -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<!-- CSS -->

<link rel="stylesheet" href="css/structure.css" type="text/css" />
<link rel="stylesheet" href="css/form.css" type="text/css" />
<link rel="stylesheet" href="css/theme.css" type="text/css" />
<link rel="stylesheet" href="css/header.css" type="text/css">
	<link rel="stylesheet" href="css/mytable.css" type="text/css">

		<!-- JavaScript -->

		<script type="text/javascript" src="scripts/anurag.js"></script>
		<script type="text/javascript" src="scripts/menu.js"></script>
		<script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>

		<link
			href='http://fonts.googleapis.com/css?family=Julius+Sans+One|Quantico|Ruthie|Shojumaru'
			rel='stylesheet' type='text/css'>
</head>
<jsp:include page="Header.jsp" />

<body id="public">
	<div id="container">
		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>

		<form class="formatA" action="LoginCheck" method="post">
			<ul>
				<li>
					<%if(!(session.getAttribute("loggedin").equals("false"))) {%>
					<div id="loggedInLine">
						<table width="50%" align="center">
							<tr>
								<td colspan="3"><h2>
										Hello
										<%=session.getAttribute("name") %>, You are now succesfully
										Logged In.
									</h2></td>
							</tr>
							<tr>
								<td bgcolor="#ee0000"><a href="Home.jsp"> Go to
										Homepage</a></td>
								<td></td>
								<td id="mLogout" bgcolor="#bb0000">
									<% if(session.getAttribute("loggedin").equals("ADMIN")) {
%> <a href="AdminPro.jsp"> <% } else if(session.getAttribute("loggedin").equals("PROF")) {
%><a href="teacherPro.jsp">
											<% } else if(session.getAttribute("loggedin").equals("STUD")) {
%><a href="StudPro.jsp">
												<%} %> View Profile
										</a>
								</td>
								<td></td>
								<td id="mLogout" bgcolor="#bb0000"><a href="LogoutServlet">Logout</a></td>
							</tr>
						</table>
					</div>
					<%} else { %> <%if(session.getAttribute("afterLogout").equals("true")) { %>

					<div id="logOutLine">
						<h2>Hello User, You have been Succesfully Logged out.</h2>
						You can now proceed to login again or go to <a href="Home.jsp">Homepage</a>
					</div> <%} %>
					<div style="width: 60%;" align="center" id="Login_Panel">

						<li class="complex">
							<% if(session.getAttribute("loginFail").equals("true")){ %>
							<div id="LogFail">
								<font size="3" color="red">Invalid Login Details. Try
									Again</font>
							</div>
							<%} %> <span class="fourCol"> <label class="desc">Login
									As :</label></span> <span class="threeCol">
								<table width="100%" align="left">
									<tr>
										<td><input type="radio" name="group1" value="Admin"
											checked /></td>
										<td>Admin</td>
										<td><input type="radio" name="group1" value="Teacher"
											checked /></td>
										<td>Teacher</td>
										<td><input type="radio" name="group1" value="Student" /></td>
										<td>Student</td>
									</tr>
								</table>
						</span>
						</li>

						<li class="complex"><span class="fourCol"> <label
								class="desc">Username :</label></span> <span class="leftHalf"> <input
								name="uname" class="field text medium" autofocus type="text"
								maxlength="50" placeholder="Enter UID Here" />
						</span> <span class="fourCol"> <label class="desc">Password
									:</label></span> <span class="leftHalf"> <input name="password"
								class="field text medium" type="password" maxlength="20"
								placeholder="Enter Password Here" />
						</span> <span class="fourCol"></span> <span class="fourCol"> <input
								id="saveForm" style="width: 100%" class="btTxt" type="submit"
								value="Login" name="other" />
						</span> <span class="fourCol"></span></li>
						<li class="complex"><span class="fourCol"></span> <span
							class="fourCol"> <a href="PassForgot.jsp"> Forgot Password </a></span></li>
					</div>
					<%} %>
				</li>

			</ul>
		</form>
	</div>
</body>
</html>