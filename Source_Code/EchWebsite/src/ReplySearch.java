

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReplySearch
 */
@WebServlet("/ReplySearch")
public class ReplySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplySearch() {
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
			String q=null;
			 String data=request.getParameter("data");
			int what=Integer.parseInt(request.getParameter("what"));
			 String buffer="<table width='100%'><tr><th bgcolor='#c0c0c0'>Following users were found :</th></tr>";   
			javax.naming.InitialContext ctx= new javax.naming.InitialContext();
			javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/MyDataSource");
			java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
			java.sql.Statement st = con.createStatement();
			if(what==1)
			{q="(select NAME,SUID as UID from Anurag.STUDENT where (Anurag.STUDENT.name like '%"+data+"%')) UNION ( select NAME,UID from Anurag.PROF_ADMIN where (Anurag.PROF_ADMIN.name like '%"+data+"%'))";}
			else
			{q="(select NAME,SUID as UID from Anurag.STUDENT where (Anurag.STUDENT.suid like '%"+data+"%')) UNION ( select NAME,UID from Anurag.PROF_ADMIN where (Anurag.PROF_ADMIN.uid like '%"+data+"%'))";}
			java.sql.ResultSet rs = st.executeQuery(q);
			int x=0;
			String color;
			 while(rs.next()){
				 if(x==0)
				 {color="e0eeee";
				 x=1;}
				 else
				 {color="c1ffc1";
				 x=0;}
			   buffer=buffer+"<tr><td class='result' bgcolor='#"+color+"' name='"+rs.getString("NAME")+"' id='"+rs.getString("UID")+"'><div style='width:100%' align='center'>"+rs.getString("NAME")+"("+rs.getString("UID")+")"+"</div></td></tr>";  
			   }  
			 buffer=buffer+"</table>";  
			 response.getWriter().println(buffer); 
			
		}
		catch(Exception e){
			response.getWriter().println("Some Error Occured : Please Try Again"); 
		}
	}

}
