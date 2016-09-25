
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="mypkg.Connect"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update User Profile</title>

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

<!-- JavaScript -->

<script type="text/javascript" src="scripts/anurag.js"></script>
<script type="text/javascript" src="scripts/menu.js"></script>
<script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Julius+Sans+One|Quantico|Ruthie|Shojumaru'
	rel='stylesheet' type='text/css'>

<script type="text/javascript">

var val=0;
$(document).ready(function(){
	var uid=$("#uidp").attr('value');
	if(uid.charAt(0)=='S'){val=2;}
	if(uid.charAt(0)=='A' || uid.charAt(0)=='P') {val=1;}
	hideElem(val);
});

function hideElem(val)
{
   if(val==0)
    {
    document.getElementById('dispform').style.display='none';
    document.getElementById('dispSel').style.display='inline';
    }
    else
{
    document.getElementById('dispform').style.display='inline';
    document.getElementById('dispSel').style.display='none'; 
  
   if(val==1)
    {
    document.getElementById('hide4pro').style.display='none';
    document.getElementById('hide4stud').style.display='inline';
    }
    if(val==2)
    { 
   document.getElementById('hide4stud').style.display='none';
   document.getElementById('hide4pro').style.display='inline';
    }
}
} 
</script>
</head>


<body id="public">
	<div id="container">
		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>
		<form class="formatA" action="UpdatePro" method="post">
			<% String uid=session.getAttribute("updUid").toString(); %>
			<input id="uidp" type="hidden" value='<%=uid%>'">
			<%
Connection con=Connect.database();
Statement st=con.createStatement();
String q;
if(uid.charAt(0)=='S'){q="SELECT NAME FROM Anurag.STUDENT WHERE SUID='"+uid+"'";}
else {q="SELECT NAME FROM Anurag.PROF_ADMIN WHERE UID='"+uid+"'";}
ResultSet rs=st.executeQuery(q);
rs.next();
%>

			<div class="info">
				<h2>Update Profile</h2>
			</div>
			<div id="dispSel">
				<h2>Unauthorized Access : Administrator must select a User from
					Search Page.</h2>
			</div>
			<table width="100%" id="dispform">
				<tr>
					<th bgcolor="#c0c0c0">Update Details for <%=rs.getString("NAME")%>
						:
					</th>
				</tr>
				<tr>
					<td>
						<ul>
							<li class="complex"><span class="fourCol"> <label
									class="desc">Name</label>
							</span> <span class="leftHalf"> <label class="desc">Full
										Name</label> <input class="field text large" type="text" value=""
									name="name" />
							</span></li>

							<li class="complex"><span class="fourCol"> <label
									class="desc">Father's Name</label>
							</span> <span class="leftHalf"> <input class="field text large"
									type="text" value="" />
							</span></li>


							<li class="complex"><span class="fourCol"> <label
									class="desc">Date of Birth</label>
							</span> <span class="threeCol"> <input class="field text medium"
									size="2" type="text" maxlength="2" value="" name="dob" /> <label>Mon
										DD, YYYY</label>
							</span> <span class="threeCol"> <label class="desc">Gender</label>
									<input id="male" name="gender" type="radio" value="male"
									checked="checked" /> Male <input id="female" name="gender"
									type="radio" value="female" /> Female
							</span></li>

							<div id="hide4pro">
								<li class="complex"><span class="fourCol"> <label
										class="desc">Fee Paid</label>
								</span> <span class="threecol"> <input class="field text medium"
										type="text" maxlength="15" value="0" name="feePaid" /> <label>in
											Rs.</label>
								</span> <span class="fourCol"> <label class="desc">Concessions</label>
								</span> <span class="threecol"> <input class="field text medium"
										type="text" maxlength="15" value="0" name="cons" /> <label>in
											Rs.</label>
								</span></li>
							</div>

							<div id="hide4stud">
								<li class="complex"><span class="fourCol"> <label
										class="desc">Qualification</label>
								</span> <span class="leftHalf"> <input class="field text medium"
										type="text" maxlength="20" value="" name="qual" /> <label>Degree
											/ University</label>
								</span></li>
								<li class="complex"><span class="fourCol"> <label
										class="desc">Designation :</label>
								</span> <span class="threeCol"> <select
										class="field select addr" name="dept">
											<option value="" selected="selected"></option>
											<option value="CSE">CSE</option>
											<option value="ECE">ECE</option>
											<option value="ME">ME</option>
											<option value="IT">IT</option>
									</select> <label>Department</label>
								</span> <span class="threeCol"> <select
										class="field select addr" name="desig">
											<option value="" selected="selected"></option>
											<option value="teacher">Teacher</option>
											<option value="prof">Professor</option>
											<option value="admin">Administrator</option>
									</select> <label>Designation</label>
								</span></li>
							</div>


							<li class="complex"><span class="fourCol"> <label
									class="desc">Contact Details<span class="req">*</span></label>
							</span> <span> <input class="field text" type="text" size="11"
									maxlength="10" value="0" name="mobno" /> <label>Mobile</label>
							</span> <span class="rightHalf"> <input class="field text large"
									type="" maxlength="255" placeholder="example@gmail.com"
									value="" name="email" /> <label>Email-Id</label>
							</span></li>

							<li class="complex"><label class="desc">Address<span
									class="req">*</span></label>

								<div>
									<span class="full"> <textarea
											class="field textarea medium" rows="15" cols="30" name="addr"></textarea>
										<label>Street Address</label>
									</span> <span class="left"> <input class="field text addr"
										type="text" value="" name="city" /> <label>City</label>
									</span> <span class="right"> <input class="field text addr"
										type="text" value="" name="state" /> <label>State /
											Province / Region</label>
									</span> <span class="left"> <input class="field text addr"
										type="text" maxlength="15" value="0" name="postal" /> <label>Postal
											/ Zip Code</label>
									</span> <span class="right"> <select class="field select addr">
											<option value=""></option>
											<option value="India" selected="selected">India</option>
									</select> <label>Country</label>
									</span>

								</div></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						<ul>

							<li class="complex"><span class="fourCol"> <label
									class="desc">Guardian Name :</label>
							</span> <span class="leftHalf"> <input class="field text large"
									type="text" value="" name="gname" /> <label>Full Name</label>
							</span></li>
							<li class="complex"><span class="fourCol"> <label
									class="desc">Contact Details<span class="req">*</span></label>
							</span> <span> <input class="field text" type="text" size="11"
									maxlength="10" value="0" name="gmobno" /> <label>Mobile</label>
							</span> <span class="rightHalf"> <input class="field text large"
									type="" maxlength="255" placeholder="example@gmail.com"
									value="" name="gemail" /> <label>Email-Id</label>
							</span></li>

							<br>
							<li class="complex"><span class="fourCol"></span> <span
								class="fourCol"></span> <span class="fourCol"> <input
									id="saveForm" class="btTxt" type="submit" value="Update"
									style="width: 100%" />
							</span></li>
						</ul>
					</td>
				</tr>
			</table>
			<table width="50%">
				<tr>
					<th><a href="SearchUser.html"><div style="width: 100%;"
								align="center">Go Back</div></a></th>
					<th><a href="Home.jsp"><div style="width: 100%;"
								align="center">Go to Homepage</div></a></th>
				</tr>
			</table>


		</form>
	</div>
</body>
</html>