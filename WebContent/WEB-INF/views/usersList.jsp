<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Users</title>
<jsp:include page="menu.jsp" />
</head>
<body>
	<div class="container">
		<h3 class="page-title">Users</h3>
		<a href="addUser.html" class="btn"><i class="fas fa-plus-circle"></i> New</a>
		
		<c:if test="${!empty users}">
			<table class="table table-hover">
				<thead>
					<tr>
						<!-- <th>User ID</th> -->
						<th>First Name</th>
						<th>Last Name</th>
						<th>User Name</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="user">
						<tr>
							<%-- <td><c:out value="${user.id}"/></td> --%>
							<td><c:out value="${user.firstName}"/></td>
							<td><c:out value="${user.lastName}"/></td>
							<td><c:out value="${user.userName}"/></td>
							<td align="center">
								<a href="editUser.html?id=${user.id}" class="icon"><i class="fas fa-pencil-alt"></i></a>
								<a href="deleteUser.html?id=${user.id}" class="icon"><i class="fas fa-trash-alt"></i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>