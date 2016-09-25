<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Echelon Institute of Tech.</title>

<!--google chart -->



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


		<script type="text/javascript">
$(document).ready( function(){
	 var res=$("#uid").attr('value');
     $.ajax({
     url: "AttChart",
     type: "post",
     data: {uid:res},
     cache: false,
     success: function(data) {
    	 $("#chartAreaW").html(data).show();
    	 }
     });
     
     $.ajax({
         url: "AttChartMonth",
         type: "post",
         data: {uid:res},
         cache: false,
         success: function(data) {
        	 $("#chartAreaM").html(data).show();
        	 }
         });
     
     $.ajax({
         url: "AttChartSem",
         type: "post",
         data: {uid:res},
         cache: false,
         success: function(data) {
        	 $("#chartAreaS").html(data).show();
        	 }
         });
});
    </script>





		<link
			href='http://fonts.googleapis.com/css?family=Julius+Sans+One|Quantico|Ruthie'
			rel='stylesheet' type='text/css'>
</head>
<body id="public">
	<div id="container">
		<input id='uid' type='hidden'
			value='<%=session.getAttribute("uid") %>'>
			<form class="formatA" action="" method="">
				<div class="info">
					<h2>Attendence Report</h2>
				</div>

				<ul>

					<li class="section first"><h3></h3></li> Welcome User,

					<div id="chartAreaW"></div>
					<div id="chartAreaM"></div>
					<div id="chartAreaS"></div>
				</ul>
			</form>
	</div>
</body>


</html>