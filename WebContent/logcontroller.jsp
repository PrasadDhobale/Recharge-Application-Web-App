<%@page import="model.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Controller</title>
</head>
<body>
	
	<c:if test="${not empty param.uname }">	
	<%
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		CustomerDao cdao = new CustomerDao();				
				
		Customer c = cdao.Login(uname, pass);
		session.setAttribute("lgstatus","lgset");
		if(c != null){
			session.setAttribute("login", "lgset");
			session.setAttribute("cust", c);
			session.setAttribute("username", uname);
			response.sendRedirect("dashboard.jsp");
		}else{
			c =null;
			response.sendRedirect("custlogin.jsp");
		}
	%>
	</c:if>
	<c:if test="${empty param.uname }">
		<%
			session.invalidate();
			response.sendRedirect("custlogin.jsp");
		%>
	</c:if>
</body>
</html>