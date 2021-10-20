<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer | Registration</title>
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<link rel="stylesheet" href="jsp2.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <a href="index.jsp"><button class="btn">Home</button></a>
    <br><br>
        <h2 style="text-align: center;background-color: aquamarine;width: 300px;margin: auto;color: white">!! Register !!</h2>
        <form action="RegisterController" method="post">
        <br>
            <table>                
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="fname" placeholder="First Name" required/></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="lname" placeholder="Last Name" required/></td>
                </tr>
                <tr>
                    <td> Age</td>
                    <td><input type="number" name="age" placeholder="Customer Age" required/></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                    	<input type="radio" name="gender" value="Male" required>Male
  						<input type="radio" name="gender" value="Female" required>Female
                    </td>
                </tr>
                <tr>
                    <td>Mobile No</td>
                    <td><input type="text" name="mn" onkeypress="return event.charCode >= 48 && event.charCode <= 57" minlength="10" maxlength="10" placeholder="Mobile Number" required /></td>
                </tr>                
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" placeholder="Customer Email" required/></td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="uname" placeholder="Customer Username" pattern="(?=.*\d)(?=.*[a-z])(?=.*).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pass" placeholder="Customer Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/></td>
                </tr>
            </table>
            <br>
            <div class="btncenter">
                <button type="submit" class="btn" >Register</button>                
            </div>
            <div class="already" style="background-color: white;margin-left:auto;margin-right:auto ;text-align: center;">
            	<p style="color:green">Already Have an Account? <a href="custlogin.jsp">Login Here</a></p>
            </div>
        </form>        
   <%   
   	if(session.getAttribute("regcontroller") != null){
		Integer r = (Integer)session.getAttribute("userexist");
		if(r > 0){
			out.print("<p class='invalid'>Username Already Exist</p>");
		}else{
			Integer f = (Integer)session.getAttribute("regstatus");
			if(f > 0){
				out.print("<div class='success'><p> !! You Are Now Registered With Us !!</p></div>");
			}else{
				out.print("<p class='invalid'>Oops!! Something Went Wrong</p>");
			}
		}
		session.setAttribute("regcontroller", null);
   	}   
   %>
</body>
</html>