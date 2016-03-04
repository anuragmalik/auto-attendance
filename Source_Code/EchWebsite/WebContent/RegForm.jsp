
<%@page import="mypkg.GenerateUID"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>EIT- Registration</title>


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
<script type="text/javascript">
$(document).ready(function(){
	var valid=0;
	$("#saveForm").live('click',function(){
		$("#subform").submit();
	});
});
</script>
<script type="text/javascript">
window.onload = function ()
{hideElem(0);}
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
<jsp:include page="Header.jsp" />

<% if (session.getAttribute("loggedin").equals("ADMIN")) { %>
<body id="public">
	<div id="container">
		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>
		<form class="formatA" id="subform" action="Register" method="POST">
			<ul>
				<li class="complex"><span class="leftHalf">
						<div class="info">
							<h2>Registration Form</h2>
						</div>
				</span> <span class="threeCol"> <select
						onchange="hideElem(this.value);" name="reg_of">
							<option value="0" selected="selected">Select User</option>
							<option value="1">Professor / Admin</option>
							<option value="2">Student</option>
					</select>
				</span></li>
				<li>
					<div id="dispSel" style="width: 100%;" 100%;"" align="center">
						<h3>Please Select user from above</h3>
					</div>
				</li>
			</ul>
			<table width="100%" id="dispform">
				<tr>
					<th bgcolor="#c0c0c0">Personal Details</th>
				</tr>
				<tr>
					<td>

						<ul>
							<li class="complex"><span class="fourCol"> <label
									class="desc">Title</label> <input id="mister" name="title"
									type="radio" value="mister" /> Mr. <input id="misses"
									name="title" type="radio" value="misses" /> Mrs.
							</span> <span class="threeCol"> <label class="desc">First
										Name<span class="req">*</span>
								</label> <input id="fn" class="field text large" type="text" value=""
									name="first" />
							</span> <span class="threeCol"> <label class="desc">Last
										Name</label> <input id="ln" class="field text large" value=""
									name="last" />
							</span></li>

							<li class="complex"><span class="fourCol"> <label
									class="desc">Father's Name<span class="req">*</span></label>
							</span> <span class="leftHalf"> <input id="fan"
									class="field text large" type="text" value="" />
							</span></li>


							<li class="complex"><span class="fourCol"> <label
									class="desc">Date of Birth<span class="req">*</span></label>
							</span> <span> <input id="mm" class="field text" size="2"
									type="text" maxlength="2" value="" name="mm" /> /<label>MM</label>
							</span> <span> <input id="dd" class="field text" size="2"
									type="text" maxlength="2" value="" name="dd" /> /<label>DD</label>
							</span> <span> <input id="datepicker" class="field text" size="4"
									type="text" maxlength="4" value="" name="yyyy" /><label>YYYY</label>
							</span> <span class="rightHalf"> <label class="desc">Gender<span
										class="req">*</span></label> <input id="male" name="gender"
									type="radio" value="male" checked="checked" /> Male <input
									id="female" name="gender" type="radio" value="female" /> Female
							</span></li>

							<div id="hide4pro">
								<li class="complex"><span class="fourCol"> <label
										class="desc">Course Applied for :<span class="req">*</span></label>
								</span> <span class="threeCol"> <select
										class="field select addr">
											<option value="" selected="selected"></option>
											<option value="BE">BE</option>
											<option value="BTech">BTech</option>

									</select> <label>Major</label>
								</span> <span class="threeCol"> <select
										class="field select addr" name="trade">
											<option value="" selected="selected"></option>
											<option value="CSE">CSE</option>
											<option value="ECE">ECE</option>
											<option value="ME">ME</option>
											<option value="IT">IT</option>
									</select> <label>Trade</label>
								</span></li>
								<li class="complex"><span class="fourCol"> <label
										class="desc">Fee Paid</label>
								</span> <span class="threecol"> <input class="field text medium"
										type="text" maxlength="15" value="" name="feePaid" /> <label>in
											Rs.</label>
								</span> <span class="fourCol"> <label class="desc">Concessions</label>
								</span> <span class="threecol"> <input class="field text medium"
										type="text" maxlength="15" value="" name="cons" /> <label>in
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
										class="desc">Designation :<span class="req">*</span></label>
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
									maxlength="10" value="" name="mobno" /> <label>Mobile</label>
							</span> <span class="rightHalf"> <input class="field text large"
									type="" maxlength="255" placeholder="example@gmail.com"
									value="" name="email" /> <label>Email-Id</label>
							</span></li>

							<li class="complex"><label class="desc">Address<span
									class="req">*</span></label>

								<div>
									<span class="full"> <input class="field text addr"
										type="text" value="" name="addr1" /> <label>Street
											Address</label>
									</span> <span class="full"> <input class="field text addr"
										type="text" value="" name="addr2" /> <label>Address
											Line 2</label>
									</span> <span class="left"> <input class="field text addr"
										type="text" value="" name="city" /> <label>City</label>
									</span> <span class="right"> <input class="field text addr"
										type="text" value="" name="state" /> <label>State /
											Province / Region</label>
									</span> <span class="left"> <input class="field text addr"
										type="text" maxlength="15" value="" name="postal" /> <label>Postal
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
					<th bgcolor="#c0c0c0">In Case Of Emergency We Should Contact</th>
				</tr>
				<tr>
					<td>
						<ul>

							<li class="complex"><span class="fourCol"> <label
									class="desc">Guardian Name :</label>
							</span> <span class="threeCol"> <input class="field text large"
									type="text" value="" name="gfname" /> <label>First Name<span
										class="req">*</span></label>
							</span> <span class="threeCol"> <input class="field text large"
									value="" name="glname" /> <label>Last Name</label>
							</span></li>
							<li class="complex"><span class="fourCol"> <label
									class="desc">Contact Details<span class="req">*</span></label>
							</span> <span> <input class="field text" type="text" size="11"
									maxlength="10" value="" name="gmobno" /> <label>Mobile</label>
							</span> <span class="rightHalf"> <input class="field text large"
									type="" maxlength="255" placeholder="example@gmail.com"
									value="" name="gemail" /> <label>Email-Id</label>
							</span></li>

							<br>
							<li class="complex"><span class="fourCol"></span> <span
								class="fourCol"></span> <span class="fourCol"> <input
									id="saveForm" type="submit" value="Submit" style="width: 100%" />
							</span></li>

						</ul>


						</form>


						</div>
</body>
<% } else {%>
<jsp:forward page="Error.jsp" />
<%} %>

</html>