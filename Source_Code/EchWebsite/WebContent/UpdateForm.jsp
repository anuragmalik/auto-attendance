<%@page import="mypkg.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Echelon Institute Of Tech.</title>


<!-- Meta Tags -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<script type="text/javascript">
$(document).ready(function(){
	var msg="";
	var valid;
	$("#update").click(function(){
		msg="";
		valid=0;
		var name=$("#uname").attr('value').trim();
		var dob=$("#dob").attr('value').trim();
		var mobno=$("#mobno").attr('value').trim();
		var email=$("#email").attr('value').trim();
		var addr=$("#addr").attr('value').trim();
		var gname=$("#gname").attr('value').trim();
		var gmob=$("#gmobno").attr('value').trim();
		var gemail=$("#gemail").attr('value').trim();
		var admin=$("#admin").attr('value').trim();
		
		if(name.length!=0) {msg+="\nName - "+name;}
		if(dob.length!=0) {msg+="\nDOB - "+dob;}
		if(mobno.length!=0) {msg+="\nMobile No. - "+mobno;}
		if(email.length!=0) {msg+="\nEmail - "+email;}
		if(addr.length!=0) {msg+="\nAddress - "+addr;}
	    if(gname.length!=0) {msg+="\nGuardians Name - "+gname;}
		if(gmob.length!=0) {msg+="\nGuardians Mob No. - "+gmob;}
		if(gemail.length!=0) {msg+="\nGuardians Email - "+gemail;}
		if(admin.length!=0 && msg.length!=0) {valid=1;}
		if(valid==1){	
		if(confirm("A request will be generated for following updates in your profile :\n"+msg+"\nYou can see the status of this request in your profile.\nProceed, Send request to "+admin+" ?"))
				{
			     var adm=admin.trim();
		         var subs="Profile Update Request"; 
		         var msgs="Please Update following details in my profile"+msg;
		         $.ajax({
		             url: "GenRequest",	
		             type: "post",
		             data: {to:adm,sub:subs,msg:msgs.trim()},
		             cache: false,
		             success: function(data) {
		             alert(data);

		             }
		             });
				}
		}
		else
			{alert("Error : Please make sure to fill correct details.");}
	});
});
</script>

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

		<form class="formatA">


			<div class="info">
				<h2>Update Profile</h2>
			</div>

			<table width="100%" id="dispform">
				<tr>
					<th bgcolor="#c0c0c0">Your Current Profile Details :</th>
				</tr>
				<tr>
					<td>
						<div id="panel">
<%
Connection con=Connect.database();
Statement st=con.createStatement();
ResultSet rs=st.getResultSet();
if(session.getAttribute("uid").toString().charAt(0)=='S') 
{
rs=st.executeQuery("SELECT * FROM Anurag.STUDENT,Anurag.DEPARTMENT,Anurag.TRADES WHERE SUID='"+session.getAttribute("uid")+"' AND Anurag.STUDENT.TCODE=Anurag.TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT");
}
else 
{
rs=st.executeQuery("SELECT * FROM Anurag.PROF_ADMIN,Anurag.DEPARTMENT WHERE UID='"+session.getAttribute("uid")+"' AND Anurag.PROF_ADMIN.DEPT=Anurag.DEPARTMENT.DEPT");
	}
rs.next();

%>
							<font size="3px"> Name - <%=rs.getString("NAME")%><br>
								Contact - <%=rs.getString("MOBNO")%><br> Email - <%=rs.getString("EMAIL")%><br>
								Address - <%=rs.getString("ADDR")%>,<%=rs.getString("CITY")%>,<%=rs.getString("STATE")%><br>
								Date of Birth -<%=rs.getString("DOB")%><br> 
								<% if(session.getAttribute("uid").toString().charAt(0)=='S')
								{ %>
								Guardian Name -<%=rs.getString("GUARDIAN")%><br>
								Guardian Email-<%=rs.getString("G_EMAIL")%><br> Guardian
								Contact Num -<%=rs.getString("G_MOBNO")%><br>
								<% } else { %> 
								Qualification -<%=rs.getString("QUALIFICATION")%><br>
								Department-<%=rs.getString("DEPT_NAME")%><br> 
								<%} %>
								 <br>
							</font>
						</div>
					</td>
				</tr>
				<tr>
					<th bgcolor="#c0c0c0">Fill New Details Here :</th>
				</tr>
				<tr>
					<td>
						<div id="repMsg"></div>
						<ul>
							<li class="complex"><span class="fourCol"><label
									class="desc">Your Name :</label></span> <span class="leftHalf">
									<label class="desc">Full Name</label> <input
									class="field text large" type="text" value="" id="uname" />
							</span></li>

							<li class="complex"><span class="fourCol"> <label
									class="desc">Date of Birth</label>
							</span> <span class="fourCol"> <input class="field text medium"
									type="text" maxlength="10" id="dob" /><label>DD-MM-YYYY</label>
							</span></li>

							<li class="complex"><span class="fourCol"> <label
									class="desc">Contact Details<span class="req">*</span></label>
							</span> <span class="fourCol"> <input class="field text medium"
									type="text" size="11" maxlength="10" id="mobno" /> <label>Mobile</label>
							</span> <span class="rightHalf"> <input class="field text large"
									type="text" maxlength="255" placeholder="example@gmail.com"
									id="email" /> <label>Email-Id</label>
							</span></li>

							<li class="complex"><span class="fourCol"> <label
									class="desc">Address</label>
							</span> <span class="leftHalf"> <textarea id="addr" rows="15"
										cols="30" class="field textarea medium"></textarea>
							</span>
								</div></li>
						</ul>

					</td>
				</tr>
				<tr>
					<td>

						<ul>
						<% if(session.getAttribute("uid").toString().charAt(0)=='S')
								{ %>
								<li class="complex"><span class="fourCol"> <label
									class="desc">Guardian Name :</label>
							</span> <span class="leftHalf"> <input class="field text large"
									type="text" value="" id="gname" /> <label>Full Name<span
										class="req">*</span></label>
							</span></li>

							<li class="complex"><span class="fourCol"> <label
									class="desc">Contact Details<span class="req">*</span></label>
							</span> <span> <input class="field text" type="text" size="11"
									maxlength="10" value="" id="gmobno" /> <label>Mobile</label>
							</span> <span class="rightHalf"> <input class="field text large"
									type="email" maxlength="255" placeholder="example@gmail.com"
									value="" id="gemail" /> <label>Email-Id</label>
							</span></li>
								<% } else { %> 
								<li class="complex"><span class="fourCol"> <label
									class="desc">Qualification :</label>
							</span> <span class="leftHalf"> <input class="field text large"
									type="text" value="" id="gname" /> <label>Degree / University / Year
									<span class="req">*</span></label>
							</span></li>
								<%} %>
							

							<li class="complex"><span class="fourCol">Send To :</span> <span
								class="fourCol"><input class="field text large" type=""
									maxlength="255" placeholder="Admin Name" value="" id="admin" />
									<label>Administrator</label></span></li>
							<li class="complex"><span class="fourCol"> <input
									id="update" class="btTxt" type="button" value="Update"
									style="width: 100%" />
							</span></li>

						</ul>
					</td>
				</tr>
			</table>


		</form>
	</div>
</body>


</html>