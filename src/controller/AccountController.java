package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import model.Account;

/**
 * Servlet implementation class AccountController
 */
@WebServlet("/AccountController")
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs = request.getSession(true);		
		String uname = request.getParameter("uname");		
		if(uname != null) {
			int accno = Integer.parseInt(request.getParameter("accno"));
			float accbal = Float.parseFloat(request.getParameter("accbal"));
			CustomerDao cdao = new CustomerDao();
			hs.setAttribute("acccontroller", "active");
			int f = cdao.checkAccount(uname);
			hs.setAttribute("accexist", f);
			if( f == 0) {				
				int cr = cdao.checkAccno(accno);
				hs.setAttribute("accnoexist", cr);
				if(cr == 0) {
					
					Account a = new Account(uname, accno, accbal);					
					int i = cdao.createAccount(a);
					hs.setAttribute("crtacc", i);
				}
			}
		}
		response.sendRedirect("Account.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}