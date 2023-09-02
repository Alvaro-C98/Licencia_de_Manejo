<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/main.css">
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
	<div class="container">
		<a href="/licenses/new" class="float-end m-2">New License</a>
		<a href="/persons/new" class="float-end m-2">New User</a> 
		
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>State</th>
					<th>Number</th>
					<th>Expiration date</th>
				</tr>

			</thead>
			<tbody>
				<c:forEach items="${all}" var="p">
					<tr>
						<td><a href="/persons/${p.getId()}">${p.getId()}</a></td>
						<td>${p.firstName } ${p.lastName }</td>
						<td>${p.getLicense().getState() }</td>
						<td>${p.getLicense().getNumberString() }</td>
						<td><fmt:formatDate pattern="MM/dd/yyy" value="${p.getLicense().getExpirationDate()}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>