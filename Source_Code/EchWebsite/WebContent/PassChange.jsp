<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EIT- Password Change</title>
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
var validl=0;
    $("#newPass").live('keyup',function(){
    	var newp=$("#newPass").attr('value');
    	if(newp.length<6)
    	{
    	$("#newpMsg").html("INVALID : Minimum length required for new password is 5 characters").show();
		validl=0;
		}
    	else
    		{
    		$("#newpMsg").html("Ok : New Password seems to be fine.").show();
    		validl=1;
    		}
    	});
    
	
	
    $("#confPass").live('keyup',function(){
		var newp=$("#newPass").attr('value');
		var confp=$("#confPass").attr('value');
		if(newp!=confp)
			{$("#confMsg").html("Not Matching").show();
			valid=0;}
		else
			{$("#confMsg").html("Ok").show();
			valid=1;}
	});
	
	$("#savePass").click(function(){
		if(valid==1 && validl==1)
			{
			var uid=$("#uidp").attr('value');
			var oldp=$("#oldPass").attr('value');
			var newp=$("#newPass").attr('value');
			$.ajax({
			     url: "ChangePassword",
			     type: "post",
			     data: {uid:uid,oldp:oldp,newp:newp},
			     cache: false,
			     success: function(data){
			    	 alert(data);
			    	  $("#uidp").val("");
					  $("#oldPass").val("");
				      $("#newPass").val("");
			    	 }
			     });
			
			}
		else
			{
			alert("Invalid Details : Try Again");
			}
	});
});
</script>
</head>
<body id="public">
	<div id="container">

		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>
		<input id="uidp" type="hidden"
			value='<%=session.getAttribute("uid")%>'">
		<form class="formatA" action="" method="">
			<ul>
				<li class="complex"><span class="leftHalf">
						<div class="info">
							<h2>Change Password</h2>
						</div>
				</span></li>

				<li class="complex">
					<div id="retMsg"></div> <span class="fourCol"> <label
						class="desc">Old Password<span class="req">*</span></label>
				</span> <span class="leftHalf"> <input id="oldPass"
						class="field text medium" type="password" value="" name="oldPass" />
				</span>
				</li>
				<li class="complex"><span class="fourCol"> <label
						class="desc">New Password<span class="req">*</span></label>
				</span> <span class="leftHalf"> <input id="newPass"
						class="field text medium" type="password" name="newPass" value="" />
                <div id="newpMsg"></div>
				</span></li>
				<li class="complex"><span class="fourCol"> <label
						class="desc">Confirm Password<span class="req">*</span></label>
				</span> <span class="leftHalf"> <input id="confPass"
						class="field text medium" type="password" name="confPass" value="" />
					<div id="confMsg"></div>
				</span></li>

				<li class="complex"><span class="fourCol"></span> <span
					class="fourCol"> <input id="savePass" class="btTxt"
						type="button" value="Submit" style="width: 100%" />
				</span></li>

			</ul>
		</form>
	</div>
</body>
</html>