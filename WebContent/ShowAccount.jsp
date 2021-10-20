<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Details</title>
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="jsp2.css">
</head>
<body>
	<c:if test="${not empty requestScope.alist}">
		<a href="Account.jsp"><button class="btn">Dashboard</button></a>
		<br><br>
		<h2 style="text-align: center;background-color: aquamarine;width: 300px;margin: auto;color: white">Account Details</h2>
		<br><br>
		<table>												
			<c:forEach items="${requestScope.alist}" var="a">
				<tr>
					<td>Username</td>
				</tr>				
				<tr>
					<td>${a.uname}</td>
				</tr>
				<td />
				<tr>
					<td>Account Number</td>
				</tr>
				<tr>	
					<td>${a.accno}</td>
				</tr>
				<td />
				<tr>
					<td>Account Balance</td>
				</tr>	
				<tr>
					<td>${a.accbal} Rs</td>
				</tr>
				<td />
				<tr>
					<td>Date</td>
				</tr>
				<tr>
					<td>${a.dati}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty requestScope.alist}">
		<%
		response.sendRedirect("Account.jsp");
		%>
	</c:if>
</body>
</html>