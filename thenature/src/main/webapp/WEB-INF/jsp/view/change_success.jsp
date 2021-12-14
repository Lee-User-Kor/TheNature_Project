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
	alert('변경 완료\n변경된 정보로 다시 로그인해주세요')
	location.href = '${root}/login'
</script>
</body>
</html>