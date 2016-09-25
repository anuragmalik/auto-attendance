<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="mypkg.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>EIT - Notifications</title>
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
	var sender;
	var dest;
	var note;
	var sub;
	
	$("#public").click(function(){
		if($("#toall").is(':checked'))
			{
			$("#admin").attr('checked',false);
			$("#prof").attr('checked',false);
			$("#stud").attr('checked',false);
			}
		
		if($("#all").is(':checked'))
		{
		$("#cse").attr('checked',false);
		$("#ece").attr('checked',false);
		$("#me").attr('checked',false);
		$("#it").attr('checked',false);
		}
	});
	
	$("#noteb").live('click',function(){
		sender=$("#tuid").attr('value');
		note=$("#notem").attr('value');
		sub=$("#notes").attr('value');
		
		dest="";
		 if($("#toall").is(':checked'))
		 {dest="all";}
		 else
			 {
			 if($("#admin").is(':checked')){dest +="a";}
			 if($("#prof").is(':checked')){dest +="t";}	 
			 if($("#stud").is(':checked')){dest +="s";}
			 dest+="#";
			 }
		 if($("#all").is(':checked')){dest +="dpt";}
		 else{
			 if($("#cse").is(':checked')){dest +="c";}
			 if($("#ece").is(':checked')){dest +="e";}
			 if($("#me").is(':checked')){dest +="m";}
			 if($("#it").is(':checked')){dest +="i";}		 
			 }
		 
		 $.ajax({
		     url: "Notifier",	
		     type: "post",
		     data: {creator:sender,sub:sub,msg:note,dest:dest,type:"Gen"},
		     cache: false,
		     success: function(data) {
		     $("#notes").val('');
		     $("#notem").val('');
		     $("#noteResult").html(data).slideDown();
		     }
		     });

		
	});
});

</script>
		<link
			href='http://fonts.googleapis.com/css?family=Julius+Sans+One|Quantico|Ruthie|Shojumaru'
			rel='stylesheet' type='text/css'>
</head>
<jsp:include page="Header.jsp" />
<% if (session.getAttribute("loggedin").equals("ADMIN")) { %>
<body id="public">
	<div id="container">
		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>
		<form class="formatA">

			<div class="info">
				<h2>Create Notification</h2>
			</div>

			<%
String uid=session.getAttribute("uid").toString().trim();
%>
			<input type="hidden" id="tuid" value='<%=uid %>' />
			<div id="noteResult"></div>
			<ul>
				<li class="complex"><span class="fourCol"><label
						class="desc">To :</label> </span>
					<div>
						<span><input id="toall" class="field checkbox"
							type="checkbox" value="1" checked="checked" /> <label
							class="choice">All</label></span> <span><input id="admin"
							class="field checkbox" type="checkbox" value="2" /> <label
							class="choice">Administrators</label></span> <span><input
							id="prof" class="field checkbox" type="checkbox" value="3" /> <label
							class="choice">Teachers </label></span> <span><input id="stud"
							class="field checkbox" type="checkbox" value="4" /> <label
							class="choice">Students</label></span>
					</div></li>

				<li class="complex"><span class="fourCol"><label
						class="desc">Department :</label> </span>
					<div>

						<span> <input id="all" class="field checkbox"
							type="checkbox" value="1" checked="checked" /> <label
							class="choice">All</label></span> <span><input id="cse"
							class="field checkbox" type="checkbox" value="1" /> <label
							class="choice">CSE &nbsp</label></span> <span><input id="ece"
							class="field checkbox" type="checkbox" value="2" /> <label
							class="choice">ECE &nbsp</label></span> <span><input id="me"
							class="field checkbox" type="checkbox" value="3" /> <label
							class="choice">ME &nbsp</label></span> <span><input id="it"
							class="field checkbox" type="checkbox" value="4" /> <label
							class="choice">IT &nbsp</label></span>
					</div></li>


				<li class="complex"><span class="fourCol"> <label
						class="desc">Subject<span class="req">*</span>:
					</label>
				</span> <span class="threeCol"> <input id="notes"
						class="field text large" type="text" value="" /><label>Subject
							Line </label>
				</span></li>

				<li class="complex"><span class="fourCol"> <label
						class="desc">Message<span class="req">*</span></label>
				</span>
					<div>
						<span class="left"> <textarea id="notem" rows="20"
								cols="50" class="field textarea medium"
								placeholder="Your Message Here"></textarea>
						</span>
					</div></li>

				<li class="complex"><span class="fourCol"> <label
						class="desc">Urgency :</label>
				</span> <span class="fourCol"> <select id="noteu"
						class="field select" style="width: 100%">
							<option value="default">Default</option>
							<option value="imp">Important</option>
							<option value="urg">Urgent</option>
					</select>
				</span></li>
				<br>
					<li class="complex"><span class="fourCol"></span> <span
						class="fourCol"></span> <span class="fourCol"> <input
							id="noteb" type="button" value="Send" style="width: 100%" />
					</span></li>
			</ul>

		</form>
	</div>
</body>
<% } else {%>
<jsp:forward page="Error.jsp" />
<%} %>
</html>