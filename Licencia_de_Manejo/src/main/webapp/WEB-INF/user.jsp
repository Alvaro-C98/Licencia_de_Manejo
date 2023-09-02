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
<title>User</title>

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/main.css">
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
	<div class="container">
		<h2>
			<c:out value="${user.firstName }"/> <c:out value="${user.lastName }" />
		</h2>
		<p>
			State: 
		<c:out value="${user.getLicense().getState()}" />
		</p>
		<p>
			Number: 
		<c:out value="${user.getLicense().getNumberString()}" />
		</p>
		<p>
			Expiration Date: 
			<fmt:formatDate pattern="yyyy-MM-dd" value="${user.getLicense().getExpirationDate()}"/>
		</p>

	</div>

</body>
</html>