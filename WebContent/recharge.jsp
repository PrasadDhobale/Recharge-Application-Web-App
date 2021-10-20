<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recharge</title>
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<link rel="stylesheet" href="jsp2.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
 form .center{
	display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    margin-right: auto;
  	margin-left: auto;
}
</style>
</head>
<body>
	<%				
		if(!session.isNew()){
			if(session.getAttribute("btnpressed") != null){
				%>
				<a href="dashboard.jsp"><button class="btn">Dashboard</button></a>
			    <br><br><br>
			    <h2 style="text-align: center;background-color: aquamarine;width: 300px;margin: auto;color: white">Mobile Recharge</h2>
			    <br><br>
			    <form action="RechConfirm.jsp" method="POST" style="margin: auto;">
			        <div class="center">
				        <input name="uname" value="<%out.print(session.getAttribute("username")); %>" readonly>
				        <input type="text" name="mn" onkeypress="return event.charCode >= 48 && event.charCode <= 57"
				        minlength="10" maxlength="10" placeholder="Mobile Number" required />
					</div>
					<br>
			        <div class="center">
				        <select class="sp" name="sp">
				            <option value="Airtel" selected>Airtel</option>
				            <option value="Jio">Jio</option>
				            <option value="VI">VI</option>
				            <option value="BSNL">BSNL</option>
				        </select>
				        <select class="" name="circle">
				            <option value="Maharashtra & Goa" selected>Maharashtra &amp; Goa</option>
				            <option value="Gujrat">Gujrat</option>
				            <option value="Panjab">Panjab</option>
				            <option value="Rajasthan">Rajasthan</option>                        
				        </select>
					</div>
					<br>
			        <select class="center" name="ramt">
			            <option value="149" selected>149</option>
			            <option value="250">250</option>
			            <option value="449">449</option>
			            <option value="589">589</option>                        
			        </select>
					<br><br>
			        <div class="btncenter">
			        	<button class="btn" type="submit">Recharge</button>
			        </div>
			        <br>
			    </form>	
				<%				
			}else{
				response.sendRedirect("dashboard.jsp");
			}
		}else{
			response.sendRedirect("dashboard.jsp");
		}
	%>	
	<%
		if(session.getAttribute("rechcontroller") == "active"){
			if((int)session.getAttribute("accexist") > 0){
				if((int)session.getAttribute("invalidpass") == 0){
					out.print("<p class='invalid'>Incorrect Password Try Again</p>");
				}else{
					if((float)session.getAttribute("reqamt") >= 500){
						if((int)session.getAttribute("rechstatus") > 0){
							out.print("<div class='success'><p> !! Recharge Successfully !!<br>Your Balance Is : "+session.getAttribute("amt")+"</p></div>");
						}else{
							out.print("<p class='invalid'>Oops!! Something Went Wrong</p>");
						}
					}else{
						out.print("<p class='invalid'>Oops!! Insufficient Balance In Your Acount<br>Balance Is : "+session.getAttribute("amt")+"</p>");
					}
				}
			}else{
				out.print("<p class='invalid'>Oops!! You Don't Have an Account Created Yet !! <br> Please <a href = 'Account.jsp'>Create Your Account</a> First</p>");
			}
			session.setAttribute("rechcontroller",null);
		}
	%>
</body>
</html>