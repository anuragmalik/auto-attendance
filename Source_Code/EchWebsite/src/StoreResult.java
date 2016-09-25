

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
 * Servlet implementation class StoreResult
 */
@WebServlet("/StoreResult")
public class StoreResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreResult() {
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
		// TODO Auto-generated method stub
		String tcode=request.getParameter("tcode");
		String code="R"+tcode.substring(1);
		String link=request.getParameter("link");
		String date=mypkg.date.now();
		try{
		Connection con=Connect.database();
		Statement st=con.createStatement();
		String res="Update Anurag.TESTS SET (TOPIC,DESC,DATE)=('Updated','"+link+"','"+date+"') WHERE TESTNO='"+code+"'";
		st.executeUpdate(res);
	
		
		response.getWriter().println("Results successfully updated for test code -"+tcode);
		}
		catch (Exception e) {
			response.getWriter().println("Error occured : Please try Again");
		}
	}

}
