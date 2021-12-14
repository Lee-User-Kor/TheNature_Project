<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
body {
	padding: 0;
	margin: 0;
	width: 100%;
	font-family: 'Nanum Gothic', sans-serif;
}
a {
	text-decoration: none;
	color: inherit;
	cursor: pointer;
}
.hidden {
	display: none;
}
header {
	width: 100%;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid rgba(112, 112, 112, 0);
	z-index: 1;
}
.header_wrap {
	width: 1500px;
	height: 80px;
	display: flex;
	margin: auto; 
	justify-content: space-between;
}
.nav_div {
	display: table;
	font-size: 16px;
	font-weight: bold;
}
.nav_inner_div {
	display: table-cell;
	width: 185px;
	text-align: center;
	vertical-align: middle;
	font-size: 18px;
	color: #272727;
}
.member_menu_div {
	width: 249.719px;
	font-size: 13px;
	color: #707070;
	text-align: right;
}
.line_span {
	margin: 0 3px;
}
.hidden_menu {
	width: 100%;
	position: absolute;
	background-color: white;
	z-index: 1;
}
.hidden_menu_wrap {
	width: 1500px;
	margin: auto;
	display: flex;
	padding-top: 20px;
	padding-bottom: 20px;
	font-size: 14px;
}
.tree_menu {
	text-align: center;
	line-height: 30px;
	padding-left: 345px
}
.video_menu {
	text-align: center;
	padding-left: 126px;
	line-height: 30px;
}
.qna_menu {
	text-align: center;
	padding-left: 493px;
	line-height: 30px;
}
.hover_bold:hover {
	font-weight: bold;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<header>
	<div class="header_wrap">
		<div class="logo_div"><a href="${root }/"><img src="${root }/img/view/header/header_logo.png"></a></div>
		<div class="nav_div" onmouseover="headerHandlerOver()">
			<div class="nav_inner_div">나무</div>
			<div class="nav_inner_div">영상</div>
			<div class="nav_inner_div"><a href="${root }/tree_webtoon?mode=all">웹툰</a></div>
			<div class="nav_inner_div"><a href="${root }/community">커뮤니티</a></div>
			<div class="nav_inner_div">문의사항</div>
		</div>
		<div class="member_menu_div">
			<span><a href="${root }/${empty member ? 'login' : 'logout'}">${empty member ? '로그인' : '로그아웃'}</a></span>
			<span class="line_span">|</span>
			<c:if test="${empty member }">
				<span><a href="${root }/join">회원가입</a></span>
				<span class="line_span">|</span>
			</c:if>
			<c:if test="${not empty member }">
				<c:if test="${member.grade > 1 }">
					<span><a target="_blank" href="${root }/admin/${member.grade == 2 ? 'producer_main' : 'admin_main'}">관리페이지</a></span>
					<span class="line_span">|</span>
				</c:if>
			</c:if>
			<span><a href="${root }/mypage?mode=info">마이페이지</a></span>
<!-- 			<span class="line_span">|</span> -->
<%-- 			<span><a><img src="${root }/img/view/header/header_search_icon.svg"></a></span> --%>
		</div>
	</div>
</header>
<script>
	function headerHandlerOver() {
		var hiddenMenu = document.querySelector('.hidden_menu')
		var headerBottom = document.querySelector('header')
		hiddenMenu.classList.remove('hidden')
		headerBottom.style.borderBottom = '1px solid rgba(112, 112, 122, 1)'
		headerBottom.style.backgroundColor = 'white'
	}
</script>
<div class="hidden_menu hidden" onmouseover="headerHandlerOver()" onmouseout="headerHandlerOut()">
	<div class="hidden_menu_wrap">
		<div class="tree_menu">
			<div class="tree_menu_first hover_bold"><a href="${root }/tree_commentary">나무 해설</a></div>
			<div class="tree_menu_second hover_bold"><a href="${root }/tree_card">나무 카드</a></div>
		</div>
		<div class="video_menu">
			<div class="video_menu_first hover_bold"><a href="${root }/tree_video">나무 동영상</a></div>
			<div class="video_menu_second hover_bold"><a href="${root }/tree_ar">나무 AR</a></div>
		</div>
		<div class="qna_menu">
			<div class="qna_menu_first hover_bold"><a href="${root }/notice">공지사항</a></div>
			<div class="qna_menu_second hover_bold"><a href="${root }/qna">1:1 문의</a></div>
		</div>
	</div>
</div>
<script>
	function headerHandlerOut() {
		var hiddenMenu = document.querySelector('.hidden_menu')
		var headerBottom = document.querySelector('header')
		hiddenMenu.classList.add('hidden')
		headerBottom.style.borderBottom = '1px solid rgba(112, 112, 122, 0)'
		headerBottom.style.backgroundColor = ''
	}
</script>
</body>
</html>