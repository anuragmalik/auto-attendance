

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class profileFetch
 */
@WebServlet("/ProfileFetch")
public class ProfileFetch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileFetch() {
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

		try{
			String suid=request.getParameter("uid");  

			String q;
			String buffer="<table width='90%' align='center'>";   
			javax.naming.InitialContext ctx= new javax.naming.InitialContext();
			javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/MyDataSource");
			java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
			java.sql.Statement st = con.createStatement();
			if(suid.charAt(0)=='S')
			{
				q="SELECT * FROM Anurag.STUDENT,Anurag.DEPARTMENT,Anurag.TRADES WHERE suid like'%"+suid
						+"%' AND Anurag.STUDENT.TCODE=Anurag.TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT";
			}
			else
			{
				q="SELECT * FROM Anurag.PROF_ADMIN,Anurag.DEPARTMENT,Anurag.EMPLOYEE WHERE UID='"+suid
						+"'AND Anurag.PROF_ADMIN.DEPT=Anurag.DEPARTMENT.DEPT AND Anurag.PROF_ADMIN.EMP_CODE=Anurag.EMPLOYEE.EMP_CODE";
			}
			java.sql.ResultSet rs = st.executeQuery(q);



			if(suid.charAt(0)=='S'){
				while(rs.next()){
					buffer +="<tr bgcolor='#c0c0c0'><th>Name</th>";
					buffer +="<td colspan='5'>"+rs.getString("NAME")+"</td></tr><tr><th>Classs</th><td>";
					buffer += rs.getString("DEPT_NAME")+rs.getString("SEM")+"</td><th>Roll NO</th><td>"+rs.getString("SUID")+"</td><th>Date of Birth</th><td>";
					buffer +=rs.getString("DOB")+"</td></tr><tr><th>Contact no.</th><td>"+rs.getString("MOBNO")+"</td><th>Email ID</th><td colspan='3'>"+rs.getString("EMAIL")+"</td></tr>";

					buffer +="<tr bgcolor='#c0c0c0'><th>Guardian's Name</th>";
					buffer +="<td colspan='5'>"+rs.getString("GUARDIAN")+"</td></tr><tr><th>Contact no.</th><td>"+rs.getString("G_MOBNO");
					buffer +="</td><th>Email ID</th><td>"+rs.getString("G_EMAIL")+"</td></tr>";


					buffer +="<tr bgcolor='#c0c0c0'><th colspan='6'>Address</th></tr><tr><td colspan='6'>"+rs.getString("ADDR")+"</td></tr>";
					buffer +="<tr><th>City</th><td>"+rs.getString("CITY")+"<th>State</th><td>"+rs.getString("STATE")+"<th>PinCode</th><td>201310H</td></tr>";

					buffer +="<tr bgcolor='#c0c0c0'><th colspan='5'>Fee Details</th><td>(in Rs.)</td></tr>";
					buffer +="<tr><td>Tution Fees:</td><td colspan='5'>"+rs.getInt("TUTION_FEES")+"</td></tr>";
					buffer +="<tr><td>Others :</td><td colspan='5'>"+rs.getInt("OTHER_FEES")+"</td></tr>";
					buffer +="<tr><td>Total Fees:</td><td colspan='5'>"+(rs.getInt("TUTION_FEES")+rs.getInt("OTHER_FEES"))+"</td></tr>";
					buffer +="<tr><td>Concession :</td><td colspan='5'>"+rs.getInt("CONCESSION")+"</td></tr>";
					buffer +="<tr><td>Paid Fees:</td><td colspan='5'>"+rs.getInt("FEE_PAID")+"</td></tr>";
					buffer +="<tr><td>Due Fees:</td><td colspan='5'>"+(rs.getInt("TUTION_FEES")+rs.getInt("OTHER_FEES")-rs.getInt("CONCESSION")+rs.getInt("FEE_PAID"))+"</td></tr><tr>";
				}}
			else
			{
				while(rs.next()){
					buffer +="<tr bgcolor='#c0c0c0'><th>Name</th>";
					buffer +="<td colspan='5'>"+rs.getString("NAME")+"</td></tr><tr><th>Department</th><td>";
					buffer += rs.getString("DEPT")+"</td><th>Qualification</th><td>"+rs.getString("QUALIFICATION")+"</td><th>Date of Birth</th><td>";
					buffer +=rs.getString("DOB")+"</td></tr><tr><th>Contact no.</th><td>"+rs.getString("MOBNO")+"</td><th>Email ID</th><td colspan='3'>"+rs.getString("EMAIL")+"</td></tr>";

					buffer +="<tr bgcolor='#c0c0c0'><th colspan='6'>Address</th></tr><tr><td colspan='6'>"+rs.getString("ADDR")+"</td></tr>";
					buffer +="<tr><th>City</th><td>"+rs.getString("CITY")+"<th>State</th><td>"+rs.getString("STATE")+"<th>PinCode</th><td>2013109</td></tr>";

					buffer +="<tr bgcolor='#c0c0c0'><th colspan='6'>Subjects / Classes</th></tr><tr><th colspan='2'>Subject</th><th colspan='4'>Class</th></tr>";
					java.sql.Statement str = con.createStatement();
					java.sql.ResultSet rsr = str.executeQuery("SELECT SUB_NAME,CODE,DEPT_NAME,SEM from SUBJECTS,DEPARTMENT,TRADES  where UID='"+rs.getString("UID")+"' AND Anurag.SUBJECTS.TCODE=Anurag.TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT");
					while (rsr.next()){buffer +="<tr><td colspan='2'>"+rsr.getString("SUB_NAME")+"("+rsr.getString("CODE")+")</td><td colspan='2'>"+rsr.getString("DEPT_NAME")+" "+rsr.getString("SEM")+"</td></tr>";}


					buffer +="<tr bgcolor='#c0c0c0'><th colspan='5'>Salary Details</th><td>(in Rs.)</td></tr>";
					buffer +="<tr><td>Total Salary:</td><td colspan='5'>"+rs.getString("DOJ")+"</td></tr>";
					buffer +="<tr><td>Other Benefits :</td><td colspan='5'>"+rs.getString("EMP_CODE")+"</td></tr>";
					buffer +="<tr><td>Bonus:</td><td colspan='5'>"+(rs.getInt("PRESENT")+rs.getInt("TOTAL_WORKDAYS"))+"</td></tr>";
				}		}
			buffer +="<td colspan='2' bgcolor='#96cdcd'><a href=''><div align='center' style='width='100%;height='100%'>Print Details</div></a></td>";
			buffer +="<td class='updPro' colspan='2' bgcolor='#9aff9a'><div align='center' style='width='100%;height='100%'>Update User Profile</div></td>";
			buffer +="<td class='delete' colspan='2' bgcolor='#fa8072'><div align='center' style='width='100%;height='100%'>Delete User Profile</div></td></tr>";
			buffer=buffer+"</table>";  
			response.getWriter().println(buffer);  	
		} 
		catch (Exception e) {
			response.getWriter().println("Some Error Occured : Please Try Again");
		}
	}


}
