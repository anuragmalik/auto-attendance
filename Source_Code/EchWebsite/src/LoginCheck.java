


import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypkg.Connect;
import mypkg.Password;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public java.sql.Statement st;
	String login;
	String password;
	String query;
	public ResultSet rs;
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("servlet");

	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		session=request.getSession(true);
		session.setAttribute("afterLogout", new String("false"));
		String group1=request.getParameter("group1");
		if(!(group1.equals("Admin"))){
			String admin=request.getParameter("admin");
			System.out.println(admin);
			if(admin!=null)
				admin_login(request,response);
			else
			{
				if("Teacher".equals(group1))
					prof_login(request,response);
				else
					stud_login(request,response);
			}
		}
		else
		{
			try {
				adminLogin(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void adminLogin(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("admin");
		login=request.getParameter("uname");
		password=Password.encrypt(request.getParameter("password").toString()).trim();

		try {

			Connection con=Connect.database();
			st = con.createStatement();
			query="SELECT * FROM Anurag.ADMINS,Anurag.PROF_ADMIN WHERE Anurag.ADMINS.EMAIL='"+login+"'AND Anurag.ADMINS.PASSWORD='"+password+"'";
			rs=st.executeQuery(query);
			if(rs.next())
			{
				session.setAttribute("loggedin",new String("ADMIN"));
				session.setAttribute("uid", new String(rs.getString("UID")));
				session.setAttribute("name", new String(rs.getString("NAME")));
				System.out.println("correct email");
				RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
				rd.forward(request, response);
			}
			else
			{System.out.println("wrong email");
			session.setAttribute("loginFail", new String("true"));
			RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
			rd.forward(request, response);}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

	}

	protected void prof_login(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("professor");


		login=request.getParameter("uname");
		try {
			password=Password.encrypt(request.getParameter("password").toString()).trim();
			//System.out.println(password);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//System.out.println(login);
		//System.out.println(password);


		try {

			Connection con=Connect.database();
			st = con.createStatement();
			query="SELECT * FROM Anurag.PROF_ADMIN WHERE EMAIL='"+login+"'AND PASSWORD='"+password+"'";
			rs=st.executeQuery(query);
			if(rs.next())
			{
				session.setAttribute("loggedin",new String("PROF"));
				session.setAttribute("uid", new String(rs.getString("UID")));
				session.setAttribute("name", new String(rs.getString("NAME")));
				session.setAttribute("loginFail", new String("false"));
				System.out.println("correct email");
				RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
				rd.forward(request, response);
			}
			else
			{System.out.println("wrong email");
			session.setAttribute("loginFail", new String("true"));
			RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
			rd.forward(request, response);}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	protected void stud_login(HttpServletRequest request, HttpServletResponse response)
	{
		login=request.getParameter("uname");
		try {
			password=Password.encrypt(request.getParameter("password").toString()).trim();
		
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {

			Connection con=Connect.database();
			st = con.createStatement();
			query="SELECT * FROM Anurag.STUDENT WHERE EMAIL='"+login+"'AND PASSWORD='"+password+"'";
			rs=st.executeQuery(query);
			if(rs.next())
			{
				session.setAttribute("loggedin",new String("STUD"));
				session.setAttribute("uid", new String(rs.getString("SUID")));
				session.setAttribute("name", new String(rs.getString("NAME")));
				session.setAttribute("loginFail", new String("false"));
				System.out.println("correct email");
				RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
				rd.forward(request, response);
			}
			else
			{System.out.println("wrong email");
			session.setAttribute("loginFail", new String("true"));
			RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
			rd.forward(request, response);}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	protected void admin_login(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("admin");
		login=request.getParameter("admin_uname");
		try {
			password=Password.encrypt(request.getParameter("admin_password").toString()).trim();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {

			Connection con=Connect.database();
			st = con.createStatement();
			query="SELECT * FROM Anurag.ADMINS,Anurag.PROF_ADMIN WHERE Anurag.ADMINS.EMAIL='"+login
					+"'AND Anurag.ADMINS.PASSWORD='"+password+"'";
			rs=st.executeQuery(query);
			if(rs.next())
			{
				session.setAttribute("loggedin",new String("ADMIN"));
				session.setAttribute("uid", new String(rs.getString("UID")));
				session.setAttribute("name", new String(rs.getString("NAME")));

				System.out.println("correct email");
				RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
				rd.forward(request, response);
			}
			else
			{System.out.println("wrong email");
			session.setAttribute("loginFail", new String("true"));
			RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
			rd.forward(request, response);}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

	}

}
