<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
<style>
.header_second {
	position: static;
	width: 100%;
}
.header_second_banner_div img {
	width: 100%;
}
.header_second_text_div {
	background-color: rgba(21, 21, 21, 0.5);
	color: white;
	font-weight: bold;
	width: 320px;
	text-align: center;
	padding: 30px;
	border-radius: 15px;
	position: relative;
	left: 770px;
    top: -232px;
}
.text_p_first {
	font-size: 24px;
}
.text_p_second {
	font-size: 15px;
}
</style>
</head>
<body>

<div class="header_second">
	<div class="header_second_wrap">
		<div class="header_second_banner_div">
			<img src="${root }/img/view/header/login_banner.svg">
		</div>
	</div>
</div>

</body>
</html>