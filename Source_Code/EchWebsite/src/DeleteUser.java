

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.Connect;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String suid=request.getParameter("uid");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String suid=request.getParameter("uid");
		try{
		if(suid.charAt(0)=='S')
		{ Connection con=Connect.database();
		   Statement st=con.createStatement();
			String q="DELETE from Anurag.STUDENT where suid='"+suid+"'";
			st.executeUpdate(q);
			q="DELETE from Anurag.REQUESTS where FROM='"+suid+"'";
			st.executeUpdate(q);
			response.getWriter().print("Succesfully Deleted User, his/ her associated Queries and requests.");}
		else 
			response.getWriter().print("No Acti on Taken : Unauthorized to delete teachers and admins.");
		
		//System.out.println("In Delete User");
		}
		catch(Exception e)
		{response.getWriter().print("Error Occured");}
		
	}

}
