

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
import mypkg.counter;

/**
 * Servlet implementation class CreateTest
 */
@WebServlet("/CreateTest")
public class CreateTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTest() {
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
		String topic=request.getParameter("topic");
		String desc=request.getParameter("desc");
		String date=request.getParameter("date");
		String subt=request.getParameter("subj");
		String trade=request.getParameter("trade");
		String uidp=request.getParameter("prof");
		try{
		Connection con=Connect.database();
		int testno=counter.getset_ctr("Test");
		Statement st=con.createStatement();
		String tes="INSERT INTO Anurag.TESTS (TESTNO,TOPIC,DESC,DATE,PUID,TRADE,SUBC,TYPE) VALUES ('"+"T"+testno+"','"+topic+"','"+desc+"','"+date+"','"+uidp+"','"+trade+"','"+subt+"','Test')";
		st.executeUpdate(tes);
		String res="INSERT INTO Anurag.TESTS (TESTNO,TOPIC,DESC,DATE,PUID,TRADE,SUBC,TYPE) VALUES ('"+"R"+testno+"','Pending','- - -','- - -','"+uidp+"','"+trade+"','"+subt+"','Res')";
		st.executeUpdate(res);
		String su="SELECT SUB_NAME from Anurag.SUBJECTS WHERE CODE='"+subt+"'";
		ResultSet rs=st.executeQuery(su);
		String note="INSERT INTO Anurag.NOTIFICATION (CREATOR,DEST,NOTE,DATED,SUBJECT) VALUES ('"+uidp+"','"+trade+"','"+desc+". Test code -"+testno+"','"+date+"','"+rs.getString("SUB_NAME").trim()+" on topic "+topic+"')";
		st.executeUpdate(note);
		response.getWriter().println("Test successfully scheduled.\nTest code is - T"+testno);
		}
		catch (Exception e) {
			response.getWriter().println("Error occured : Please try Again");
		}
	
	}

}
