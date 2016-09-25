

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.Connect;
import mypkg.date;

/**
 * Servlet implementation class Notifier
 */
@WebServlet("/Notifier")
public class Notifier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Notifier() {
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
		String type=request.getParameter("type");
		String sender=request.getParameter("creator").trim();
		String dest=request.getParameter("dest").trim();
		String note=request.getParameter("msg").trim();
		String subj=request.getParameter("sub").trim();
		String[] rec=new String[20];
		String frec="";
		int i=0;
		if(type.equals("Gen")){

			if(dest.contains("all"))
			{
				if(dest.contains("dpt")) {rec[i++]="ADPT";}
				else 
				{if(dest.contains("c")){rec[i++]="ACSE";}
				if(dest.contains("e")){rec[i++]="AECE";}
				if(dest.contains("m")){rec[i++]="AME";}
				if(dest.contains("i")){rec[i++]="AIT";}
				}
			}

			else
			{ 
				if(dest.contains("a"))
				{
					if(dest.contains("dpt")) {rec[i++]="DPTA";}
					else 
					{if(dest.contains("c")){rec[i++]="CSEA";}
					if(dest.contains("e")){rec[i++]="ECEA";}
					if(dest.contains("m")){rec[i++]="MEA";}
					if(dest.contains("i")){rec[i++]="ITA";}
					}
				}
				if(dest.contains("t"))
				{
					if(dest.contains("dpt")) {rec[i++]="DPTT";}
					else 
					{if(dest.contains("c")){rec[i++]="CSET";}
					if(dest.contains("e")){rec[i++]="ECET";}
					if(dest.contains("m")){rec[i++]="MET";}
					if(dest.contains("i")){rec[i++]="ITT";}
					}
				}
				if(dest.contains("s"))
				{
					if(dest.contains("dpt")) {rec[i++]="DPTS";}
					else 
					{if(dest.contains("c")){rec[i++]="CSES";}
					if(dest.contains("e")){rec[i++]="ECES";}
					if(dest.contains("m")){rec[i++]="MES";}
					if(dest.contains("i")){rec[i++]="ITS";}
					}
				}
			}
			i=i-1;
			frec="#";
			for(int x=0;x<=i;x++)
			{frec +=rec[x]+"-"; }
			frec=frec.substring(1,frec.length()-1);
		}
		else {frec=dest; }



		try {
			Connection con=Connect.database();
			Statement st=con.createStatement();
			String q="Insert into Anurag.NOTIFICATION (CREATOR,DEST,NOTE,DATED,SUBJECT) VALUES ('"+sender
					+"','"+frec+"','"+note+"','"+date.now().trim()+"','"+subj+"')";
			st.executeUpdate(q);
			response.getWriter().println("Notification Successfully Sent");

		} catch (SQLException e) { response.getWriter().println("Some Error Occured : Try Again");
		e.printStackTrace(); }


	}

}
