

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;
import java.util.LinkedHashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.Connect;

/**
 * Servlet implementation class UpdateAttendance
 */
@WebServlet("/UpdateAttendance")
public class UpdateAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
      String UIDs,sub,tname,query1,query,dept,tcode,colno,mtname,stname;
      String[] uidarray;
      Connection con;
      ResultSet rs,rs1;
      Statement st,st1;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAttendance() {
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
		UIDs = request.getParameter("UIDs");
		sub=request.getParameter("subject");
		uidarray=UIDs.split("#");
		
		try
		{
		con=Connect.database();
		st=con.createStatement();
		query="SELECT COLNO,Anurag.SUBJECTS.TCODE,DEPT_NAME FROM Anurag.TRADES,Anurag.SUBJECTS,Anurag.DEPARTMENT WHERE Anurag.SUBJECTS.SUB_NAME='"+sub+"' AND Anurag.SUBJECTS.TCODE=Anurag.TRADES.TCODE AND Anurag.TRADES.DEPT=Anurag.DEPARTMENT.DEPT";
		rs=st.executeQuery(query);
		rs.next();
		tcode=rs.getString("TCODE");
		dept=rs.getString("DEPT_NAME").trim();
		colno=rs.getString("COLNO").trim();
		tname="Anurag."+dept+"_ATTENDANCE";
		mtname="Anurag."+dept+"_MATTENDANCE";
		stname="Anurag."+dept+"_SATTENDANCE";
		query="UPDATE Anurag.SUBJECTS SET LECTURE_COUNT=LECTURE_COUNT+1 WHERE SUB_NAME='"+sub+"'";
		st.executeUpdate(query);
		query="UPDATE Anurag.SUBJECTS SET MLCOUNT=MLCOUNT+1 WHERE SUB_NAME='"+sub+"'";
		st.executeUpdate(query);
		query="UPDATE Anurag.SUBJECTS SET SLCOUNT=SLCOUNT+1 WHERE SUB_NAME='"+sub+"'";
		st.executeUpdate(query);
		
		for (String uid: uidarray)
		{
			System.out.println(uid);
		query="SELECT SUID FROM Anurag.STUDENT WHERE SUID='"+uid+"' AND TCODE='"+tcode+"'";
		rs=st.executeQuery(query);
		
		if(rs.next())
		{
			st1=con.createStatement();
			query1="UPDATE "+tname+" SET "+tname+"."+colno+"="+colno+"+1 WHERE "+tname+".SUID='"+uid+"'" ;
			st1.executeUpdate(query1);
			query1="UPDATE "+mtname+" SET "+mtname+"."+colno+"="+colno+"+1 WHERE "+mtname+".SUID='"+uid+"'" ;
			st1.executeUpdate(query1);
			query1="UPDATE "+stname+" SET "+stname+"."+colno+"="+colno+"+1 WHERE "+stname+".SUID='"+uid+"'" ;
			st1.executeUpdate(query1);
		}
		
		}
		
		PrintWriter out=response.getWriter();
		out.println("Attendance Updated");
		}
		catch(Exception e)
		{
			System.out.println("caught "+e);
		}
		
	}

}
