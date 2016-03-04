
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.Connect;
import mypkg.Password;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/AndroidLogin")
public class AndroidLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass="";
		try {
			pass = Password.encrypt(request.getParameter("password")).trim();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		PrintWriter out=response.getWriter();
		try{
		Connection con=Connect.database();
	     Statement st = con.createStatement();
	 	  String query="SELECT * FROM Anurag.STUDENT WHERE EMAIL='"+email+"'AND PASSWORD='"+pass+"'";
		ResultSet rs=st.executeQuery(query);
			if(rs.next())
			{
				out.println(rs.getString("SUID"));
			}
			else
				{out.println("Invalid");
			}}
		catch(Exception e){}
	}

}
