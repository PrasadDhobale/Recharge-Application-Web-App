package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;

/**
 * Servlet implementation class Getbalcontroller
 */
@WebServlet("/Getbalcontroller")
public class Getbalcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Getbalcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		if(uname != null) {			
			CustomerDao cdao = new CustomerDao();
			HttpSession hs = request.getSession(true);
			int i = cdao.checkAccount(uname);
			hs.setAttribute("accexist", i);
			hs.setAttribute("getbalcontroller",	"active");
			if(i > 0) {
				double bal =(float) cdao.getbal(uname);
				hs.setAttribute("accbal", bal);
				response.sendRedirect("Account.jsp");
			}else {
				response.sendRedirect("Account.jsp");
			}
		}
		else {
			response.sendRedirect("Account.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
