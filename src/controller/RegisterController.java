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
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
				
		HttpSession hs = request.getSession(true);
		if(fname != null) {		
			String lname = request.getParameter("lname");
			int age = Integer.parseInt(request.getParameter("age"));
			String mn = request.getParameter("mn");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String uname = request.getParameter("uname");
			String pass = request.getParameter("pass");
			
			CustomerDao cdao = new CustomerDao();
			int r = cdao.checkuser(uname);
			
			hs.setAttribute("regcontroller", "active");
			hs.setAttribute("userexist", r);
			if(r > 0){//out.print("Customer ID Or Username Already Exist");
			}else{
				Customer c = new Customer(fname, lname, age, gender,mn, email, uname, pass);
				int f = cdao.RegisterCust(c);
				hs.setAttribute("regstatus", f);
			}
			response.sendRedirect("custregister.jsp");
		}else {
			hs.invalidate();
			response.sendRedirect("custregister.jsp");
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
