<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer | Account</title>
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="sh.css">
<link rel="stylesheet" href="jsp2.css">
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script type="text/javascript">
	function checkcreate() {
		var accno= document.getElementById("accno").value;
		if(accno > 1000){
			var accbal = document.getElementById("accbal").value;
			if(accbal >= 1000){
				document.getElementById("myform").submit;
				return true;
			}else{
				document.getElementById("msg").innerHTML = "First Deposit Minimum 1000 Rs.";				
				return false;
			}
		}else{
			document.getElementById("msg").innerHTML = "Enter Account Number Minimum 4 Digit & Greater Than 1000";
			return false;
		}
	}
	function checkdeposit() {
		var amt = document.getElementById("amt").value;
		if(amt < 100){
			alert("Low Amount");
			document.getElementById("msg").innerHTML = "Please Deposit Amount Minimum 100 Rs.";
			return false;
		}else{
			document.getElementById("depositform").submit;
			return true;
		}
	}
	function withcheck(){
		var wamt = document.getElementById("wamt").value;
		if(wamt < 200){
			document.getElementById("msg").innerHTML = "Please Withdraw Amount Minimum 100 Rs.";
			return false;
		}else{
			return true;
		}
	}
</script>
<style type="text/css">
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
input[type=number] {
  -moz-appearance: textfield;
}

</style>
</head>
<body>
	<%
	if(session.getAttribute("login") != null){
		String uname = (String)session.getAttribute("username");		
       	String getbal = "Getbalcontroller?uname="+uname;       	
		%>
			<a href="dashboard.jsp"><button class="btn">Dashboard</button></a>
			<p class="topright"><%out.print(uname); %></p>					
			<br><br>
			<h2 style="text-align: center;background-color: aquamarine;width: 300px;margin: auto;color: white">Welcome To Banking <%out.print(uname); %></h2>
			<div class="wrapper">
		        <div class="tabs">
		            <ul>
		            	<li class="active">
		                  <span class="text">Show Account</span>
		                </li>
		                <li>
		                    <span class="text">Create Account</span>
		                </li>		                		                
		                <li>
		                    <span class="text">Deposit Amount</span>
		                </li>
		            </ul>
		        </div>
		        <div class="tabs">
		            <ul>
		                <li>
		                    <span class="text">Withdraw Amount</span>
		                </li>
		                <li>
		                    <span class="text">Delete Account</span>
		                </li>
		            </ul>
		        </div>
		        
			    <div class="content">		            
		            <div class="tab_wrap" style="display: block;">
		                <div class="title">Show Account</div>
		                <div class="tab_content">		                    
		                   <form action="GetAccController" method="post">
								<table>
									<tr>
										<td><input type="text" value="<%out.print(uname);%>" name="uname" readonly="readonly"></td>
									</tr>																				
									<tr>
										<td><button class="btn" id="deposit" type="submit">Show Account</button></td>
									</tr>
								</table>								
							</form>
							<%
							if(session.getAttribute("getacccon") != null){
								int ae = (Integer)session.getAttribute("accexist");
								if(ae > 0){
									
								}else{
									out.print("<p class='invalid'>Oops!! You Don't Have an Account Created Yet !! <br> Please <a href = 'Account.jsp'>Create Your Account</a> First</p>");
								}
								session.setAttribute("getacccon", null);
							}
							%>							
		                </div>
		            </div>
		            		            
		            <div class="tab_wrap" style="display: none;">
		                <div class="title">Create Account</div>
			                <div class="tab_content">
			                    <form onsubmit="return checkcreate()" action="AccountController" method="post" id="myform">
									<table class="createacc">
										<tr>
											<td><input type="text" value="<%out.print(uname); %>" name="uname" readonly="readonly"></td>
										</tr>
										<tr>
											<td><input type="number" name="accno" id="accno" placeholder="Account Number" required></td>
										</tr>
										<tr>
											<td><input type="number" name="accbal" id="accbal" placeholder="Account Balance" required></td>
										</tr>
										<tr>
											<td><button class="btn" id="create">Create Account</button></td>
										</tr>
									</table>
								</form>								
			               </div>
		            </div>
		            
		            <div class="tab_wrap" style="display: none;">
		                <div class="title">Deposit Amount</div>
		                	<div class="tab_content">
		                    	<form onsubmit="return checkdeposit()" action="Depositcontroller" method="post" id="depositform">
									<table>
										<tr>
											<td><input type="text" value="<%out.print(uname);%>" name="uname" readonly="readonly"></td>
										</tr>
										<tr>
											<td><input type="number" name="damt" id="amt" placeholder="Deposit Amount" required></td>
										</tr>
										<tr>
											<td><input type="password" name="pass" placeholder="Password" 
				 							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 						 
											required></td>
										</tr>
										<tr>
											<td><button class="btn" id="deposit">Deposit Amount</button></td>
										</tr>
									</table>
								</form>							
		                </div>
		            </div>
		            <div class="tab_wrap" style="display: none;">
		                <div class="title">Withdraw Amount</div>
		                <div class="tab_content">
		                    <form onsubmit="return withcheck()" action="Withcontroller" method="post">
								<table>
									<tr>
										<td><input type="text" value="<%out.print(uname);%>" name="uname" readonly="readonly"></td>
									</tr>
									<tr>
										<td><input type="number" style="width: 200px;" name="wamt" id="wamt" placeholder="Withdraw Amount" required></td>
									</tr>
									<tr>
										<td><input type="password" name="pass" placeholder="Password" 
			 							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 						 
										required></td>
									</tr>
									<tr>
										<td><button class="btn" id="deposit">Withdraw</button></td>
									</tr>
								</table>
							</form>							
		                    <br>
		                </div>
		            </div>
		            <div class="tab_wrap" style="display: none;">
		                <div class="title">Delete Account</div>
		                <div class="tab_content">		                    
		                    <form action="Deleteacccontroller" method="post">
								<table>
									<tr>
										<td><input type="text" value="<%out.print(uname);%>" name="uname" readonly="readonly"></td>
									</tr>
									<tr>
										<td><input type="password" name="pass" placeholder="Password"
			 							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 						 
										required></td>
									</tr>
									<tr>
										<td><button class="btn">Delete Account</button></td>
									</tr>
								</table>
							</form>
		                    <br>	                    
		                </div>
		            </div>
		            <br><br>
		            <p class="invalid" id="msg"></p>
		        <!---//////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
		        <%		        

		        if(session.getAttribute("acccontroller") != null){
					int f = (Integer)session.getAttribute("accexist");
					if(f > 0 ){
						out.print("<p class='invalid'>Oops !! You Already Have One Account</p>");
					}else{
						int cr = (Integer)session.getAttribute("accnoexist");
						if(cr == 0){
							int i = (Integer)session.getAttribute("crtacc");
							if(i > 0){
								out.print("<p class='success'>Account Created Successfully</p>");
							}
						}else{
							out.print("<p class='invalid'>Oops !! Account Number Already Exist</p>");
						}
					}
					session.setAttribute("acccontroller", null);
				}
		        
		        if(session.getAttribute("depositcontroller") != null){		
					if((int)session.getAttribute("accexist") > 0){
						if((int)session.getAttribute("invalidpass") == 0 ){
							out.print("<p class='invalid'>Oops !! You Entered Invalid Password</p>");
						}else{
							if((int)session.getAttribute("damt") == 1){
								out.print("<p class='success'>!! Amount Deposited Successfully !!</p>");
							}else{
								out.print("<p class='invalid'>Oops !! Something Went Wrong</p>");
							}
						}
					}else{
						out.print("<p class='invalid'>Oops!! You Don't Have an Account Created Yet !! <br> Please <a href = 'Account.jsp'>Create Your Account</a> First</p>");
					}
					session.setAttribute("depositcontroller", null);
				}
		        
		        if(session.getAttribute("withcontroller") != null){		
					if((int)session.getAttribute("accexist") > 0){
						if((int)session.getAttribute("invalidpass") == 0 ){
							out.print("<p class='invalid'>Oops !! You Entered Invalid Password</p>");
						}else{
							if((float)session.getAttribute("reqbal") > 499){
								if((float)session.getAttribute("wamt") >0){
									out.print("<p class='success'>!! Amount Withdrawl Successfully !!<br>Your Balance Is : "+session.getAttribute("reqbal")+"</p>");
								}else{
									out.print("<p class='invalid'>Oops !! Something Went Wrong</p>");
								}
							}else{
								out.print("<p class='invalid'>Oops!! Insufficient Balance In Your Account<br>Your Balance Is : "+session.getAttribute("balance")+"</p>");
							}
						}
					}else{
						out.print("<p class='invalid'>Oops!! You Don't Have an Account Created Yet !! <br> Please <a href = 'Account.jsp'>Create Your Account</a> First</p>");
					}
					session.setAttribute("withcontroller", null);
				}
		        
				if(session.getAttribute("Deletecontroller") != null){
					int ae = (Integer)session.getAttribute("accexist");
					if(ae > 0){
						int cp = (Integer)session.getAttribute("checkpass");
						if(cp > 0){
							int d = (Integer)session.getAttribute("accdel");
							if(d > 0){
								out.print("<p class='success'>!! Account Deleted Successfully !!</p>");
							}else{
								out.print("<p class='invalid'>Oops !! Something Went Wrong</p>");
							}
						}else{
							out.print("<p class='invalid'>Oops !! You Entered Invalid Password</p>");
						}
					}else{
						out.print("<p class='invalid'>Oops!! You Don't Have an Account Created Yet !! <br> Please <a href = 'Account.jsp'>Create Your Account</a> First</p>");
					}
					session.setAttribute("Deletecontroller", null);
				}		        
		        %>

		        </div>
			</div>
		<%
	}else{
		%>
		<script type="text/javascript">
			window.location.href = "dashboard.jsp";
		</script>
		<%
	}
	%>	
	<script src="sh.js"></script>
</body>
</html>