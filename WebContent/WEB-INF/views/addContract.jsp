<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="menu.jsp" />
<title></title>
</head>
<body>
<br />
	<h2>Vehicle Contract</h2>
	<form:form method="POST" action="/group3/saveContract.html"
		class="col-sm-4">

		<br />
		<form:hidden path="id" />

		<div class="form-group row">
			<form:label path="vehicleId" class="col-sm-5 col-form-label">Vehicle:</form:label>
			<div class="col-sm-7">
				<form:input path="vehicleId" value="${contract.vehicleId}"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<form:label path="contractTypeId" class="col-sm-5 col-form-label">Contract Type:</form:label>
			<div class="col-sm-7">
				<form:input path="contractTypeId" value="${contract.contractTypeId}"
					class="form-control" />
			</div>
		</div>

		<div class="form-group row">
			<form:label path="odometerAtCreation" class="col-sm-5 col-form-label">Odometer At Creation:</form:label>
			<div class="col-sm-7">
				<form:input path="odometerAtCreation"
					value="${contract.odometerAtCreation}" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<form:label path="invoiceDate" class="col-sm-5 col-form-label">Invoice Date:</form:label>
			<div class="col-sm-7">
				<form:input path="invoiceDate" value="${contract.invoiceDate}"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<form:label path="contractStartDate" class="col-sm-5 col-form-label">Contract Start Date:</form:label>
			<div class="col-sm-7">
				<form:input path="contractStartDate"
					value="${contract.contractStartDate}" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<form:label path="contractExpDate" class="col-sm-5 col-form-label">Contract Expiration Date:</form:label>
			<div class="col-sm-7">
				<form:input path="contractExpDate"
					value="${contract.contractExpDate}" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<form:label path="contractorId" class="col-sm-5 col-form-label">Contractor:</form:label>
			<div class="col-sm-7">
				<form:input path="contractorId" value="${contract.contractorId}"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<form:label path="vendorId" class="col-sm-5 col-form-label">Vendor:</form:label>
			<div class="col-sm-7">
				<form:input path="vendorId" value="${contract.vendorId}"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<form:label path="rentalCost" class="col-sm-5 col-form-label">Rental Fees:</form:label>
			<div class="col-sm-7">
				<form:input path="rentalCost" value="${contract.rentalCost}"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<form:label path="termsAndConditions" class="col-sm-5 col-form-label">Terms And Conditions:</form:label>
			<div class="col-sm-7">
				<form:textarea path="termsAndConditions"
					value="${contract.termsAndConditions}" class="form-control" />
			</div>
		</div>

		<center>
			<input type="submit" value="Save" class="btn btn-primary mb-2" />
		</center>
	</form:form>
</body>
</html>