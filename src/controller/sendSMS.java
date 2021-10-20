package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.security.provider.certpath.ResponderId;

/**
 * Servlet implementation class sendSMS
 */
@WebServlet("/sendSMS")
public class sendSMS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendSMS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");		
		if(uname != null) {
			HttpSession hs = request.getSession(true);
			
			String message =(String) hs.getAttribute("sms");
			String number =(String) hs.getAttribute("number");
			String rnumber =(String) hs.getAttribute("rnumber");
			try{
				String apiKey="13T0g4nwI5XdWNxUsFqlYJuHZBvarftyhmk2VzSDCLoAM8RQPb9hgt1Fz8Eaqlw2k5ons7RNC4AXDIGJ";
				String sendId="FSTSMS";
				//important step...
				message=URLEncoder.encode(message, "UTF-8");
				String language="english";
				
				String route="p";				
				String myUrl = null;
				if(rnumber != null) {
					myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+number+","+rnumber;
				}else {
					myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+number;
				}
				
				System.out.println(uname+"\t"+message+"\t"+number+"\t"+rnumber);
				//sending get request using java..
				
				URL url=new URL(myUrl);
				
				HttpsURLConnection con=(HttpsURLConnection)url.openConnection();
				
				
				con.setRequestMethod("GET");
				
				con.setRequestProperty("User-Agent", "Mozilla/5.0");
				con.setRequestProperty("cache-control", "no-cache");
				
				int code=con.getResponseCode();
				
				System.out.println("Response code : "+code);
				
				StringBuffer res=new StringBuffer();
				
				BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
				
				while(true)
				{
					String line=br.readLine();
					if(line==null)
					{
						break;
					}
					res.append(line);
				}
				System.out.println(res);
				}catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
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
