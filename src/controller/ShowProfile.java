package controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import model.Customer;

/**
 * Servlet implementation class ShowProfile
 */
@WebServlet("/ShowProfile")
public class ShowProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowProfile() {
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
			List<Customer> clist = new LinkedList<Customer>();
			
			Customer c = cdao.Search(uname);
			clist.add(c);
			request.setAttribute("showprofile", "active");
			request.setAttribute("clist", clist);
			RequestDispatcher rd = request.getRequestDispatcher("ShowProfile.jsp");
			rd.forward(request, response);
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
