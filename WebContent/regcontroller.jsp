<%@page import="sun.invoke.empty.Empty"%>
<%@page import="dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Controller</title>
</head>
<body>

	<c:if test="${not empty param.cid }">
		<jsp:useBean id="cust" class="model.Customer" />
		<jsp:setProperty name="cust" property="cid" value="${param.cid }" />
		<jsp:setProperty name="cust" property="fName" value="${param.fname }" />
		<jsp:setProperty name="cust" property="lName" value="${param.lname }" />
		<jsp:setProperty name="cust" property="age" value="${param.age }" />
		<jsp:setProperty name="cust" property="email" value="${param.email }" />
		<jsp:setProperty name="cust" property="uName" value="${param.uname }" />
		<jsp:setProperty name="cust" property="passwd" value="${param.pass }" />

		<%
				int id = 0; 
				id = Integer.parseInt(request.getParameter("cid"));			
				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				int age = Integer.parseInt(request.getParameter("age"));
				String email = request.getParameter("email");
				String uname = request.getParameter("uname");
				String pass = request.getParameter("pass");
				
				CustomerDao cdao = new CustomerDao();
				int r = cdao.checkuser(uname);
				session.setAttribute("userexist", r);
				if(r > 0){//out.print("Customer ID Or Username Already Exist");
				}else{
					int f = cdao.RegisterCust(cust);
					session.setAttribute("regstatus", f);
				}
				response.sendRedirect("custregister.jsp");
				
			%>
	</c:if>
	<c:if test="${empty param.cid}">
		<%
			session.invalidate();
			response.sendRedirect("custregister.jsp");
		%>
	</c:if>

</body>
</html>