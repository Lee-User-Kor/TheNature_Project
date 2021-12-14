<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
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
	background-color: #EBEBEB;
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
	width: 185px;
    height: 969px;
    position: fixed;
    background-color: #343434;
    left: 0;
    top: 0;
}
.h_wrap_top {
	border-bottom: 1px solid white;
}
.hw_logo {
	padding: 20px 15px;
	font-size: 21px;
	font-weight: bold;
	color: white;
}
.hwb_menu {
	color: white;
	height: 30px;
	padding: 10px 15px 0 15px;
	display: table;
	width: 155px;
}
.hwb_menu:hover {
	font-weight: bold;
}
.hwb_menu span {
	display: table-cell;
	vertical-align: middle;
	cursor: pointer;
}
.hwb_inner_menu {
	padding: 10px 15px;
	color: white;
	border-bottom: 1px solid white;
}
.hwb_inner_menu div {
	font-size: 13px;
	padding: 5px;
}
.hwb_inner_menu div:hover {
	font-weight: bold;
}
</style>
</head>
<body>
<c:if test="${empty member }">
	<script>
		alert('접근 불가')
		location.href = '${root}/'
	</script>
</c:if>
<c:if test="${not empty member }">
	<c:if test="${member.grade < 2 }">
		<script>
			alert('접근 불가')
			location.href = '${root}/'
		</script>
	</c:if>
</c:if>


<header>
	<div class="h_wrap_top">
		<div class="hw_logo">
			<span><a href="${root }/admin/${member.grade == 2 ? 'producer_main' : 'admin_main'}">The Nature</a></span>
		</div>
	</div>
	<div class="h_wrap_bot">
		<div class="hwb_menu m_tree">
			<span onclick="showInnerMenu(event)">나무관리</span>
			<span onclick="showInnerMenu(event)"><img src="${root }/img/view/admin/arrow_down.png"></span>
		</div>
		<div class="hwb_inner_menu im_tree hidden">
			<div><a href="${root }/admin/tree_commentary_list">해설 관리</a></div>
			<div><a href="${root }/admin/tree_card_list">카드 관리</a></div>
		</div>
		<div class="hwb_menu m_video">
			<span onclick="showInnerMenu(event)">영상관리</span>
			<span onclick="showInnerMenu(event)"><img src="${root }/img/view/admin/arrow_down.png"></span>
		</div>
		<div class="hwb_inner_menu im_video hidden">
			<div><a href="${root }/admin/video_list">영상 관리</a></div>
			<div><a href="${root }/admin/ar_list">AR 관리</a></div>
		</div>
		<div class="hwb_menu m_webtoon">
			<span><a href="${root }/admin/webtoon_list">웹툰관리</a></span>
		</div>
		<c:if test="${member.grade == 3 }">
		<div class="hwb_menu m_community">
			<span><a href="${root }/admin/community_list">커뮤니티관리</a></span>
		</div>
		<div class="hwb_menu m_inquiry">
			<span onclick="showInnerMenu(event)">문의사항관리</span>
			<span onclick="showInnerMenu(event)"><img src="${root }/img/view/admin/arrow_down.png"></span>
		</div>
		<div class="hwb_inner_menu im_inquiry hidden">
			<div><a href="${root }/admin/notice_list">공지사항 관리</a></div>
			<div><a href="${root }/admin/qna_list">1:1문의 관리</a></div>
		</div>
		<div class="hwb_menu m_comment">
			<span><a href="${root }/admin/comment_list">댓글관리</a></span>
		</div>
		<div class="hwb_menu m_member">
			<span><a href="${root }/admin/member_list">회원관리</a></span>
		</div>
		</c:if>
		<script>
			function showInnerMenu(event) {
				var val = event.target.parentNode
				if(val.classList.contains('m_tree')) {
					var im_tree = document.querySelector('.im_tree')
					if(im_tree.classList.contains('hidden')) {
						im_tree.classList.remove('hidden')
					}else {
						im_tree.classList.add('hidden')
					}
				}else if(val.classList.contains('m_video')) {
					var im_video = document.querySelector('.im_video')
					if(im_video.classList.contains('hidden')) {
						im_video.classList.remove('hidden')
					}else {
						im_video.classList.add('hidden')
					}
				}else if(val.classList.contains('m_inquiry')) {
					var im_inquiry = document.querySelector('.im_inquiry')
					if(im_inquiry.classList.contains('hidden')) {
						im_inquiry.classList.remove('hidden')
					}else {
						im_inquiry.classList.add('hidden')
					}
				}
			}
		</script>
	</div>
</header>

</body>
</html>