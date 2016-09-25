<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
	String to = (String) request.getAttribute("to");

	String host = "smtp.gmail.com";
	final String user = "echelon.project13@gmail.com";
	final String password = "echelon2013";
	String msg = (String) request.getAttribute("msg");
	String sub = (String) request.getAttribute("sub");

	Properties props = new Properties();
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.EnableSSL.enable", "true");
	props.setProperty("mail.smtp.socketFactory.class",
			"javax.net.ssl.SSLSocketFactory"); 
	props.setProperty("mail.smtp.socketFactory.port", "465");


	Session sessions = Session.getInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

	//Compose the message
	try {
		MimeMessage message = new MimeMessage(sessions);
		message.setFrom(new InternetAddress(user));
		message.addRecipient(Message.RecipientType.TO,
				new InternetAddress(to));
		message.setSubject(sub);
		message.setText(msg);

		//send the message
		Transport.send(message);

		System.out.println("message sent successfully...");

	} catch (MessagingException e) {
		e.printStackTrace();
	}
%>
<%
	if (request.getAttribute("reqFrom").equals("Register")) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration EIT</title>
<link rel="stylesheet" href="css/structure.css" type="text/css" />
<link rel="stylesheet" href="css/form.css" type="text/css" />
<link rel="stylesheet" href="css/theme.css" type="text/css" />
<link rel="stylesheet" href="css/header.css" type="text/css">
</head>
<body id="public">
	<div id="container">
		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>
		<div class="info">
			<h2>Registration Successfull</h2>
		</div>
		Dear Admin,<br> <br>A new user has been successfully
		registered with Echelon Institute Of Technology. User must check
		his/her Email ID
		<%=(to)%>
		for Login details.
		<table width="100%" align="center">
			<tr>
				<th bgcolor='#6495ED'><a href="RegForm.jsp"><div
							style="width: 100%;" align="center">Register New User</div></a></th>
				<th></th>
				<th bgcolor="#c0c0c0"><a href="Home.jsp"><div
							style="width: 100%;" align="center">Go to HomePage</div></a></th>
			</tr>
		</table>
	</div>
</body>
</html>
<%
		} else if(request.getAttribute("reqFrom").equals("ResetPass"))
		{
		 %>Temporary Password Details sent on Email ID :
<%=to %>
<% 
		}
	
	else  {
	%>
Email Succesfully Sent
<%
	}
%>

