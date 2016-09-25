

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import mypkg.*;

/**
 * Servlet implementation class GetSubjects
 */
@WebServlet("/GetSubjects")
public class GetSubjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSubjects() {
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
		String subjects="Valid";
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
	 	  String query="SELECT * FROM Anurag.PROF_ADMIN WHERE EMAIL='"+email
	 			  +"'AND PASSWORD='"+pass+"'AND (EMP_CODE ='P' OR EMP_CODE='T')";
		ResultSet rs=st.executeQuery(query);
			if(rs.next())
			{
				String PUID=rs.getString("UID");
				Statement st1=con.createStatement();
				String query1="SELECT SUB_NAME FROM Anurag.SUBJECTS WHERE UID='"+PUID+"'";
				ResultSet rs1=st1.executeQuery(query1);
				while (rs1.next())
				{
				subjects +="#"+rs1.getString("SUB_NAME");
				}
				out.println(subjects);
			}
			else
				{out.println("Invalid");
			}}
		catch(Exception e)
		{
			System.out.println("caught "+e);
		}
	}

}
