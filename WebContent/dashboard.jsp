<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="nav.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="jsp2.css">
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<script>
    function myFunction() {
        var x = document.getElementById("myTopnav");
        if (x.className === "topnav") {
            x.className += " responsive";            
        } else {
            x.className = "topnav";
        }
    }
</script>
<style type="text/css">
@media screen and (max-width: 600px) {
    .topnav.responsive .lgout {
        margin-top:20%;
    }
    #user{
    	display: none;
    }
}
body{
	font-family: sans-serif;
}
a{
	text-decoration: none;
}
</style>
</head>
<body>
	<%	
		if(session.getAttribute("login") != null){
			String uname = (String)session.getAttribute("username");
		%>
			<br><br><br>
			<p class="topright" id="user"><%out.print(uname); %></p>
			<h2 style="text-align: center;background-color: aquamarine;width: 300px;margin: auto;color: white">Welcome <%out.print(uname); %></h2>
			<br><br>
			<div class="topnav" id="myTopnav">
				<div class="topright">
					<a href="javascript:void(0);" style="font-size:13px;color:black" class="icon" onclick="myFunction()">
					<span class="fa fa-user" aria-hidden="true"></span> <%out.print(uname+"&nbsp"); %> <i class="fa fa-angle-down"></i>
					</a>
				</div>
				<a href="custlogin.jsp" class="lgout"><button class="btn">Logout</button></a>
								
				<form action="ShowProfile" method="post">
				<input type="hidden" name="uname" value="<%out.print(uname); %>" >
				<a><button class="btn" type="submit">Show Profile</button></a>
				</form>
				
				<form action="UpdateProfile" method="post">
				<input type="hidden" name="uname" value="<%out.print(uname); %>" >
				<a><button class="btn" type="submit">Update Profile</button></a>
				</form>				
			
				<a href="DelProfile.jsp"><button class="btn">Delete Profile</button></a>
			</div>
			
			<br><br><br>
			
			<a href="Account.jsp"><button class="btn">Banking</button></a><br><br>
			
			<a href="recharge.jsp"><button class="btn" value="<%session.setAttribute("btnpressed", "recharge"); %>">Recharge</button></a><br><br>
			<form action="Historycontroller" method="post">
				<input type="hidden" name="uname" value="<%out.print(uname); %>" >
				<button class="btn" type="submit">History</button>
			</form><br>
			
			<%
				if(session.getAttribute("histcontroller") != null){
					int ae =(Integer)session.getAttribute("accexist");
					if(ae == 0){						
						out.print("<p class='invalid'>Oops!! You Don't Have an Account Created Yet !! <br> Please <a href = 'Account.jsp'>Create Your Account</a> First</p>");
					}
					session.setAttribute("histcontroller", null);
				}
			
				if(session.getAttribute("Updateprofile") != null){
					if((int)session.getAttribute("upstatus") > 0){
						out.print("<div class='success'><p> !! Profile Updated Successfully !!</p></div>");
					}
					else{
						out.print("<p class='invalid'>Oops!! Something Went Wrong Please Try Again/p>");
					}
					session.setAttribute("Updateprofile", null);
				}			
			%>
		
		<%
		}else{
			session.invalidate();
			response.sendRedirect("custlogin.jsp");
		}	
	%>
</body>
</html>