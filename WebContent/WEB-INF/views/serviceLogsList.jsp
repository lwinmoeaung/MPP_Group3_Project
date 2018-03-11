<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Service Logs</title>
<jsp:include page="menu.jsp" />
</head>
<body>
	<div class="container">
		<h3 class="page-title">Service Logs</h3>
		<a href="addServiceLog.html" class="btn btn-primary mb-2">Create</a>
	
		<c:if test="${!empty serviceLogs}">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Date</th>
						<th>Vehicle</th>
						<th>Type</th>
						<th>Vendor</th>
						<th>Invoice Reference</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${serviceLogs}" var="serviceLog">
						<tr>
							<%-- <td><c:out value="${serviceLog.id}"/></td> --%>
							<td><c:out value="${serviceLog.date}"/></td>
							<td><c:out value="${serviceLog.vehicleName}"/></td>
							<td><c:out value="${serviceLog.serviceTypeName}"/></td>
							<td><c:out value="${serviceLog.vendorName}"/></td>
							<td><c:out value="${serviceLog.invoiceRef}"/></td>
							<td align="center">
								<a href="editContractType.html?id=${serviceLog.id}" class="icon"><i class="fas fa-pencil-alt"></i></a>
								<a href="deleteContractType.html?id=${serviceLog.id}" class="icon"><i class="fas fa-trash-alt"></i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>