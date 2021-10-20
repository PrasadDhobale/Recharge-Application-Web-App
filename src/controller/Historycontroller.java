package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import model.Recharge;
import model.Transaction;

/**
 * Servlet implementation class History
 */
@WebServlet("/Historycontroller")
public class Historycontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Historycontroller() {
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
			hs.setAttribute("histcontroller", "active");
			request.setAttribute("histcontroller", "active");
			int i = cdao.checkAccount(uname);
			hs.setAttribute("accexist", i);
			if(i > 0) {
				List<Recharge> rlist = cdao.rechhstory(uname);
				List<Transaction> tlist = cdao.transhistory(uname);
				request.setAttribute("rhist", rlist);
				request.setAttribute("thist", tlist);
				RequestDispatcher rd = request.getRequestDispatcher("History.jsp");
				rd.forward(request, response);				
			}else {
				response.sendRedirect("dashboard.jsp");
			}
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
