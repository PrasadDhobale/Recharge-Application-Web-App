package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.spi.activation.Repository;

import dao.CustomerDao;
import model.Customer;

/**
 * Servlet implementation class Updatefinal
 */
@WebServlet("/Updatefinal")
public class Updatefinal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updatefinal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		if(uname != null) {
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			int age = Integer.parseInt(request.getParameter("age"));
			String email = request.getParameter("email");			
			String pass = request.getParameter("pass");
			
			CustomerDao cdao = new CustomerDao();
			HttpSession hs = request.getSession(true);
			hs.setAttribute("Updateprofile", "active");
			int i = cdao.updateCust(fname, lname, age, email, uname, pass);
			hs.setAttribute("upstatus", i);
			response.sendRedirect("dashboard.jsp");
			
		}else {
			response.sendRedirect("dashboard.jsp");
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
