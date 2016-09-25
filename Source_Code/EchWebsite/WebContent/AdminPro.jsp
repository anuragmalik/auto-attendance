<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="mypkg.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>EIT - Admin</title>
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
<link rel="stylesheet" href="css/accordion.css" type="text/css">
<link rel="stylesheet" href="css/tabs.css" type="text/css">
<link rel="stylesheet" href="css/tabLinks.css" type="text/css">


<!-- JavaScript -->

<script type="text/javascript" src="scripts/anurag.js"></script>
<script type="text/javascript" src="scripts/menu.js"></script>
<script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="scripts/tabs.js"></script>
<script type="text/javascript" src="scripts/accept.js"></script>
<script type="text/javascript" src="scripts/getTo.js"></script>
<script type="text/javascript" src="scripts/setTo.js"></script>
<script type="text/javascript" src="scripts/getter.js"></script>
<script type="text/javascript" src="scripts/briefPro.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var subj;
	var msg;
	var to;
	var sender;
	$("#pnoteb").click(function(){
		to=$("#destid").attr('value');
		msg=$("#msgs").attr('value');
		subj=$("#sub").attr('value');
		sender=$("#tuid").attr('value');
		
		$.ajax({
		     url: "Notifier",	
		     type: "post",
		     data: {creator:sender,sub:subj,msg:msg,dest:to,type:"Personal"},
		     cache: false,
		     success: function(data) {
		     $("#msgs").val('');
		     $("#sub").val('');
		     $("#noteResult").html(data).slideDown();
		     }
		     }); 
	});
});
</script>

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
		<% if (session.getAttribute("loggedin").equals("ADMIN")) { %>
		<%
Connection con=Connect.database();
Statement st=con.createStatement();
String query="SELECT * FROM Anurag.PROF_ADMIN,Anurag.DEPARTMENT WHERE UID='"+session.getAttribute("uid")+"' AND Anurag.PROF_ADMIN.DEPT=Anurag.DEPARTMENT.DEPT";
ResultSet rs=st.executeQuery(query);
rs.next();
%>
		<input type="hidden" id="tuid" value='<%=rs.getString("UID") %>' />
		<form class="formatA" action="" method="">
			<div class="info">
				<h2>Admin Profile</h2>
				<font size="4px"><b><%=rs.getString("NAME")%></b></font> <br>
			</div>

			<ul>
				<li class="section"><h3></h3></li>
				<li>
					<p align=right>
						<font size="2px"> <a href="PassChange.jsp">Change
								Password</a> &nbsp | &nbsp <a href="UpdateForm.jsp">Update</a>
						</font>
					</p>
				</li>

				<li class="complex">
					<div>
						<span class="left">
							<div id="panel">

								<font size="3px"> UID - <%=rs.getString("UID")%><br>
									Contact - <%=rs.getString("MOBNO")%><br> Email - <%=rs.getString("EMAIL")%><br>
									Address - <%=rs.getString("ADDR")%>,<%=rs.getString("CITY")%>,<%=rs.getString("STATE")%><br>
									Date of Birth - <%=rs.getString("DOB")%><br> Joined On - <%=rs.getString("DOJ")%><br>
									Qualifications-<%=rs.getString("QUALIFICATION")%><br>
									Department-<%=rs.getString("DEPT_NAME")%><br> <br>


								</font>
							</div>
						</span> <span class="right">
							<div id="panel">
								<%String val=rs.getString("NAME")+"$"+rs.getString("EMAIL"); %>
								<img src="QRCodeServlet?qrText=<%=val %>" />
							</div>
						</span>

					</div>
				</li>
				<li class="section"><h3></h3></li>
				<table width="100%">
					<tr>
						<th colspan='2'>Notifications</th>
					</tr>
					<%Statement stn=con.createStatement();
String q="SELECT SUBJECT,NOTE,PROF_ADMIN.NAME,DATED FROM Anurag.NOTIFICATION,Anurag.PROF_ADMIN WHERE NOTIFICATION.CREATOR=PROF_ADMIN.UID AND NOTIFICATION.DEST like '%"+rs.getString("DEPT_NAME").trim()+"A"
			+"%' OR NOTIFICATION.DEST='ALL' OR NOTIFICATION.DEST like '%"+"A"+rs.getString("DEPT_NAME")+"%'";
ResultSet rtn=stn.executeQuery(q);
while(rtn.next()) {%>
					<tr bgcolor="#e5e5e5">
						<td><%=rtn.getString("SUBJECT")+" (By- "+rtn.getString("NAME")+" Dated: "+rtn.getString("DATED")+")" %></td>
					</tr>
					<tr bgcolor="#f2f2f2">
						<td><%=rtn.getString("NOTE") %></td>
					</tr>
					<%} %>
					<tr>
						<th colspan='2'>Personal Notifications</th>
					</tr>
					<%Statement stp=con.createStatement();
String pr="SELECT SUBJECT,NOTE,NAME,DATED FROM Anurag.NOTIFICATION,Anurag.PROF_ADMIN WHERE NOTIFICATION.CREATOR=PROF_ADMIN.UID AND NOTIFICATION.DEST like '%"+rs.getString("UID").trim()+"%'";
ResultSet rtp=stp.executeQuery(pr);
while(rtp.next()) {%>
					<tr bgcolor="#e5e5e5">
						<td><%=rtp.getString("SUBJECT")+" (From- "+rtp.getString("NAME")+" Dated: "+rtp.getString("DATED")+")" %></td>
					</tr>
					<tr bgcolor="#f2f2f2">
						<td><%=rtp.getString("NOTE") %></td>
					</tr>
					<%} %>
				</table>


				<li class="section"><h3></h3></li>
				<h3>USER MANAGEMENT</h3>
				<div id="panel">
					<ul id="accordion">
						<li>&plusmn &nbsp Queries / Requests<span class="req">
								New</span></li>
						<ul>
							<jsp:include page="reqAccord.jsp" />
						</ul>

						<li>&plusmn &nbsp View / Update User Profile</li>
						<ul>
							<li><label>Search by :</label> <input name="what"
								type="radio" value="Name" checked="checked" /> NAME <input
								name="what" type="radio" value="Uid" /> UID <input id="name"
								onkeyup="showState(this.value)" class="field text medium"
								type="text" maxlength="255" placeholder="Example Name Or UID"
								value="" />
							</td></li>
							<li>
								<div id="disp" style="width: 50%"></div>
								<div id="prodisp"></div>
							</li>

						</ul>

						<li>&plusmn &nbsp Notification / Email</li>
						<ul>
							<table width="90%" align="center">

								<tr bgcolor="#63B8FF">
									<td colspan="2"><label class="desc">Connect</label></td>
								</tr>

								<tr>
									<td colspan="2"><label>Create : </label> <input
										name="note" type="radio" value="sendNote" checked="checked" />
										Notification <input name="note" type="radio" value="sendEmail" />
										Email
										<div id="noteResult"></div> <label class="desc">To<span
											class="req">*</span> :
									</label>

										<div>
											<input id="dest" onkeyup="sendTo(this.value)"
												class="field text medium" type="text" maxlength="255"
												placeholder="Example text." />
										</div> <input type="hidden" id="destid" value="uid" />
										<div id="dispTo"
											style="position: absolute; width: 45%; z-index: 999;"></div>
										<div id="msg">
											<label class="desc">Subject<span class="req">*</span>
												:
											</label> <input id="sub" class="field text medium" type="text"
												maxlength="255" placeholder="Subject" /> <label class="desc">Message
												<span class="req">*</span> :
											</label>
											<div>
												<textarea id="msgs" rows="20" cols="50"
													class="field textarea medium" placeholder="Message Body"></textarea>
											</div>

											<input id="pnoteb" name="sendmsg" type="button" value="Send" />
										</div></td>
								</tr>
							</table>
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

				<li class="section"><h3></h3></li>

				<table class="tabLinks" width="100%" align="center">
					<tr>
						<th colspan="3">User Management</th>
					</tr>

					<tr>
						<td><a href="RegForm.jsp"><div>Register New User</div></a></td>
						<td><a href="SearchUser.html"><div>Search User</div></a></td>
						<td><a href="SearchUser.html"><div>Delete User</div></a></td>
					</tr>

					<tr>
						<th colspan="3">Reports / Updates</th>
					</tr>

					<tr>
						<td><a href="#"><div>View Reports</div></a></td>
						<td><a href="Notification.jsp"><div>Create
									Notification</div></a></td>
						<td><a href="#"><div>Send Email</div></a></td>
					</tr>

					<tr>
						<th colspan="3">Others</th>
					</tr>

					<tr>
						<td colspan="1"><a href="#"><div>Payroll
									Management</div></a></td>
						<td colspan="2"><a href="#"><div>Fee Structure</div></a></td>
					</tr>
					<tr>
						<td colspan="2"><a href="#"><div>Timetable
									Management</div></a></td>
						<td colspan="1"><a href="#"><div>Academic Calender</div></a></td>
					</tr>
				</table>


				<jsp:include page="Footer.jsp" />

			</ul>
		</form>
		<% } else {%>
		<jsp:forward page="Error.jsp" />
		<%} %>
	</div>

</body>


</html>