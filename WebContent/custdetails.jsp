<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<body>

<%
	int id = Integer.parseInt(request.getParameter("cid"));
	String name = request.getParameter("fname");
%>

<jsp:useBean id="cust" class="model.Customer" />
<jsp:setProperty name="cust" property="cid" value="${param.cid }"/>
<jsp:setProperty name="cust" property="fName" value="${param.fname }" />

<b>Value From request.getParameter()</b>
<c:out value="<%=id%>"></c:out>
<br />
<b>Value From param tag</b>
<c:out value="${param.cid}"></c:out>
<br />
<b>Value From object.methodname()</b>
<c:out value="<%=//cust.getCid() %>"></c:out>
<br />
<b>Value From object.id </b>
<c:out value="${cust.cid}"></c:out>
<br />
<hr/>

<br />
<b>Value From request.getParameter()</b>
<c:out value="<%=name %>"></c:out>
<br />
<b>Value From param tag</b>
<c:out value="${param.fname}"></c:out>
<br />
<b>Value From object.methodname()</b>
<c:out value="<%=//cust.getfName() %>"></c:out>
<br />
<b>Value From object.id </b>
<c:out value="${cust.fName}"></c:out>
<br />
<hr />

</body>
</html>