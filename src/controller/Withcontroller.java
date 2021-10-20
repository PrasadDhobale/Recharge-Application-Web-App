package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import model.Transaction;

/**
 * Servlet implementation class Withcontroller
 */
@WebServlet("/Withcontroller")
public class Withcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Withcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		if(uname != null) {
			float wamt = Float.parseFloat(request.getParameter("wamt"));
			String pass = request.getParameter("pass");
			
			CustomerDao cdao = new CustomerDao();
			HttpSession hs = request.getSession(true);
			hs.setAttribute("withcontroller", "active");
			int ca = cdao.checkAccount(uname);
			hs.setAttribute("accexist", ca);
			if(ca > 0) {
				int f = cdao.checkpass(uname, pass);
				hs.setAttribute("invalidpass", f);
				if(f == 1) {
					float bal = 0;
					bal = (float)cdao.getbal(uname);
					System.out.println(bal);
					hs.setAttribute("balance", bal);
					float reqbal = bal - wamt;
					hs.setAttribute("reqbal", reqbal);
					if(reqbal > 499) {
						int i = cdao.withamt(uname, wamt);
						if(i > 0) {
							Transaction t = new Transaction(uname, wamt, "Withdrawl");
							double reqamt = cdao.getbal(uname);
							String msg = "Dear "+uname+" !! Rs. "+wamt+" Credited To Your Account. Your Available Balance Is : "+reqamt;
							hs.setAttribute("sms", msg);
							
//							sendSMS sms = new sendSMS();
//							sms.doGet(request, response);
							cdao.Transaction(t);
						}
						hs.setAttribute("wamt", i);
						response.sendRedirect("Account.jsp");
					}else {
						response.sendRedirect("Account.jsp");
					}
				}else {
					response.sendRedirect("Account.jsp");
				}
			}else {
				response.sendRedirect("Account.jsp");
			}
		}else {
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
