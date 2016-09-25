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
<link rel="stylesheet" href="css/header.css" type="text/css"/>
<link rel="stylesheet" href="css/mytable.css" type="text/css"/>

<!-- JavaScript -->

<script type="text/javascript" src="scripts/anurag.js"></script>
<script type="text/javascript" src="scripts/menu.js"></script>
<script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
	
	$("#sent").hide();
	
	$("#setpb").click(function(){
			{
			var email=$("#email").attr('value');
			$.ajax({
			     url: "ResetPass",
			     type: "post",
			     data: {email:email},
			     cache: false,
			     success: function(data){
			    	  alert(data);
			    	 }
			     });
			
			$("#notSent").slideUp();
			$("#sent").slideDown();
			}
        });
	
	$("#resend").click(function(){
		{
		var email=$("#email").attr('value');
		$.ajax({
		     url: "ResetPass",
		     type: "post",
		     data: {email:email},
		     cache: false,
		     success: function(data){
		    	  alert(data);
				  $("#email").val("");
		    	 }
		     });
		}
       });
	
	  });
</script>
<link href='http://fonts.googleapis.com/css?family=Julius+Sans+One|Quantico|Ruthie|Shojumaru'
	rel='stylesheet' type='text/css'/>
</head>
<body id="public">
	<div id="container">

		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>
		
		<form class="formatA">
		
		<div id="notSent">
			<ul>
				<li class="complex"><span class="leftHalf">
						<div class="info">
							<h2>Set New Password</h2>
						</div>
				</span></li>

				<li class="complex">
					<div id="retMsg"></div> <span class="fourCol"> <label
						class="desc">Email :<span class="req">*</span></label>
				</span> <span class="leftHalf"> <input id="email"
						class="field text medium" type="email" value="" name="email" />
				</span>
				</li>
				
				<li>
					<h4>Note :</h4> Please enter above your email id, as is registered with us. If found valid, we
					will send your new temporary password on this id, which you may later change
					for further use.
				</li>

				<li class="complex"><span class="fourCol"></span> <span
					class="fourCol"> <input id="setpb" class="btTxt"
						type="button" value="Submit" style="width: 100%" />
				</span></li>
</ul>
</div>
			
<div id="sent">
<table width="100%">
<tr><th colspan="2">
SUCCESS : Your temporary password has been sent to the Email ID provided by you. Please Check your Email.<br>
NOTE : Above Email Id need to be registered with us for successful procedure of changing password.
</th>
</tr>
<tr>
<th width="70%">In case you have not received password details yet : </th>
<td bgcolor="#c0c0c0"><div id="resend" style="width:100%"> SEND AGAIN  </div></a></td>
</tr>
<tr>
<th> In case you want to try again with new email id : </th>
<td bgcolor="#ffc8344a"><a href="PassForgot.jsp"><div style="width:100%"> TRY AGAIN  </div></a></td>
</tr>
</table>
</div>
		</form>
	</div>
</body>
</html>