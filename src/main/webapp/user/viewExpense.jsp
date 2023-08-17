<%@ page import ="com.db.HibernateUtil" %>
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "com.dao.ExpenseDao" %>
<%@ page import = "com.entity.User" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import = "java.util.List" %>
<%@ page import = "com.entity.Expense" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${loginUser.fullname}: Expense Tracker - View Expense</title>
<%@include file="../component/allCSS.jsp" %>
</head>
<body>
<c:if test="${empty loginUser }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="../component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header">
						<p>All Expenses</p>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
							<tr>
								<th scope="col">Category</th>
								<th scope="col">Date</th>
								<th scope="col">Time</th>
								<th scope="col">Description</th>
								<th scope="col">Price</th>
								<th scope="col">Transaction ID</th>
								<th scope="col">Action</th>
							</tr>
							</thead>
							<tbody>
							<%
							User user = (User)session.getAttribute("loginUser");
							
							ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
							List<Expense> list = dao.getAllExpenseByUser(user);
							for (Expense ex:list){
							%>
								<tr>
									<th scope="row"><%=ex.getCategory() %></th>
									<td><%=ex.getDate() %></td>
									<td><%=ex.getTime() %></td>
									<td><%=ex.getDescription() %></td>
									<td><%=ex.getPrice() %></td>
									<td><%=ex.getId() %></td>
									<td>
										<a href="editExpense.jsp?id=<%=ex.getId() %>" class="btn btn-sm me-1 btn-primary">Edit</a>
										<a href="#" class="btn btn-sm me-1 btn-danger">Delete</a>
									</td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>