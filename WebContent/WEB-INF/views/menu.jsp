<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Vehicle Management System</title>
<link rel="stylesheet" type="text/css" href="css/design.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/datatables/datatables.css">
<script type="text/JavaScript" src="css/design.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf8" src="css/datatables/datatables.js"></script>
<script type="text/javascript" charset="utf8" src="css/fontawesome/fontawesome-all.min.js"></script>
<script type="text/javascript" charset="utf8" src="css/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('.table').DataTable();

				var $submit = $("#submit_prog").hide(), $cbs = $(
						'input[name="prog"]').click(function() {
					$submit.toggle($cbs.is(":checked"));
				});

				$cball = $('input[name="checkall"]').click(function() {
					$submit.toggle($cball.is(":checked"));
				});

				$("#checkAll").change(
						function() {
							$("input:checkbox").prop('checked',
									$(this).prop("checked"));
						});
			});
	(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    var forms = document.getElementsByClassName('needs-validation');
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	})();
</script>
</head>
<body>
<div style="text-align: right; padding: 15px 10px"> 
	<span style="color: #888; padding-right: 20px">Welcome <%=session.getAttribute("userName")%>!</span> 
	<a href='logout.html' class="logout"> Log out</a>
</div>
<h1 class="title">Vehicle Management System</h1>
	<div class="topnav" id="myTopnav">

		<div class="dropdown">
			<button class="dropbtn">
				Vehicles <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="vehicles.html">Vehicles</a> <a href="odometers.html">Vehicles
					Odometer</a> <a href="vehiclecosts.html">Vehicle Costs</a> <a href="contracts.html">Vehicle
					Contracts</a>
			</div>
		</div>

		<div class="dropdown">
			<button class="dropbtn">
				Logs <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="fuelLogs.html">Vehicle Fuel Logs</a> <a href="serviceLogs.html">Vehicles Services
					Logs</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				Registration <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="vendors.html">Vendors</a> <a href="users.html">Users </a>
			</div>
		</div>

		<div class="dropdown">
			<button class="dropbtn">
				Configuration <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="models.html">Vehicle Model</a> <a href="makes.html">Vehicle
					Brand/Make</a> <a href="serviceTypes.html">Service Types</a><a
					href="contractTypes.html">Contract Type</a>
			</div>
		</div>

		<!-- <div class="dropdown">
			<button class="dropbtn">
				Reporting <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="#">Accident Report</a> <a href="#">Vehicle Costs</a>
			</div>
		</div> -->

		<!-- <a href="#mapping">Vehicle Unit Mapping</a>-->
		
		<a
			href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
	</div>