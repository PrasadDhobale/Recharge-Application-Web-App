<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Profile</title>
<link rel="stylesheet" href="jsp2.css">
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<style>
form {
	margin: auto;
	text-align: center;
}
input{
	margin: 10px;
}
</style>

<body>

	<%
	if(session.getAttribute("login") != null){
	String uname = (String)session.getAttribute("username");
	%>
	<a href="dashboard.jsp"><button class="btn">Dashboard</button></a>
	<br>
	<br>

	<h2 style="color: white">Delete Profile</h2>
	<br>
	<br>
	<form action="DelProCon" method="post">

		<input type="text" name="uname" value="<%out.print(uname); %>" placeholder="Username"
			pattern="(?=.*\d)(?=.*[a-z])(?=.*).{8,}"
			title="Must contain at least one number and lowercase letter, and at least 8 or more characters"
			required />
		<input type="password" name="pass" placeholder="Password"
			pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
			title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
			required />			
		<button class="btn" type="submit">Delete</button>
	
	</form>
	<%	
	}else{
		session.invalidate();
		response.sendRedirect("custlogin.jsp");
	}
%>

</body>

<%
	if(session.getAttribute("delprofcon") != null){
		if((int)session.getAttribute("checkpass") == 0){
			out.print("<p class='text-danger' style='text-align:center;background-color:white;width:70%;margin:auto;'>Oops!! You Entered Incorrect Password </p>");
		}
		session.setAttribute("delprofcon", null);
	}
%>
</html>