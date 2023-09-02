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
<title>License</title>

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/main.css">
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
	<div class="container">
		<h2>New License</h2>
		<form:form action="/licenses/new" method="POST" modelAttribute="license">

			<div class="form-group">
				<form:label path="person" class="form-label">Select user: </form:label>
				<form:select path="person" class="form-control mb-2">
					<c:forEach items="${users}" var="user">
						<form:option value="${user.id}">${user.firstName} ${user.lastName}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group">
				<form:label path="state" class="form-label">State: </form:label>
				<form:input path="state" class="form-control"/>
				<form:errors path="state" class="text-danger"/>
			</div>
			<div class="form-group">
				<form:label path="expirationDate" class="form-label mt-2">Expiration date: </form:label>
				<form:input type="date" path="expirationDate" class="form-control"/>
				<form:errors path="expirationDate" class="text-danger"/>
			</div>
			<button class="btn btn-success mt-2">Created</button>
		</form:form>
	</div>
</body>
</html>