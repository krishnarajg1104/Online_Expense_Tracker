<%@ page import ="com.db.HibernateUtil" %>
<%@ page import = "org.hibernate.SessionFactory" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Tracker</title>
<%@include file="component/allCSS.jsp" %>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<% SessionFactory factory = HibernateUtil.getSessionFactory();
	out.print(factory);
	%>
</body>
</html>