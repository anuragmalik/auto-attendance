

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.Connect;

/**
 * Servlet implementation class ShareData
 */
@WebServlet("/ShareData")
public class ShareData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareData() {
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
		String typ=request.getParameter("type");
		String type="";
		if(typ.equals("1")) {type="Link";} else {type="Note";}
		String sub=request.getParameter("sub");
		String topic=request.getParameter("topic");
		String link=request.getParameter("link");
		String trade=request.getParameter("trade");
		String uid=request.getParameter("tuid");
		try{
		Connection con=Connect.database();
		Statement st=con.createStatement();
		String qry="INSERT INTO Anurag.SHARED (TOPIC,TCODE,LINK,PUID,TYPE,SUB_CODE) VALUES ('"+topic+"','"+trade+"','"+link+"','"+uid+"','"+type+"','"+sub+"')";
		st.executeUpdate(qry);
		
		response.getWriter().println(type + " successfully shared.");
		}
		catch (Exception e) {
			response.getWriter().println("Error occured : "+ type + " not shared. \n Try Again");
		}
	}

}
