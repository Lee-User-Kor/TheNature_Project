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
	height: 300px;
}
.header_second_wrap {
	height: 300px;
}
.header_second_banner_div {
	height: 300px;
	background-image: url("${root}/img/view/header/banner.svg");
	display: grid;	
}
.header_second_text_div {
	background-color: rgba(21, 21, 21, 0.5);
	color: white;
	font-weight: bold;
	width: 320px;
	text-align: center;
	padding: 30px;
	border-radius: 15px;
	margin: auto;
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
			<div class="header_second_text_div">
				<p class="text_p_first">나무야 웹툰보자!</p>
				<p class="text_p_second">THE NATURE 사이트에 방문해주셔서 감사합니다.</p>
			</div>
		</div>
	</div>
</div>

</body>
</html>