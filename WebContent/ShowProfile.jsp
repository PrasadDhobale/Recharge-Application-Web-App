<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style type="text/css">
body {
	font-weight: bold;
	background-image: url(IT1.jpg);
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	height: 100%;
}

th, td {
	text-align: center;
	border: 3px solid white;
}

th {
	background-color: #6efdff;
}

td {
	color: black;
	backdrop-filter: blur(8px);
}

tr:hover {
	background-color: #00ffb7;
	color: #fff;
}

.btn {
	font-size: 20px;
}
</style>
<body>
	<c:if test="${requestScope.showprofile != null and not empty requestScope.clist}">
		<a href="dashboard.jsp"><button class="btn">Dashboard</button></a>
		<br>
		<br>
		<h2
			style="text-align: center; background-color: aquamarine; width: 300px; margin: auto; color: white">User Profile</h2>
		<br>
		<br>
		<div class="table-responsive-sm">
			<table class="table">				
				<tbody>
					<c:forEach items="${requestScope.clist}" var="c">						
						<tr>
							<th>Full Name</th>
							<td>${c.fname}  ${c.lname }</td>
						</tr>
						<tr>
							<th>Age</th>
							<td>${c.age}</td>
						</tr>
						<tr>
							<th>Gender</th>
							<td>${c.gender}</td>
						</tr>
						<tr>
							<th>Mobile No</th>
							<td>${c.mobno}</td>
						</tr>
						<tr>
							<th>Email</th>
							<td>${c.email}</td>
						</tr>
						<tr>
							<th>Username</th>
							<td>${c.uname}</td>
						</tr>
						<tr>
							<th>Password</th>
							<td>${c.passwd}</td>
						</tr>
						<tr>
							<th>Registered Date</th>
							<td>${c.dati}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	<c:if test="${requestScope.showprofile == null}">
		<%
			response.sendRedirect("dashboard.jsp");
		%>
	</c:if>

</body>
</html>