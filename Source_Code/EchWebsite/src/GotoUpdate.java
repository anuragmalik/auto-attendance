

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GotoUpdate
 */
@WebServlet("/GotoUpdate")
public class GotoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GotoUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("In gotoupdate");
		String uid=request.getParameter("uid").trim();
		HttpSession session=request.getSession(true);
		session.setAttribute("updUid", uid);
		RequestDispatcher rd = request.getRequestDispatcher("ProfileUpdate.jsp");
		  rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("In gotoupdate");
		String uid=request.getParameter("hidUid").trim();
		HttpSession session=request.getSession(true);
		session.setAttribute("updUid", uid);
		RequestDispatcher rd = request.getRequestDispatcher("ProfileUpdate.jsp");
		  rd.forward(request, response);
	}

}
