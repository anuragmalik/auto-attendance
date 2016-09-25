

<%@page import="mypkg.Connect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>Echelon Institute of Tech.</title>


<!-- Meta Tags -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<!-- JavaScript -->

<script type="text/javascript" src="scripts/anurag.js"></script>
<script src="scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="scripts/tabs.js"></script>
<script type="text/javascript" src="scripts/accordion.js"></script>
<script type="text/javascript" src="scripts/requestApplication.js"></script>
<script type="text/javascript" src="scripts/accept.js"></script>
<script type="text/javascript" src="scripts/teachTabs.js"></script>
<!-- CSS -->

<link rel="stylesheet" href="css/structure.css" type="text/css" />
<link rel="stylesheet" href="css/form.css" type="text/css" />
<link rel="stylesheet" href="css/theme.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/mytable.css" type="text/css">
<link rel="stylesheet" href="css/accordion.css" type="text/css">
<link rel="stylesheet" href="css/tabs.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">

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
		<% if (session.getAttribute("loggedin").equals("PROF")) { %>
		<%
Connection con=Connect.database();
Statement st=con.createStatement();
String query="SELECT * FROM Anurag.PROF_ADMIN,Anurag.DEPARTMENT,Anurag.EMPLOYEE WHERE UID='"+session.getAttribute("uid")+"'AND Anurag.PROF_ADMIN.DEPT=Anurag.DEPARTMENT.DEPT AND Anurag.PROF_ADMIN.EMP_CODE=Anurag.EMPLOYEE.EMP_CODE";
ResultSet rs=st.executeQuery(query);
rs.next();
%>

		<form class="formatA" action="" method="">
			<div class="info">
				<h2>Teacher Profile</h2>
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
									Dept - <%=rs.getString("DEPT_NAME")%><br> Designation- <%=rs.getString("EMP")%><br>
									Contact - <%=rs.getString("MOBNO")%><br> Email - <%=rs.getString("EMAIL")%><br>
									Address - <%=rs.getString("ADDR")%>,<%=rs.getString("CITY")%>,<br><%=rs.getString("STATE")%><br>
									Joined On - <%=rs.getString("DOJ")%><br> Qualification - <%=rs.getString("QUALIFICATION")%><br>
									Salary- <%=rs.getString("SALARY")%> <br>
								</font>
							</div>
						</span> <span class="right">
							<div id="panel">
								<%String val=rs.getString("NAME").trim()+"$"+rs.getString("EMAIL").trim(); %>
								<img src="QRCodeServlet?qrText=<%=val %>" />
							</div>
						</span>

					</div>
				</li>

				<li class="section"><h3></h3></li>
				<br>
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
									Test / Assignment</div>
								<div id="tab1ready" class="tab tabhold" style="display: block;">
									<span
										onclick="ManageTabPanelDisplay('tab0ready','tab1focus','tab2ready','tab3ready','content1')">Test
										/ Assignment</span>
								</div>
							</td>
							<td width="10"></td>

							<td>
								<div id="tab2focus" class="tab tabfocus" style="display: none;">
									Results</div>
								<div id="tab2ready" class="tab tabhold" style="display: block;">
									<span
										onclick="ManageTabPanelDisplay('tab0ready','tab1ready','tab2focus','tab3ready','content2')">
										Update Results</span>
								</div>
							</td>
							<td width="10"></td>

							<td>
								<div id="tab3focus" class="tab tabfocus" style="display: none;">
									Notes / Links</div>
								<div id="tab3ready" class="tab tabhold" style="display: block;">
									<span
										onclick="ManageTabPanelDisplay('tab0ready','tab1ready','tab2ready','tab3focus','content3')">Share
									</span>
								</div>
							</td>
							<td width="120"></td>
						</tr>

						<tr>
							<td colspan="7"><input id="tuid" type="hidden"
								value='<%=rs.getString("UID") %>'></input>

								<div id="content0" class="tabcontent" style="display: block;">
									<ul>
										<li>
											<table width="100%">
												<tr>
													<th colspan='2'>Notifications</th>
												</tr>
												<%Statement stn=con.createStatement();
String q="SELECT SUBJECT,NOTE,NAME,DATED FROM Anurag.NOTIFICATION,Anurag.PROF_ADMIN WHERE NOTIFICATION.CREATOR=PROF_ADMIN.UID AND NOTIFICATION.DEST like '%"+rs.getString("DEPT_NAME").trim()+"T"
			+"%' OR NOTIFICATION.DEST='ALL' OR NOTIFICATION.DEST like '%"+"A"+rs.getString("DEPT_NAME")+"%'";
ResultSet rtn=stn.executeQuery(q);
while(rtn.next()) {%>
												<tr bgcolor="#e5e5e5">
													<td><%=rtn.getString("SUBJECT")+" (By- "+rtn.getString("NAME")+" Dated:"+rtn.getString("DATED")+")" %></td>
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
										</li>
									</ul>
								</div>

								<div id="content1" class="tabcontent" style="display: none;">

									<ul id="accordion">
										<li>&plusmn &nbsp New Test / Assignment</li>
										<ul>
											<label class="desc">Class : </label>
											<li class="complex"><span class="threeCol"> <select
													id="testTrade" class="field select large">
														<option value="" selected="selected"></option>
														<%
Statement srt=con.createStatement();
String subm="SELECT SUB_NAME,CODE,DEPT_NAME,SEM,SUBJECTS.TCODE from SUBJECTS,DEPARTMENT,TRADES  where UID='"+rs.getString("UID")+"' AND Anurag.SUBJECTS.TCODE=Anurag.TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT"; 
ResultSet rtrm=srt.executeQuery(subm);
while(rtrm.next()) {%>
														<option id='<%=rtrm.getString("CODE") %>'
															value='<%=rtrm.getString("TCODE")%>'><%=rtrm.getString("SUB_NAME")+rtrm.getString("DEPT_NAME")+rtrm.getString("SEM") %></option>
														<%} rtrm.close(); srt.close(); %>
												</select> <label>Subject / Class</label>
											</span></li>
											<label class="desc">Topic <span class="req">*</span>
												:
											</label>
											<div>
												<input id="testt" class="field text medium" type="text"
													maxlength="50" placeholder="Topic of the test" />
											</div>

											<label class="desc">Description <span class="req">*</span>
												:
											</label>

											<div>
												<textarea id="testd" rows="20" cols="50"
													class="field textarea medium" placeholder="Message Body"></textarea>
											</div>
											<li class="complex"><span class="threeCol"> <label
													class="desc">Test Date <span class="req">*</span> :
												</label>
											</span> <span class="leftHalf">
													<div>
														<input id="testDate" type="text" class="field text medium"
															placeholder="DD-MM-YYYY" />
													</div>
											</span></li>
											<input id="testb" name="share" type="button"
												value="Create Test" />

											<div class="tRes" id="panelB" style="width: 80%; height: 10%">
											</div>

										</ul>

										<li>&plusmn &nbsp List of Scheduled Test and Assignments</li>
										<ul>
											<table width="90%" align="center">
												<tr>
													<th colspan="8" bgcolor="#c0c0c0">Scheduled
														Tests/Assignments</th>
												</tr>
												<tr>
													<th>Class</th>
													<th>Code No.</th>
													<th>Topic</th>
													<th colspan="4">Description</th>
													<th>Dated</th>
												</tr>

												<%Statement rst=con.createStatement();
String nm="SELECT TESTNO,TOPIC,DESC,DATE,DEPT_NAME,SEM,SUB_NAME from Anurag.TESTS,Anurag.SUBJECTS,Anurag.DEPARTMENT,Anurag.TRADES WHERE TESTS.PUID='"
			+rs.getString("UID")+"' AND TESTS.TRADE=TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT AND Anurag.TESTS.SUBC=Anurag.SUBJECTS.CODE AND TESTS.TYPE='Test'";
ResultSet pm=rst.executeQuery(nm);
while(pm.next()) { %>
												<tr>
													<td><%=pm.getString("DEPT_NAME")+" "+pm.getString("SEM") +" Sem"%></td>
													<td><%=pm.getString("TESTNO")%></td>
													<td><%=pm.getString("TOPIC")+" ("+pm.getString("SUB_NAME") +")"%></td>
													<td colspan="4"><%=pm.getString("DESC")%></td>
													<td><%=pm.getString("DATE")%></td>
												</tr>
												<% } pm.close(); rst.close();%>
											</table>
										</ul>

									</ul>
								</div>


								<div id="content2" class="tabcontent" style="display: none;">
									<ul id="accordion">
										<li>&plusmn &nbsp Update New Results</li>
										<ul>
											<li class="complex"><span class="threeCol"> <label
													class="desc">Test Code<span class="req">*</span> :
												</label>
											</span> <span class="threeCol"> <select id="resultCode"
													class="field select large">
														<option value="" selected="selected"></option>
														<%
Statement srtc=con.createStatement();
String subc="SELECT TESTNO from TESTS where PUID='"+rs.getString("UID")+"' AND TYPE='Test'"; 
ResultSet rtc=srtc.executeQuery(subc);
while(rtc.next()) {%>
														<option value='<%=rtc.getString("TESTNO")%>'><%=rtc.getString("TESTNO") %></option>
														<%} %>
												</select> <label>Select Test Code</label>
											</span></li>

											<label class="desc">Link <span class="req">*</span> :
											</label>
											<div>
												<input id="resl" class="field text medium" type="text"
													maxlength="50" placeholder="result shared at this link" />
											</div>

											<input id="resb" name="share" type="button" value="Update" />

											<div class="resmsg" id="panelB"
												style="width: 80%; height: 10%"></div>

										</ul>

										<li>&plusmn &nbsp Previous Results</li>
										<ul>
											<table width="90%" align="center">
												<tr>
													<th colspan="6" bgcolor="#c0c0c0">Previous Tests /
														Assignments Status</th>
												</tr>
												<tr>
													<th>Class</th>
													<th>Code No.</th>
													<th>Subject</th>
													<th>Result Status</th>
													<th>Last Updated On</th>
													<th>Options</th>
												</tr>
												<%Statement rsts=con.createStatement();
String nms="SELECT TESTNO,TOPIC,DESC,DATE,DEPT_NAME,SEM,SUB_NAME from Anurag.TESTS,Anurag.SUBJECTS,Anurag.DEPARTMENT,Anurag.TRADES WHERE TESTS.PUID='"
			+rs.getString("UID")+"' AND TESTS.TRADE=TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT AND Anurag.TESTS.SUBC=Anurag.SUBJECTS.CODE AND TESTS.TYPE='Res'";
ResultSet pms=rsts.executeQuery(nms);
while(pms.next()) { %>
												<tr>
													<td><%=pms.getString("DEPT_NAME").trim()+" "+pms.getString("SEM").trim() +" Sem" %></td>
													<td><%=pms.getString("TESTNO").trim()%></td>
													<td><%=pms.getString("SUB_NAME").trim() %></td>
													<td><%=pms.getString("TOPIC").trim()%></td>
													<td><%=pms.getString("DATE").trim()%></td>
													<%if(pms.getString("DESC").trim().equals("- - -")) { %>
													<td>- - -</td>
													<%} else { %>
													<td><a href='<%=pms.getString("DESC")%>'>View</a></td>
													<% } %>
												</tr>
												<% } pms.close(); rsts.close();%>

											</table>
										</ul>

									</ul>
								</div>


								<div id="content3" class="tabcontent" style="display: none;">
									<ul id="accordion">

										<li>&plusmn &nbsp Share Notes/Links</li>
										<ul>
											<table width="100%">
												<tr>
													<td><label class="desc">Class : </label>
														<li class="complex"><span class="leftHalf"> <select
																id="trade" class="field select large">
																	<option value="" selected="selected"></option>
																	<%
Statement s=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
String sub="SELECT SUB_NAME,CODE,DEPT_NAME,SEM,SUBJECTS.TCODE from SUBJECTS,DEPARTMENT,TRADES  where UID='"+rs.getString("UID")+"' AND Anurag.SUBJECTS.TCODE=Anurag.TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT"; 
ResultSet rtr=s.executeQuery(sub);
while(rtr.next()) {%>
																	<option id='<%=rtr.getString("CODE") %>'
																		value='<%=rtr.getString("TCODE")%>'><%=rtr.getString("SUB_NAME")+rtr.getString("DEPT_NAME")+rtr.getString("SEM") %></option>
																	<%} rtr.close(); s.close(); %>
															</select> <label>Subject / Class</label>
														</span></li> <label>Share : </label> <input id="Notes"
														name="shareWhat" type="radio" value="notes" /> Notes <input
														id="Links" name="shareWhat" type="radio" checked="checked"
														value="link" /> Link</td>
													<td><p align="right">
															<img src="images/share.jpg" alt="an image was here">
														</p></td>
												</tr>
											</table>

											<label class="desc">Topic<span class="req">*</span> :
											</label>

											<div>
												<input id="topic" class="field text medium" type="text"
													maxlength="50"
													placeholder="Topic of the shared note / link" />
											</div>


											<label class="desc">Shared Link <span class="req">*</span>
												:
											</label>
											<div>
												<input id="link" class="field text medium" type="text"
													maxlength="50" placeholder="document shared at this link" />
											</div>

											<input id="sData" type="button" value="Share" />

											<div class="resShare" id="panelB"
												style="width: 80%; height: 10%"></div>
										</ul>

										<li>&plusmn &nbsp Shared Data</li>
										<ul>

											<table width="90%" align="center">
												<tr>
													<th bgcolor="#c0c0c0" colspan="6">Notes</th>
												</tr>
												<tr>
													<th colspan="1">On Topic</th>
													<th colspan="1">Shared to</th>
													<th colspan="4" width="50%">Share Drive</th>
												</tr>
												<%Statement stm=con.createStatement();
String n="SELECT TOPIC,LINK,DEPT_NAME,SEM,SUB_NAME from Anurag.SHARED,Anurag.SUBJECTS,Anurag.DEPARTMENT,Anurag.TRADES WHERE SHARED.PUID='"
			+rs.getString("UID")+"' AND SHARED.TYPE='Note' AND SHARED.TCODE=TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT AND Anurag.SHARED.SUB_CODE=Anurag.SUBJECTS.CODE";
ResultSet p=stm.executeQuery(n);
while(p.next()) { %>
												<tr>
													<td colspan="1"><%=p.getString("TOPIC")+" ("+p.getString("SUB_NAME")+")" %></td>
													<td colspan="1"><%=p.getString("DEPT_NAME")+" "+p.getString("SEM") +" Sem"%></td>
													<td colspan="4"><%=p.getString("LINK") %></td>
												</tr>
												<% } p.close(); stm.close();%>

												<tr>
													<th bgcolor="#c0c0c0" colspan="6">Links - Good Reads</th>
												</tr>
												<tr>
													<th colspan="1">On Topic</th>
													<th colspan="1">Shared to</th>
													<th colspan="4" width="50%">Share Drive</th>
												</tr>
												<%Statement stmt=con.createStatement();
String l="SELECT TOPIC,LINK,DEPT_NAME,SEM,SUB_NAME from Anurag.SHARED,Anurag.SUBJECTS,Anurag.DEPARTMENT,Anurag.TRADES WHERE SHARED.PUID='"
			+rs.getString("UID")+"' AND SHARED.TYPE='Link' AND SHARED.TCODE=TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT AND Anurag.SHARED.SUB_CODE=Anurag.SUBJECTS.CODE";
ResultSet pt=stmt.executeQuery(l);
while(pt.next()){%>
												<tr>
													<td colspan="1"><%=pt.getString("TOPIC")+" ("+pt.getString("SUB_NAME")+")" %></td>
													<td colspan="1"><%=pt.getString("DEPT_NAME")+" "+pt.getString("SEM")+" Sem" %></td>
													<td colspan="4"><%=pt.getString("LINK") %></td>
												</tr>
												<% }%>

											</table>
										</ul>
									</ul>

								</div></td>
						</tr>
					</table>
				</div>


				<li class="section"><h3></h3></li>
				<br>
				<div id="panel">
					<ul id="accordion">

						<li>&plusmn &nbsp Request/ Leave Application</li>
						<ul>
							<div id="returnMsg"></div>
							<table width="90%" align="center">

								<tr bgcolor="#63B8FF">
									<td colspan="2"><label class="desc">Connect</label></td>
								</tr>

								<tr>
									<td clospan="2"><label>Create : </label> <input
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
										<div id="dispTo"
											style="position: absolute; width: 45%; z-index: 999;"></div>
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

											<input id="iButton" name="" type="submit" value="Send" />
										</div></td>
								</tr>
							</table>

						</ul>

						<li>&plusmn &nbsp Received Queries / Requests Status<span
							class="req"> New</span></li>
						<ul>
							<jsp:include page="reqAccord.jsp" />
						</ul>

						<li>&plusmn &nbsp My Queries / Requests<span class="req">
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
	
	$('#accordion > ul:eq(1)').show();
	$('#accordion > ul:eq(3)').show();
	$('#accordion > ul:eq(5)').show();

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