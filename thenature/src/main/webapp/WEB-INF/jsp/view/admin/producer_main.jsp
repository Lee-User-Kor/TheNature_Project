<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
<style>
.total_wrap {
	margin-left: 185px;
}
.m_wrap {
	width: 1400px;
	margin: 74px auto;
	display: flex;
	justify-content: space-between;
}
.mw_left {
	display: flex;
	flex-flow: wrap;
	justify-content: space-between;
	width: 850px;
}
.mw_left_inner {
	width: 415px;
	height: 400px;
	background-color: white; 
}
.mwli_top {
	margin-bottom: 20px;
}
.mwl_title {
	padding: 10px 20px;
	color: #343434;
	font-size: 17px;
	font-weight: bold;
	border-bottom: 2px solid #C7C7C7;
}
.mwl_content {
	height: 335px;
	padding: 10px 20px;
}
.mwl_content div {
	height: 167.5px;
	line-height: 167.5px;
    text-align: center;
}
.mwl_content button {
	border: 1px solid black;
	background-color: white;
	width: 120px;
	height: 40px;
}
.mwl_content button:hover {
	background-color: black;
	color: white;
	cursor: pointer;
}
.mw_right {
	width: 530px;
	background-color: #343434;
	color: white;
}
.mwr_icon {
	text-align: center;
	padding-top: 65px;
}
.mwr_id {
	text-align: center;
	padding-top: 15px;
}
.mwr_info {
	border-bottom: 1px solid white;
	padding-bottom: 20px;
	padding-top: 30px;
}
.mwr_table {
	width: 400px;
	margin: 0 auto;
	border-collapse: collapse;
}
.f_td {
	padding: 15px 0;
	font-weight: bold;
}
.s_td {
	font-size: 14px;
}
.s_td button, .mwr_logout button {
	background-color: inherit;
	border: 1px solid white;
	color: white;
	border-radius: 15px;
	padding: 5px 10px;
}
.mwr_logout {
	width: 400px;
	margin: 20px auto;
}
.mwr_logout button:hover {
	background-color: white;
	color: #343434;
	cursor: pointer;
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
<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>

<div class="total_wrap">
	<div class="m_wrap">

		<div class="mw_left">
			<div class="mw_left_01 mw_left_inner mwli_top">
				<div class="mwl_title">
					<span>나무 바로가기</span>
				</div>
				<div class="mwl_content">
					<div><button onclick="location.href = '${root}/admin/tree_commentary_write'">나무 해설 등록</button></div>
					<div><button onclick="location.href = '${root}/admin/tree_card_write'">나무 카드 등록</button></div>
				</div>
			</div>
			<div class="mw_left_01 mw_left_inner mwli_top">
				<div class="mwl_title">
					<span>영상 바로가기</span>
				</div>
				<div class="mwl_content">
					<div><button onclick="location.href = '${root}/admin/video_write'">나무 영상 등록</button></div>
					<div><button onclick="location.href = '${root}/admin/ar_write'">나무 AR 등록</button></div>
				</div>
			</div>
			<div class="mw_left_01 mw_left_inner">
				<div class="mwl_title">
					<span>웹툰 바로가기</span>
				</div>
				<div class="mwl_content">
					<div><button onclick="location.href = '${root}/admin/webtoon_write'">웹툰 등록</button></div>
				</div>
			</div>
			<div class="mw_left_01 mw_left_inner">
				<div class="mwl_title">
					<span>내 정보 바로가기</span>
				</div>
				<div class="mwl_content">
					<div><a href="${root }/change_memberinfo" target="_blank"><button>회원 정보 수정</button></a></div>
					<div><a href="${root }/change_pw" target="_blank"><button>비밀번호 변경</button></a></div>
				</div>
			</div>
		</div>
		
		<div class="mw_right">
			<div class="mwr_icon">
				<img src="${root }/img/view/admin/sample_member_icon.png">
			</div>
			<div class="mwr_id">
				<span>${member.id }님</span>
			</div>
			<div class="mwr_info">
				<table class="mwr_table">
					<tbody class="mwr_tbody">
						<tr class="mwr_tr">
							<td class="f_td">공급자 아이디</td>
							<td class="s_td">${member.id }</td>
						</tr>
						<tr class="mwr_tr">
							<td class="f_td">공급자 이름</td>
							<td class="s_td">${member.name }</td>
						</tr>
						<tr class="mwr_tr">
							<td class="f_td">공급자 접속시간</td>
							<td class="s_td">${member.login_time }</td>
						</tr>
						<tr class="mwr_tr">
							<td class="f_td">공급자 권한</td>
							<td class="s_td"><button>producer</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="mwr_logout">
				<button onclick="location.href = '${root}/admin/logout'">로그아웃</button>
			</div>
		</div>

	</div>
</div>

</body>
</html>