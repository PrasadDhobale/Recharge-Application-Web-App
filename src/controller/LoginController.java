package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import model.Customer;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
		HttpSession hs = request.getSession(true);
		
		if(uname != null && pass != null) {
			CustomerDao cdao = new CustomerDao();				
			
			Customer c = cdao.Login(uname, pass);
			hs.setAttribute("lgstatus","lgset");
			if(c != null){
				hs.setAttribute("login", "lgset");
				hs.setAttribute("cust", c);
				hs.setAttribute("username", uname);
				hs.setAttribute("number", c.getMobno());
				response.sendRedirect("dashboard.jsp");
			}else{
				c =null;
				response.sendRedirect("custlogin.jsp");
			}
		}else {
			hs.invalidate();
			response.sendRedirect("custlogin.jsp");
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
