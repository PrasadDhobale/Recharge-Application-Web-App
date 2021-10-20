
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Propad</title>
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<link rel="stylesheet" href="jsp2.css">
</head>

<body>	
	<h2>!! Welcome To Our Portal !!</h2>
	<br><br><br>
	<div class="btncenter">
		<a href="custregister.jsp"><button class="btn">Register</button></a>
	</div>
	<br><br><br>
	<div class="btncenter">
		<a href="custlogin.jsp"><button class="btn">Login</button></a>
	</div>
	
	<%	
		if(session.getAttribute("delprofcon") != null){		
			if((boolean)session.getAttribute("delstatus")){
				out.print("<div class='success'><p> !! Profile Deleted Successfully !!</p></div>");
			}
			session.setAttribute("delprofcon", null);
		}	
	%>
</body>

</html>