

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AndroidProfile
 */
@WebServlet("/AndroidProfile")
public class AndroidProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidProfile() {
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
		String suid=request.getParameter("uid");  
		String buffer="<table width='90%' align='center'>";   
		java.sql.ResultSet rs;
		try{
			javax.naming.InitialContext ctx= new javax.naming.InitialContext();
		javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/MyDataSource");
		java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
		java.sql.Statement st = con.createStatement();
		String q="SELECT * FROM Anurag.STUDENT,Anurag.DEPARTMENT,Anurag.TRADES WHERE suid like'%"+suid+"%' AND Anurag.STUDENT.TCODE=Anurag.TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT";
		 rs = st.executeQuery(q);
		
		while(rs.next()){
		 buffer +="<tr bgcolor='#c0c0c0'><th>Name</th>";
		 buffer +="<td colspan='5'>"+rs.getString("NAME")+"</td></tr><tr><th>Class</th><td>";
		 buffer += rs.getString("DEPT_NAME")+rs.getString("SEM")+"</td><th>Roll.No.</th><td>"+rs.getString("SUID")+"</td><th>Date.of.Birth</th><td>";
		 buffer +=rs.getString("DOB")+"</td></tr><tr><th>Contact-No.</th><td>"+rs.getString("MOBNO")+"</td><th>Email-ID</th><td colspan='3'>"+rs.getString("EMAIL")+"</td></tr>";

		 buffer +="<tr bgcolor='#c0c0c0'><th>Guardian's Name</th>";
		 buffer +="<td colspan='5'>"+rs.getString("GUARDIAN")+"</td></tr><tr><th>Contact-No.</th><td>"+rs.getString("G_MOBNO");
		 buffer +="</td><th>Email-ID</th><td>"+rs.getString("G_EMAIL")+"</td></tr>";
		 

		 buffer +="<tr bgcolor='#c0c0c0'><th colspan='6'>Address</th></tr><tr><td colspan='6'>"+rs.getString("ADDR")+"</td></tr>";
		 buffer +="<tr><th>City</th><td>"+rs.getString("CITY")+"<th>State</th><td>"+rs.getString("STATE")+"<th>PinCode</th><td>201310H</td></tr>";
		 
		 buffer +="<tr bgcolor='#c0c0c0'><th colspan='5'>Fee Details</th><td>(in Rs.)</td></tr>";
		 buffer +="<tr><td>Tution.Fees:</td><td colspan='5'>"+rs.getInt("TUTION_FEES")+"</td></tr>";
		 buffer +="<tr><td>Others :</td><td colspan='5'>"+rs.getInt("OTHER_FEES")+"</td></tr>";
		 buffer +="<tr><td>Total Fees:</td><td colspan='5'>"+(rs.getInt("TUTION_FEES")+rs.getInt("OTHER_FEES"))+"</td></tr>";
		 buffer +="<tr><td>Concession:</td><td colspan='5'>"+rs.getInt("CONCESSION")+"</td></tr>";
		 buffer +="<tr><td>Paid Fees:</td><td colspan='5'>"+rs.getInt("FEE_PAID")+"</td></tr>";
		 buffer +="<tr><td>Due Fees:</td><td colspan='5'>"+(rs.getInt("TUTION_FEES")+rs.getInt("OTHER_FEES")-rs.getInt("CONCESSION")+rs.getInt("FEE_PAID"))+"</td></tr>";
		}
		 
		 
		 buffer=buffer+"</table>";  
		 response.getWriter().println(buffer);  
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

}
