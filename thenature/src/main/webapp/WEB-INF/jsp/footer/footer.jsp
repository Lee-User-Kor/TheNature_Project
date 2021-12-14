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
footer {
	margin-top: 100px;
	background-color: #EAEAEA;
}
.footer_top {
	width: 1500px;
	font-size: 15px;
	color: #808080;
	margin: auto;
	padding: 15px 0;
}
.footer_line {
	border: 1px solid #CCCACA;
}
.footer_bottom {
	width: 1500px;
	font-size: 15px;
	color: #808080;
	margin: auto;
	padding: 15px 0;
}
.fb_top {
	margin-bottom: 10px;
}
</style>
</head>
<body>

<footer>
	<div class="footer_top">
		<span><a>더웰소개</a></span>
		<span>|</span>
		<span><a>찾아오시는길</a></span>
		<span>|</span>
		<span style="color: #7E9863; font-weight: bold;"><a>개인정보취급방침</a></span>
	</div>
	<div class="footer_line"></div>
	<div class="footer_bottom">
		<div class="fb_top">
			<span>부산광역시 해운대구 수영강변대로 140(문화컨텐츠 컴플렉스 612호)</span>
			<span>|</span>
			<span>직업정보제공사업 신고번호 : 부산동부 제 2019-6호</span>
			<span>|</span>
			<span>사업자 신고번호 : B18-148346</span>
		</div>
		<div class="fb_bottom">
			<span>통신판매업 신고번호 : 2018-부산해운대-0551호</span>
			<span>|</span>
			<span>출판사 신고번호 : 2018-000017호</span>
		</div>
	</div>
</footer>

</body>
</html>