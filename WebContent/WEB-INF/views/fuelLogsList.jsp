<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="menu.jsp" />
<title>Vehicle Management System</title>
</head>
<body>
	<div class="container">
		<h3 class="page-title">Fuel Logs</h3>
		<a href="addFuelLog.html" class="btn"><i class="fas fa-plus-circle"></i> New</a>

		<c:if test="${!empty fuelLogs}">
			<table class="table table-hover" id="fuelLogListTable">
				<thead>
					<tr>
						<th>Date</th>
						<th>Vehicle</th>
						<th>Vendor</th>
						<th>Liter</th>
						<th>Liter Per Price</th>
						<th>Total Price</th>
						<th>Invoice Reference</th>
						<th>Other Info</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${fuelLogs}" var="fuelLog">
						<tr>
							<td><c:out value="${fn:substring(fuelLog.date, 0, 10)}" /></td>
							<td><c:out value="${fuelLog.vehicleName}" /></td>
							<td><c:out value="${fuelLog.vendorName}" /></td>
							<td><c:out value="${fuelLog.liter}" /></td>
							<td><c:out value="${fuelLog.pricePerLiter}" /></td>
							<td><c:out value="${fuelLog.totalPrice}" /></td>
							<td><c:out value="${fuelLog.invoiceReference}" /></td>
							<td><c:out value="${fuelLog.otherInfo}" /></td>

							<td align="center"><a
								href="editFuelLog.html?id=${fuelLog.id}" class="icon"><i class="fas fa-pencil-alt"></i></a> <a
								href="deleteFuelLog.html?id=${fuelLog.id}" class="icon"><i class="fas fa-trash-alt"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#fuelLogListTable').DataTable();
	});
</script>
</html>