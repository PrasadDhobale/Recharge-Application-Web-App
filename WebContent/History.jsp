<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recharge History</title>
<link rel="icon" href="ITB2.jpg" type="image/x-icon">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
body {
	font-weight: bold;
	background-image: url(IT4.jpg);
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
	backdrop-filter: blur(10px);
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
	<div class="bg-img">
		<div class="bg-content">
			<c:if test="${requestScope.histcontroller != null }">
				<a href="dashboard.jsp"><button class="btn">Dashboard</button></a>
				<c:if test="${requestScope.rhist != null and not empty requestScope.rhist}">
					<br><br>
					<h2 style="text-align: center; background-color: aquamarine; width: 300px; margin: auto; color: white">Recharge History</h2>
					<br><br>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Mobile No</th>
									<th scope="col">Service Provider</th>
									<th scope="col">Circle</th>
									<th scope="col">Recharge Amount</th>
									<th scope="col">Date &amp; Time</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.rhist}" var="r">
									<tr>
										<td scope="row">${r.mn}</td>
										<td>${r.sp}</td>
										<td>${r.circle}</td>
										<td scope="row">${r.ramt}</td>
										<td>${r.r_date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
				<c:if test="${requestScope.rhist == null }">
					<br><br><br>
					<div class="alert alert-danger" role="alert"
						style="text-align: center;">You Had'nt Recharge Yet !!
					</div>
				</c:if>
				<c:if test="${requestScope.thist != null and not empty requestScope.thist}">
					<br><br>
					<h2 style="text-align: center; background-color: aquamarine; width: 300px; margin: auto; color: white">Transaction History</h2>
					<br><br>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Transaction Type</th>
									<th scope="col">Transaction Amount</th>									
									<th scope="col">Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.thist}" var="t">
									<tr>
										<td>${t.t_type}</td>
										<td scope="row">${t.amt}</td>										
										<td>${t.t_time}</td>										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
				<c:if test="${requestScope.thist == null }">
					<br><br><br>
					<div class="alert alert-danger" role="alert"
						style="text-align: center;">You Had'nt Transact Yet !!
					</div>
				</c:if>
				
			</c:if>
			<c:if test="${requestScope.histcontroller == null }">
				<%
					response.sendRedirect("dashboard.jsp");
				%>
			</c:if>
		</div>
	</div>
</body>
</html>