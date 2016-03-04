
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypkg.Connect;
import mypkg.GenerateCode;
import mypkg.date;

/**
 * Servlet implementation class GenRequest
 */
@WebServlet("/GenRequest")
public class GenRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenRequest() {
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
		try
		{
			HttpSession session=request.getSession();
		String to=request.getParameter("to");
		String sub=request.getParameter("sub");
		String msg=request.getParameter("msg");
		String type="request";
		String doc=date.now();
		//String type=request.getParameter("type");
		String from=session.getAttribute("uid").toString().trim();

		String query="SELECT UID FROM Anurag.PROF_ADMIN WHERE NAME like '%"+to+"%'";
		String to_id;

		Connection con=Connect.database();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		//String code=GenerateCode.Request();
		if(rs.next())
		{
			to_id=rs.getString("UID").trim();


		String code=GenerateCode.Request();

		System.out.println(from+"  ");
		System.out.println(to_id);
		System.out.println(code);

		query="INSERT INTO Anurag.REQUESTS(REQ_CODE,FROM,TO,TYPE,SUB,MSG,CREATED_ON,STATUS) VALUES('"+code+"','"+from+"','"+to_id+"','"+type+"','"+sub+"','"+msg+"','"+doc+"','Pending')";
		st.executeUpdate(query);
		
		response.getWriter().print("Request sent to"+to+"("+to_id+"), Request code is - "+code);
		}
		else
			{response.getWriter().print("No Action Taken : Invalid Details");}
		}
		catch(Exception e)
		{
			System.out.println("caught"+e);
			response.getWriter().print("Error Occured: Please Try Again");
		}
	}

}
