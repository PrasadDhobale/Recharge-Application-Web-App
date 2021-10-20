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
import model.Transaction;
import oracle.jdbc.util.Login;

/**
 * Servlet implementation class Rechargecontroller
 */
@WebServlet("/Rechargecontroller")
public class Rechargecontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rechargecontroller() {
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
			String mn = request.getParameter("mn");
			String sp = request.getParameter("sp");
			String circle = request.getParameter("circle");
			float amt = Float.parseFloat(request.getParameter("ramt"));
			String msg = "Recharge Of Rs. "+amt+" has been initiated towards your "+sp+" mobile "+mn+" Recharge Successfull !! On "+mn+"; pp2.epizy.com";
			System.out.println(uname+"\t"+pass+"\t"+mn+"\t"+sp+"\t"+circle+"\t"+amt);
			
			HttpSession hs = request.getSession(true);
			CustomerDao cdao = new CustomerDao();
			
			hs.setAttribute("sms", msg);
			hs.setAttribute("rnumber", mn);
			int i = cdao.checkpass(uname, pass);
			hs.setAttribute("rechcontroller", "active");			
			System.out.println(i);
			hs.setAttribute("invalidpass", i);
			if(i != 0) {
				int accexist = cdao.checkAccount(uname);
				hs.setAttribute("accexist", accexist);
				if(accexist != 0) {
				
					float accbal =(float) cdao.getbal(uname);
					float reqamt = accbal - amt;
					hs.setAttribute("amt", accbal);
					hs.setAttribute("reqamt", reqamt);
					if(reqamt >= 500) {
						int f = cdao.recharge(uname, mn, sp, circle, amt);
						if(f > 0) {
							//sendSMS sms = new sendSMS();
							//sms.doGet(request, response);
							Transaction t = new Transaction(uname, amt, "Mobile Recharge");
							cdao.Transaction(t);
						}
						hs.setAttribute("amt", accbal-amt);
						hs.setAttribute("rechstatus", f);
						response.sendRedirect("recharge.jsp");
					}else {
						response.sendRedirect("recharge.jsp");
					}
				}else {
					response.sendRedirect("recharge.jsp");
				}
			}else {
				response.sendRedirect("recharge.jsp");
			}
		}
		else {
			response.sendRedirect("recharge.jsp");
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
