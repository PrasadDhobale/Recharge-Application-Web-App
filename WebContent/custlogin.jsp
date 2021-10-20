<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer | Login</title>
<link rel="stylesheet" href="jsp2.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<style type="text/css">
@media screen and (max-width: 600px) {    
    .already{
	    width: 60%;
	}
}
</style>
</head>					 		

<body>
    <a href="index.jsp"><button class="btn">Home</button></a>
    <br><br><br>
    <h2 style="text-align: center;background-color: aquamarine;width: 300px;margin: auto;color: white">!! Login !!</h2>
        <form action="LoginController" method="post">
            <br>
            <table>
                <tr>
                    <td><input type="text" name="uname" placeholder="Enter Username"
                    pattern="(?=.*\d)(?=.*[a-z])(?=.*).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                     required></td>
                </tr>

                <tr>
                    <td><input type="password" name="pass" placeholder="Enter Password"
                    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                     required></td>
                </tr>
            </table>
            <br><br>
            <div class="btncenter">
            	<button type="submit" class="btn">Login</button>
            </div>
            <br>
            <div class="already" style="background-color: white;margin-left:auto;margin-right:auto ;text-align: center;">
            	<p style="color:green;">Not Registered Yet !! <a href="custregister.jsp">Register Here</a></p>
            </div>
        </form>
        <%
        
      	//Dashboard wr account button ghe ani tyat add money create account deposit amount and recharge ghe
        
        	if(!session.isNew()){
        		if(session.getAttribute("lgstatus") != null){
        			Customer c = (Customer) session.getAttribute("cust");
            		if(c == null){
            			%>
            			<p class="invalid">!! Invalid Username Or Password !!</p>
            			<%
            		}
        		}
        	}
        	session.invalidate();
        %>
</body>
</html>