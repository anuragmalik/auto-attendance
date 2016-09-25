

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendEmail
 */
@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String to=(String)request.getAttribute("to");
			//System.out.println(to);
			String host="smtp.gmail.com";
			final String user="echelon.project13@gmail.com";//change accordingly
			final String password="echelon2013";//change accordingly
			String msg=(String)request.getAttribute("msg");
			String sub=(String)request.getAttribute("sub");
			//String to="anuraginmdu@gmail.com";//change accordingly

			 //Get the session object
			 Properties props = new Properties();
			// props.put("mail.smtp.starttls.enable", "true");
			 props.put("mail.smtp.host",host);
			 props.put("mail.smtp.auth", "true");
			 //props.put("mail.smtp.port", "465");
			 props.put("mail.smtp.EnableSSL.enable","true");
			 props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
			 //props.setProperty("mail.smtp.socketFactory.fallback", "false");  
			 props.setProperty("mail.smtp.socketFactory.port", "465"); 
			 //props.put("mail.smtp.starttls.enable", "true");
			 
			 Session sessions = Session.getInstance(props,
			  new javax.mail.Authenticator() {
			    protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user,password);
			    }
			  });

			 //Compose the message
			  try {
			   MimeMessage message = new MimeMessage(sessions);
			   message.setFrom(new InternetAddress(user));
			   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			   message.setSubject(sub);
			   message.setText(msg);
			   
			  //send the message
			   Transport.send(message);

			   System.out.println("message sent successfully...");

			   } catch (MessagingException e) {e.printStackTrace();}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
