<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Vendors</title>
<jsp:include page="menu.jsp" />
</head>
<body>
	<div class="container">
		<h3 class="page-title">Vendors</h3>
		<a href="addVendor.html" class="btn"><i class="fas fa-plus-circle"></i> New</a>
	
		<c:if test="${!empty vendors}">
			<table class="table table-hover" id="vendorListTable">
				<thead>
					<tr>
						<!-- <th>Vendor ID</th> -->
						<th>Name</th>
						<th>Title</th>
						<th>SSN</th>
						<th>Phone</th>
						<th>Email</th>
						<!-- <th>Address</th> -->
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vendors}" var="vendor">
						<tr>
							<%-- <td><c:out value="${vendor.id}" /></td> --%>
							<td><c:out value="${vendor.vendorName}" /></td>
							<td><c:out value="${vendor.title}" /></td>
							<td><c:out value="${vendor.ssn}" /></td>
							<td><c:out value="${vendor.phone}" /></td>
							<td><c:out value="${vendor.email}" /></td>
							<%-- <td><c:out value="${vendor.address}" /></td> --%>
							<td align="center">
								<a href="editVendor.html?id=${vendor.id}" class="icon"><i class="fas fa-pencil-alt"></i></a>
								<a href="deleteVendor.html?id=${vendor.id}" class="icon"><i class="fas fa-trash-alt"></i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#vendorListTable').DataTable();
			});
</script>
</html>