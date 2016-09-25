

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AndroidStatus
 */
@WebServlet("/AndroidRequest")
public class AndroidRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidRequest() {
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
		String suid=request.getParameter("uid");  
		String buffer="<table width='95%' align='center'><tr bgcolor='#c0c0c0'><th>Request Code</th>"+
		"<th>Requested To</th><th>Details</th><th>Status</th></tr>";   
		java.sql.ResultSet rs;
		try{
			javax.naming.InitialContext ctx= new javax.naming.InitialContext();
		javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/MyDataSource");
		java.sql.Connection con = ds.getConnection();
		java.sql.Statement st = con.createStatement();
		String q="SELECT * FROM Anurag.REQUESTS WHERE Anurag.REQUESTS.FROM='"+suid+"'";
		 rs = st.executeQuery(q);
		
		while(rs.next()){
			
		buffer +=	"<tr><td>"+rs.getString("REQ_CODE")+"</td><td>"+rs.getString("TO")
				+"</td><td>"+rs.getString("SUB")+
				"</td><td>"+rs.getString("STATUS")+"</tr>";
		}
		 
		 buffer=buffer+"</table>";  
		 response.getWriter().println(buffer);  
		}
		catch (Exception e) {
		}
	
	}

}
