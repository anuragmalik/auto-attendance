

import java.io.IOException;
import mypkg.date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.Connect;
import mypkg.CreatePassword;
import mypkg.GenerateUID;
import mypkg.Password;

import java.sql.*;
/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String name,dob,addr,city,state,mobno,email,reg_of,UID,fname,lname;
	long mob,gmob,cons,feePaid;
	Connection con;
	javax.servlet.RequestDispatcher rd;
	String msg,sub,to;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		fname=request.getParameter("first");
		lname=request.getParameter("last");
		name=fname+" "+lname;
		dob=request.getParameter("yyyy")+"-"+request.getParameter("mm")+"-"+request.getParameter("dd");
		addr=request.getParameter("addr1")+request.getParameter("addr2");
		city=request.getParameter("city");
		state=request.getParameter("state");
		mobno=request.getParameter("mobno");
		email=request.getParameter("email");
		reg_of=request.getParameter("reg_of");
		mob=Long.parseLong(mobno);
		
		String pass=CreatePassword.random(10, fname+mobno+lname);
		String passwrd="";
		try {
			passwrd = Password.encrypt(pass).toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		request.setAttribute("to",new String(email));
	    request.setAttribute("sub",new String("Registration Successfull !"));
	    request.setAttribute("msg",new String("Hello "+name+", are now successfully registered with" +
	    		" Echelon Institute of Technology." +
	    		"\n Below are your login details and you will recieve your QR Card soon enough.\n" +
	    		"Continue Login with following Details : \n Username :"+email+"\nPassword: "+pass 
	    		+"\nYou may change your password for further use.") );
	    request.setAttribute("reqFrom",new String("Register"));
	    rd = this.getServletContext().getRequestDispatcher("/email.jsp");
		 
		//System.out.println(reg_of);
	
		try {
			if(reg_of.equals("2"))
		
			reg_student(request,response,passwrd);
		else
			reg_prof_admin(request,response,passwrd);
		}
		catch(Exception e)
		{
			System.out.println("caught in register"+e);
		}
	}
	protected void reg_student(HttpServletRequest request, HttpServletResponse response, String passwrd)throws Exception
	{	
		
		String gname=request.getParameter("gfname")+request.getParameter("glname");
		String gemail=request.getParameter("gemail");
		String gmobno=request.getParameter("gmobno");
		String trade=request.getParameter("trade");
		cons=Long.parseLong(request.getParameter("cons"));
		feePaid=Long.parseLong(request.getParameter("feePaid"));
		gmob=Long.parseLong(gmobno);
		
		
		con=Connect.database();
		con.setAutoCommit(false);
		Statement st=con.createStatement();
		String query="SELECT TCODE FROM Anurag.DEPARTMENT,Anurag.TRADES WHERE Anurag.DEPARTMENT.DEPT_NAME='"+trade
				+"' AND Anurag.DEPARTMENT.DEPT=Anurag.TRADES.DEPT AND Anurag.TRADES.SEM=1";
		ResultSet rs=st.executeQuery(query);
		rs.next();
		String tcode=rs.getString("TCODE");
		String UID=GenerateUID.Student(trade);
		
		
		query="INSERT INTO Anurag.STUDENT VALUES('"+UID+"','"+name+"','"+addr+"','"+city+"','"+state+"','"+dob+"',"+
		mob+",'"+email+"','"+tcode+"','"+feePaid+"','"+gname+"','"+gemail+"',"+gmob+",'"+passwrd+"','"+cons+"')";
		st=con.createStatement();
		st.executeUpdate(query);
		
		query="INSERT INTO Anurag."+trade+"_ATTENDANCE(SUID) VALUES('"+UID+"')";		
		st.executeUpdate(query);
		query="INSERT INTO Anurag."+trade+"_MATTENDANCE(SUID) VALUES('"+UID+"')";	
		st.executeUpdate(query);
		query="INSERT INTO Anurag."+trade+"_SATTENDANCE(SUID) VALUES('"+UID+"')";
		st.executeUpdate(query);

	    rd.forward(request, response);
		
	}
	protected void reg_prof_admin(HttpServletRequest request, HttpServletResponse response,String passwrd)throws Exception
	{
		
		con=Connect.database();
		con.setAutoCommit(false);
		
		String emp_code;
		String desig=request.getParameter("desig");
		String qual=request.getParameter("qual");
		if(desig.equals("teacher"))
		{
		emp_code="T";
		UID=GenerateUID.Teacher();
		}
		else if(desig.equals("prof"))
		{
		emp_code="P";
		UID=GenerateUID.Professor();
		}
		else
		{
			emp_code="A";
			UID=GenerateUID.Admin();
		}
		
		String dept_name=request.getParameter("dept");
		//System.out.println("\n"+UID+"\n"+dept_name);

		
		Statement st=con.createStatement();
		String query="SELECT DEPT FROM Anurag.DEPARTMENT WHERE Anurag.DEPARTMENT.DEPT_NAME='"+dept_name+"'";
		ResultSet rs=st.executeQuery(query);
		rs.next();
		String dept=rs.getString("DEPT");
		
		String doj=date.now();
		
		query="INSERT INTO Anurag.PROF_ADMIN VALUES('"+UID+"','"+name+"','"+addr+"','"+city+"','"+state+"','"+dob
				+"',"+mob+",'"+email+"','"+qual+"','"+dept+"','"+emp_code+"','"+doj+"',0,30,'"+passwrd+"')";
		st=con.createStatement();
		st.executeUpdate(query);
		
		if(emp_code.equals("A"))
		{
			query="INSERT INTO Anurag.ADMINS VALUES('"+email+"','"+mobno+"','"+UID+"')";
			st=con.createStatement();
			st.executeUpdate(query);
		}
		
	    rd.forward(request, response);
	}
}
