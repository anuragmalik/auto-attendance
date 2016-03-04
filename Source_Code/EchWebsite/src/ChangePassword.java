

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypkg.Connect;
import mypkg.Password;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			String uid=request.getParameter("uid").trim();
		String newpass=request.getParameter("newp").toString().trim();
		String oldp=Password.encrypt(request.getParameter("oldp").toString().trim());
		String newp=Password.encrypt(newpass);
		String q;
		ResultSet rt;
		
		    Connection con=Connect.database();
			Statement st=con.createStatement();
			if(uid.charAt(0)=='S')
			{
				q="SELECT PASSWORD FROM Anurag.STUDENT WHERE suid like'%"+uid+"%'";
				rt=st.executeQuery(q);
				rt.next();
				if(rt.getString("PASSWORD").trim().equals(oldp))
				{
					q="UPDATE Anurag.STUDENT SET PASSWORD='"+newp+"' WHERE suid like '%"+uid+"%'";
					st.executeUpdate(q);
					response.getWriter().print("Password Succesfully Changed");
				}
				else
				{response.getWriter().print("<h2>Invalid Details : Try Again</h2>");}
			}
			else
			{
				q="SELECT PASSWORD FROM Anurag.PROF_ADMIN WHERE uid like'%"+uid+"%'";
				rt=st.executeQuery(q);
				rt.next();
				if(rt.getString("PASSWORD").trim().equals(oldp))
				{
					q="UPDATE Anurag.PROF_ADMIN SET PASSWORD='"+newp+"' WHERE uid like '%"+uid+"%'";
					st.executeUpdate(q);
					if(uid.charAt(0)=='A')
					{q="UPDATE Anurag.ADMIN SET PASSWORD ='"+newp+"' WHERE uid like '%"+uid+"%'";
					st.executeUpdate(q);}
					
					response.getWriter().print("Password Succesfully Changed");
				}
				else
				{response.getWriter().print("Invalid Details");}
			}
			} catch (Exception e) {
				response.getWriter().print("Error Occured : Try Again");
			e.printStackTrace();
		}
	}

}
