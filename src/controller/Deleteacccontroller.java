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
 * Servlet implementation class Deleteacccontroller
 */
@WebServlet("/Deleteacccontroller")
public class Deleteacccontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deleteacccontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		if(uname != null) {
			String pass = request.getParameter("pass");
			CustomerDao cdao = new CustomerDao();
			HttpSession hs = request.getSession(true);
			hs.setAttribute("Deletecontroller", "active");
			int cp = cdao.checkAccount(uname);
			hs.setAttribute("accexist", cp);
			if(cp > 0) {
				int i = cdao.checkpass(uname, pass);
				hs.setAttribute("checkpass", i);
				if(i > 0) {
					int d = cdao.Deleteacc(uname);					
					hs.setAttribute("accdel", d);
					response.sendRedirect("Account.jsp");
				}else {
					response.sendRedirect("Account.jsp");
				}
			}else {
				response.sendRedirect("Account.jsp");
			}
		}else{
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
