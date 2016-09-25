

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpSession;

import mypkg.Connect;
/**
 * Servlet implementation class EmailServer
 */
@WebServlet("/EmailServer")
public class EmailServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailServer() {
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
			String dest=request.getParameter("to");
			 String query="SELECT EMAIL FROM Anurag.PROF_ADMIN WHERE NAME='"+dest+"'";
			 String to_id;

			 Connection con=Connect.database();
			 Statement st=con.createStatement();
			 ResultSet rs=st.executeQuery(query);
			 rs.next();
			 to_id=rs.getString("EMAIL");
			 String sub=request.getParameter("sub");
			 String message=request.getParameter("msg");
			 
			 request.setAttribute("to",new String(to_id));
			 request.setAttribute("sub",new String(sub));
			 request.setAttribute("msg",new String(message));
			 request.setAttribute("reqFrom",new String("Other"));
			 RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/email.jsp");
			 rd.forward(request,response);
			 
			 response.getWriter().println("Email Sent To "+dest+"<br>Sub"+sub+"<br>Msg"+message);
		} catch (Exception e) {
			response.getWriter().println("Error Occured : Email NOT sent, Please try again");
		}
	}

}
