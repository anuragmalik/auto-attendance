

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
import mypkg.date;
/**
 * Servlet implementation class Register
 */
@WebServlet("/UpdatePro")
public class UpdatePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String name,dob,addr,city,state,mobno,email,UID,fname,lname,uid;
	long mob,gmob;
	Connection con;
	javax.servlet.RequestDispatcher rd;
	String msg,sub,to;
	String para="",values="'";
	int valid=0,upd_of;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		uid=session.getAttribute("updUid").toString();
		//session.removeAttribute("updUid");
		if(uid.charAt(0)=='S'){upd_of=2;}
		else {upd_of=1;}
		
		name=request.getParameter("name");
		dob=request.getParameter("dob");
		addr=request.getParameter("addr");
		city=request.getParameter("city");
		state=request.getParameter("state");
		mobno=request.getParameter("mobno");
		email=request.getParameter("email");
		mob=Long.parseLong(mobno);
		
		if(name.length()>1) {para+="NAME,"; values += name+"','"; valid=1;}
		if(dob.length()>1) {para+="DOB,"; values += dob+"','"; valid=1;}
		if(addr.length()>1) {para+="ADDR,"; values += addr+"','"; valid=1;}
		if(city.length()>1) {para+="CITY,"; values += city+"','"; valid=1;}
		if(state.length()>1) {para+="STATE,"; values += state+"','"; valid=1;}
		if(mobno.length()>1) {para+="MOBNO,"; values += mob+"','"; valid=1;}
		if(email.length()>1) {para+="EMAIL,"; values += email+"','"; valid=1;}		
		
		System.out.println(uid+" "+upd_of);
	
		try {
			if(upd_of==2)
		
			upd_student(request,response);
		else
			upd_prof_admin(request,response);
		}
		catch(Exception e)
		{
			System.out.println("caught in register"+e);
		}
	}
	protected void upd_student(HttpServletRequest request, HttpServletResponse response)throws Exception
	{	
		
		String gname=request.getParameter("gname");
		String gemail=request.getParameter("gemail");
		String gmobno=request.getParameter("gmobno");
		String cons=request.getParameter("cons").toString();
		Long conss=Long.parseLong(cons);
		String feePaid=request.getParameter("feePaid");
		Long feep=Long.parseLong(feePaid);
		gmob=Long.parseLong(gmobno);
		
		if(gname.length()>1) {para+="GUARDIAN,"; values += gname+"','"; valid=1;}
		if(gemail.length()>1) {para+="G_EMAIL,"; values += gemail+"','"; valid=1;}
		if(gmobno.length()>1) {para+="G_MOBNO,"; values += gmobno+"','"; valid=1;}
		if(feePaid.length()>1) {para +="FEE_PAID,"; values += feep+"','"; valid=1;}
		if(cons.length()>1) {para +="CONCESSION,"; values += conss+"','"; valid=1;}
		
		if(valid==1){
		para = para.substring(0, para.length()-1).trim();
		values = values.substring(0, values.length()-2).trim();
		//String cols=para+")";
		//String vals=values+")";
		System.out.println(para +" "+values);
		
		String query="UPDATE Anurag.STUDENT set ("+para+") = ("+values+") WHERE suid='"+uid+"'";
		System.out.println(query);
		con=Connect.database();
		Statement st=con.createStatement();
		st.executeUpdate(query);
        st.close();
		con.close();
	    response.getWriter().print("Done Update"); }
		else
		{
			
			response.getWriter().print("No Action Taken");
		}
		
	}
	protected void upd_prof_admin(HttpServletRequest request, HttpServletResponse response)throws Exception
	{
		
		con=Connect.database();
		con.setAutoCommit(false);
		
        String qual=request.getParameter("qual");
        
        if(qual.length()>1) {para+="QUALIFICATION,"; values += qual+"','"; valid=1;}
        
        if(valid==1){
    		para = para.substring(0, para.length()-1).trim();
    		values = values.substring(0, values.length()-2).trim();
    		//String cols=para+")";
    		//String vals=values+")";
    		System.out.println(para +" "+values);
    		
    		String query="UPDATE Anurag.PROF_ADMIN set ("+para+") = ("+values+") WHERE uid='"+uid+"'";
    		System.out.println(query);
    		con=Connect.database();
    		Statement st=con.createStatement();
    		st.executeUpdate(query);
    	    
    	    if(uid.charAt(0)=='A' && email.length()>1)
    		{
    			query="UPDATE Anurag.ADMIN set EMAIL = '"+email+"' WHERE uid='"+uid+"'";
    			st=con.createStatement();
    			st.executeUpdate(query);
    		}
    	    
    	    response.getWriter().print("Done Update");
    	    st.close();
    		con.close();
        }
    		else
    		{
    			
    			response.getWriter().print("No Action Taken");
    		}
	}
}
