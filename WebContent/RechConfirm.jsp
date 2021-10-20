<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<link rel="stylesheet" href="jsp2.css">
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%
		if(!session.isNew()){
			if(session.getAttribute("btnpressed") != null){
				%>
				<a href="recharge.jsp"><button class="btn">Recharge</button></a>
				<br><br><br>
				<h2 style="text-align: center;background-color: aquamarine;width: 300px;margin: auto;color: white">Confirmation</h2>
				<br><br>
				<form action="Rechargecontroller" method="post">
					<input type="text" class="center" name="uname" value="${param.uname }" readonly><br>					
					<div class="center">
						<input type="text" name="mn" value="${param.mn }" readonly>
						<input type="text" name="sp" value="${param.sp }" readonly>
					</div>
					<br>
					<div class="center">				
						<input type="text" name="circle" value="${param.circle }" readonly><br>
						<input type="text" name="ramt" value="${param.ramt }" readonly>
					</div>
					<br>
					<input class="center" type="password" name = "pass" placeholder="Enter Password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
					required /><br>
					<div class="btncenter">
						<button type="submit" class="btn">Confirm</button>
					</div>
				</form>
			<%
			}else{
				response.sendRedirect("recharge.jsp");
			}
		}
	%>		
</body>	
</html>