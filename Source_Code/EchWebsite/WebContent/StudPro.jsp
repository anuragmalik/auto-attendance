
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="mypkg.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EIT - Student Profile</title>


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
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/mytable.css" type="text/css">
<link rel="stylesheet" href="css/accordion.css" type="text/css">
<link rel="stylesheet" href="css/tabs.css" type="text/css">



<!-- JavaScript -->

<script type="text/javascript" src="scripts/anurag.js"></script>
<script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="scripts/tabs.js"></script>
<script type="text/javascript" src="scripts/accordion.js"></script>
<script type="text/javascript" src="scripts/accept.js"></script>
<script type="text/javascript" src="scripts/requestApplication.js"></script>
<script type="text/javascript">
$(document).ready( function(){
	 var res=$("#uid").attr('value');
     $.ajax({
     url: "AttChart",
     type: "post",
     data: {uid:res},
     cache: false,
     success: function(data) {
    	 $("#chartArea").html(data).show();
    	 }
     });
});
    </script>

<link
	href='http://fonts.googleapis.com/css?family=Julius+Sans+One|Quantico|Ruthie|Shojumaru'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="scripts/jquery-1.9.1.js"></script>

</head>
<jsp:include page="Header.jsp" />



<body id="public">
	<div id="container">
		<input id='uid' type='hidden'
			value='<%=session.getAttribute("uid") %>'>
		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>
		<% if (session.getAttribute("loggedin").equals("STUD")) { %>
		<%
Connection con=Connect.database();
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("SELECT * FROM Anurag.STUDENT,Anurag.DEPARTMENT,Anurag.TRADES WHERE SUID='"+session.getAttribute("uid")+"' AND Anurag.STUDENT.TCODE=Anurag.TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT");
rs.next();
%>
		<form class="formatA" action="" method="">
			<div class="info">
				<h2>Student Profile</h2>
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

								<font size="3px"> UID - <%=rs.getString("SUID")%><br>
									Contact - <%=rs.getString("MOBNO")%><br> Email - <%=rs.getString("EMAIL")%><br>
									Address - <%=rs.getString("ADDR")%>,<%=rs.getString("CITY")%>,<%=rs.getString("STATE")%><br>
									Semester -<%=rs.getString("SEM")%> <br> Stream-<%=rs.getString("DEPT_NAME")%><br>
									Date of Birth -<%=rs.getString("DOB")%><br> Guardian Name
									-<%=rs.getString("GUARDIAN")%><br> Guardian Email-<%=rs.getString("G_EMAIL")%><br>
									Guardian Contact Num -<%=rs.getString("G_MOBNO")%><br> <br>
								</font>
							</div>
						</span> <span class="right">
							<div id="panel">
								<%String val=rs.getString("NAME").trim()+"$"+rs.getString("SUID").trim()+"$"+rs.getString("EMAIL").trim(); %>
								<img src="QRCodeServlet?qrText=<%= val %>" /> <br> QR Code
								of student
							</div>
						</span>

					</div>
				</li>

			</ul>


			<div id="panel">

				<table border="0" cellpadding="0" cellspacing="0">
					<tr>

						<td>
							<div id="tab0focus" class="tab tabfocus" style="display: block;">
								Updates</div>
							<div id="tab0ready" class="tab tabhold" style="display: none;">
								<span
									onclick="ManageTabPanelDisplay('tab0focus','tab1ready','tab2ready','tab3ready','content0')">View
									Updates</span>
							</div>
						</td>
						<td width="10"></td>

						<td>
							<div id="tab1focus" class="tab tabfocus" style="display: none;">
								Attendance</div>
							<div id="tab1ready" class="tab tabhold" style="display: block;">
								<span
									onclick="ManageTabPanelDisplay('tab0ready','tab1focus','tab2ready','tab3ready','content1')">View
									Attendance</span>
							</div>
						</td>
						<td width="10"></td>

						<td>
							<div id="tab2focus" class="tab tabfocus" style="display: none;">
								Fee / Dues</div>
							<div id="tab2ready" class="tab tabhold" style="display: block;">
								<span
									onclick="ManageTabPanelDisplay('tab0ready','tab1ready','tab2focus','tab3ready','content2')">
									Fee Details</span>
							</div>
						</td>
						<td width="10"></td>

						<td>
							<div id="tab3focus" class="tab tabfocus" style="display: none;">
								Results/Notes</div>
							<div id="tab3ready" class="tab tabhold" style="display: block;">
								<span
									onclick="ManageTabPanelDisplay('tab0ready','tab1ready','tab2ready','tab3focus','content3')">Results/
									Notes</span>
							</div>
						</td>
						<td width="120"></td>
					</tr>

					<tr>
						<td colspan="7">

							<div id="content0" class="tabcontent" style="display: block;">
								<ul>
									<li>
										<table width="100%">
											<tr>
												<th colspan='2'>Notifications</th>
											</tr>
											<%Statement stn=con.createStatement();
String q="SELECT SUBJECT,NOTE,PROF_ADMIN.NAME,DATED FROM Anurag.NOTIFICATION,Anurag.PROF_ADMIN WHERE NOTIFICATION.CREATOR=PROF_ADMIN.UID AND NOTIFICATION.DEST like '%"+rs.getString("DEPT_NAME").trim()+"S"+"%' OR NOTIFICATION.DEST='ALL' OR NOTIFICATION.DEST like '%"+"A"
        +rs.getString("DEPT_NAME")+"%'";
ResultSet rtn=stn.executeQuery(q);
while(rtn.next()) {%>
											<tr bgcolor="#E5E5E5">
												<td><%=rtn.getString("SUBJECT")+" (By- "+rtn.getString("NAME")+", Date: "+rtn.getString("DATED")+")" %></td>
											</tr>
											<tr bgcolor="#F2F2F2">
												<td><%=rtn.getString("NOTE") %></td>
											</tr>
											<%} %>
											<tr>
												<th colspan='2'>Personal Notifications</th>
											</tr>
											<%Statement stp=con.createStatement();
String pr="SELECT SUBJECT,NOTE,NAME,DATED FROM Anurag.NOTIFICATION,Anurag.PROF_ADMIN WHERE NOTIFICATION.CREATOR=PROF_ADMIN.UID AND NOTIFICATION.DEST like '%"+rs.getString("SUID").trim()+"%'";
ResultSet rtp=stp.executeQuery(pr);
while(rtp.next()) {%>
											<tr bgcolor="#E5E5E5">
												<td><%="Msg : "+rtp.getString("SUBJECT")+" from "+rtp.getString("NAME")+" on date "+rtp.getString("DATED") %></td>
											</tr>
											<tr bgcolor="#F2F2F2">
												<td><%=rtp.getString("NOTE") %></td>
											</tr>
											<%} %>

											<tr>
												<th colspan='2'>Test / Results</th>
											</tr>
											<%Statement stt=con.createStatement();
String t="SELECT SUBJECT,NAME,NOTE,DATED FROM Anurag.NOTIFICATION,Anurag.PROF_ADMIN WHERE NOTIFICATION.CREATOR=PROF_ADMIN.UID AND NOTIFICATION.DEST like '%"+rs.getString("TCODE").trim()+"%'";
ResultSet rt=stt.executeQuery(t);
while(rt.next()) {%>
											<tr bgcolor="#E5E5E5">
												<td><%="A Test has been Scheduled for subject "+rt.getString("SUBJECT")+" by "+rt.getString("NAME")+" on "+rt.getString("DATED") %></td>
											</tr>
											<tr bgcolor="#F2F2F2">
												<td><%=rt.getString("NOTE") %></td>
											</tr>
											<%} %>
										</table>
									</li>
								</ul>
							</div>


							<div id="content1" class="tabcontent" style="display: none;">
								<ul>
									<table width="100%">
										<tr>
											<th colspan="3" bgcolor="#ff3030">Your Attendance
												Details :</th>
											<td bgcolor="#b8b8b8"><label class="desc"><a
													href="Attendance.jsp">View Full Details</a></label></td>
										</tr>
									</table>
									<div id="chartArea"></div>

								</ul>
							</div>



							<div id="content2" class="tabcontent" style="display: none;">
								<ul>

									<span class="left"><label class="desc"><b><h2>FEE
													DETAILS</h2></b></label></span>
									<li>
										<div class="mytable">
											<table>
												<tr>
													<td>Details</td>
													<td>Value(Rs.)</td>

												</tr>
												<tr>
													<td>Tution Fee</td>
													<td>
														<%int tution =rs.getInt("TUTION_FEES");%> <%=tution %>
													</td>
												</tr>
												<tr>
													<td>Others</td>
													<td>
														<%int others=rs.getInt("OTHER_FEES");%> <%=others %>
													</td>
												</tr>
												<tr>
													<td>Concession / Discounts</td>
													<td>
														<%int concession=rs.getInt("CONCESSION");%> <%=concession %>
													</td>
												</tr>
												<tr>
													<td bgcolor="#DCDCDC">TOTAL</td>
													<td>
														<%int total=tution+others-concession;%> <%=total %>
													</td>
												</tr>
												<tr>
													<td bgcolor="#C1FFC1">PAID</td>
													<td>
														<%int paid=rs.getInt("FEE_PAID");%> <%=paid %>
													</td>
												</tr>
												<tr>
													<td bgcolor="#FFB6C1">DUES</td>
													<td>
														<%int dues=total-paid; %> <%=dues %>
													</td>
												</tr>

											</table>
										</div>
									</li>
								</ul>
							</div>


							<div id="content3" class="tabcontent" style="display: none;">
								<table width="100%">
									<tr>
										<th bgcolor="#c0c0c0" colspan="6">Latest Results :</th>
									</tr>
									<tr>
										<th>Test Code</th>
										<th>Subject</th>
										<th>Result Status</th>
										<th>Updated By</th>
										<th>Last Updated On</th>
										<th>Options</th>
									</tr>
									<%Statement rsts=con.createStatement();
String nms="SELECT TESTNO,TOPIC,DESC,DATE,PROF_ADMIN.NAME AS NAME,SUB_NAME from Anurag.PROF_ADMIN,Anurag.TESTS,Anurag.SUBJECTS,Anurag.STUDENT WHERE Anurag.STUDENT.SUID='"+rs.getString("SUID")+"' AND TESTS.TRADE=STUDENT.TCODE AND Anurag.TESTS.PUID=Anurag.PROF_ADMIN.UID AND Anurag.TESTS.SUBC=Anurag.SUBJECTS.CODE AND TESTS.TYPE='Res'";
ResultSet pms=rsts.executeQuery(nms);
while(pms.next()) { %>
									<tr>
										<td><%=pms.getString("TESTNO").trim()%></td>
										<td><%=pms.getString("SUB_NAME").trim() %></td>
										<td><%=pms.getString("TOPIC").trim()%></td>
										<%if(pms.getString("TOPIC").trim().equals("Pending")) { %>
										<td>- - -</td>
										<%} else { %>
										<td><%=pms.getString("NAME")%></td>
										<% } %>
										<td><%=pms.getString("DATE").trim()%></td>
										<%if(pms.getString("TOPIC").trim().equals("Pending")) { %>
										<td>- - -</td>
										<%} else { %>
										<td><a href='<%=pms.getString("DESC")%>'>View</a></td>
										<% } %>
									</tr>
									<% } pms.close(); rsts.close();%>
									<tr>
										<th bgcolor="#c0c0c0" colspan="6">Latest Notes / Links :</th>
									</tr>

									<tr>
										<th colspan="1">On Topic</th>
										<th colspan="1">Shared by</th>
										<th colspan="3" width="50%">Shared At</th>
										<th colspan="1">Type</th>
									</tr>
									<% Statement stm=con.createStatement();
String n="SELECT TOPIC,LINK,PROF_ADMIN.NAME AS NAME,SUB_NAME from Anurag.SHARED,Anurag.SUBJECTS,Anurag.PROF_ADMIN WHERE SHARED.TCODE='"
			+rs.getString("TCODE")+"' AND SUBJECTS.CODE=SHARED.SUB_CODE AND SHARED.PUID=PROF_ADMIN.UID AND SHARED.TYPE='Note'";
ResultSet p=stm.executeQuery(n);
while(p.next()) { %>
									<tr>
										<td colspan="1"><%=p.getString("TOPIC")+" ("+p.getString("SUB_NAME")+")" %></td>
										<td colspan="1"><%=p.getString("NAME")%></td>
										<td colspan="3"><a href='<%=p.getString("LINK")%>'><%=p.getString("LINK") %></a></td>
										<td>Notes</td>
									</tr>
									<%} %>
									<%Statement stmt=con.createStatement();
String nt="SELECT TOPIC,LINK,PROF_ADMIN.NAME AS NAME,SUB_NAME from Anurag.SHARED,Anurag.SUBJECTS,Anurag.PROF_ADMIN WHERE SHARED.TCODE='"
			+rs.getString("TCODE")+"' AND SUBJECTS.CODE=SHARED.SUB_CODE AND SHARED.PUID=PROF_ADMIN.UID AND SHARED.TYPE='Link'";
ResultSet pt=stmt.executeQuery(nt);
while(pt.next()) { %>
									<tr>
										<td colspan="1"><%=pt.getString("TOPIC")+" ("+pt.getString("SUB_NAME")+")" %></td>
										<td colspan="1"><%=pt.getString("NAME")%></td>
										<td colspan="3"><a href='<%=pt.getString("LINK") %>'><%=pt.getString("LINK") %></a></td>
										<td>Link</td>
									</tr>
									<%} %>

								</table>

							</div>

						</td>
					</tr>
				</table>
			</div>

			<ul>

				<li class="section"><h3></h3></li>
				<br>
				<div id="panel">
					<ul id="accordion">

						<li>&plusmn &nbsp Request / Leave Application</li>
						<ul>
							<div id="returnMsg"></div>
							<table width="90%" align="center">

								<tr bgcolor="#63B8FF">
									<td colspan="2"><label class="desc">Connect</label></td>
								</tr>

								<tr>
									<td colspan="2"><label>Create : </label> <input
										name="sWhat" type="radio" value="Req" checked="checked" />
										Request <input name="sWhat" type="radio" value="Application" />
										Leave Application <label class="desc">To<span
											class="req">*</span> :
									</label>
										<div>
											<input id="dest" onkeyup="sendTo(this.value)"
												class="field text medium" type="text" maxlength="255"
												placeholder="Example text." />
										</div>

										<div id="msg">
											<label class="desc">Subject <span class="req">*</span>
												:
											</label>

											<div>
												<input id="subject" class="field text medium" type="text"
													placeholder="Subject Line" />
											</div>


											<label class="desc">Message <span class="req">*</span>
												:
											</label>

											<div>
												<textarea id="msgs" rows="20" cols="50"
													class="field textarea medium" placeholder="Message Body"></textarea>
											</div>

											<input id="iButton" name="" type="button" value="Send" />
										</div></td>
								</tr>
							</table>
						</ul>


						<li>&plusmn &nbsp Queries / Requests<span class="req">
								New</span></li>
						<ul>
							<jsp:include page="sentreqAccord.jsp" />
						</ul>

					</ul>
					<SCRIPT>
$("#accordion > li").click(function(){
	if(false == $(this).next().is(':visible')) {
		$('#accordion > ul').slideUp(300);
	}
	$(this).next().slideToggle(300);
});
</SCRIPT>

				</div>
				<jsp:include page="Footer.jsp" />
			</ul>
		</form>
		<% } else {%>
		<jsp:forward page="Error.jsp" />
		<%} %>
	</div>
</body>
</html>