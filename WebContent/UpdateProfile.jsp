<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer | Update</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>
<body>
	<c:if test="${requestScope.Updateprofile != null and not empty requestScope.Updateprofile}">
		<a href="dashboard.jsp"><button class="btn">Dashboard</button></a>
		<br>
		<br>
		<h2
			style="text-align: center; background-color: aquamarine; width: 300px; margin: auto; color: white">User
			Profile</h2>
		<br>
		<br>
		<form action="Updatefinal" method="post">
			<div class="table-responsive-sm">
				<table class="table">
					<tbody>
						<c:forEach items="${requestScope.clist}" var="c">							
							<tr>
								<th>First Name</th>
								<td><input type="text" value="${c.fname}" name="fname"></td>
							</tr>
							<tr>
								<th>Last Name</th>
								<td><input type="text" value="${c.lname}" name="lname"></td>
							</tr>
							<tr>
								<th>Age</th>
								<td><input type="number" value="${c.age}" name="age"></td>
							</tr>
							<tr>
								<th>Gender</th>
								<td>
			                    	<input type="radio" name="gender" value="${c.gender }" required>Male
			  						<input type="radio" name="gender" value="${c.gender }" required>Female
			                    </td>
							</tr>
							<tr>
								<th>Mobile No</th>
								<td><input type="text" value="${c.mobno}" name="mn"></td>
							</tr>
							<tr>
								<th>Email</th>
								<td><input type="text" value="${c.email}" name="email"></td>
							</tr>
							<tr>
								<th>Username</th>
								<td><input type="text" value="${c.uname}" name="uname" readonly></td>
							</tr>
							<tr>
								<th>Password</th>
								<td><input type="text" value="${c.passwd}" name="pass"></td>
							</tr>
							<tr>
								<th>Reg Time</th>
								<td>${c.dati}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<button class="btn" type="submit">Update</button>
		</form>
	</c:if>
	<c:if test="${requestScope.Updateprofile == null}">
		<%
			response.sendRedirect("dashboard.jsp");
		%>
	</c:if>
</body>
</html>