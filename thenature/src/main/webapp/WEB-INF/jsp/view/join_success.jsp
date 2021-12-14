<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
</head>
<body>
<script>
	alert('환영합니다! \nThe_Nature 회원가입을 축하드립니다!')
	location.href = '${root}/'
</script>
</body>
</html>