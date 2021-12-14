<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
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
	.mypage_wrap {
		width: 100%;
	}
	.wrap {
		width: 1000px;
		margin: 100px auto;
	}
	.category_tab {
		display: flex;
		margin-bottom: 40px;
	}
	.inner_tab {
		padding: 10px 0;
		border-bottom: 1px solid #707070;
		font-size: 17px;
		font-weight: bold;
		text-align: center;
	}
	.change_memberinfo_tab {
		color: #5C8E46;
		width: 100px;
		border-bottom: 3px solid #5C8E46;
	}
	.change_pw_tab {
		width: 100px;
	}
	.my_posting_tab {
		width: 90px;
	}
	.manage_point_tab {
		width: 90px;
	}
	.present_check_tab {
		width: 75px;
	}
	.line_tab {
		padding: 10px 0;
		width: 30px;
		text-align: center;
		color: #707070;
	}
	.space_tab {
		width: 425px;
	}
	.password_check_main {
		width: 100%;
		height: 300px;
		border: 1px solid #707070;
		display: flex;
		flex-flow: column;
		align-items: center;
		justify-content: center;
	}
	.password_check_form {
		text-align: center;
	}
	.password_check_form p {
		margin: 0;
		margin-bottom: 5px;
		font-size: 15px;
	}
	.password_check_form > input[type="password"] {
		all: unset;
		width: 300px;
		margin-top: 20px;
		padding: 10px;
		font-size: 13px;
		border: 2px solid #B0B0B0;
		text-align: left;
	}
	.password_check_form > input[type="submit"] {
		all: unset;
		padding: 10px 25px;
		font-size: 13px;
		font-weight: bold;
		background-color: #F4F2F2;
		border: 2px solid #F4F2F2;
		cursor: pointer;
	}
</style>
</head>
<body>
<c:if test="${empty member }">
	<script>
		alert('로그인이 필요한 기능입니다.')
		location.href = '${root}/login'
	</script>
</c:if>


<c:set var="mode" value="${param.mode }" />
<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp"/>

<div class="mypage_wrap">
	<div class="wrap">
		<div class="category_tab">
			<div class="change_memberinfo_tab inner_tab"><a href="${root }/mypage?mode=info">회원정보수정</a></div>
			<div class="line_tab inner_tab">|</div>
			<div class="change_pw_tab inner_tab"><a href="${root }/mypage?mode=pw">비밀번호수정</a></div>			
			<div class="line_tab inner_tab">|</div>
			<div class="my_posting_tab inner_tab"><a href="${root }/my_posting">게시글관리</a></div>
			<div class="line_tab inner_tab">|</div>
			<div class="manage_point_tab inner_tab"><a href="${root }/manage_point">포인트관리</a></div>
			<div class="line_tab inner_tab">|</div>
			<div class="present_check_tab inner_tab"><a href="${root }/present_check">출석체크</a></div>
			<div class="space_tab inner_tab"></div>
		</div>
		<script>
			var mode = '${mode}'
			var infoDiv = document.querySelector('.change_memberinfo_tab')
			var pwDiv = document.querySelector('.change_pw_tab')
			if (mode == 'pw') {
				infoDiv.style.color = 'black'
				infoDiv.style.borderBottom = '1px solid #707070'
				pwDiv.style.color = '#5C8E46'
				pwDiv.style.borderBottom = '3px solid #5C8E46'
			}
		</script>
		<div class="password_check_main">
			<form class="password_check_form" method="POST">
				<p>본인 확인을 위해 비밀번호를 입력해주세요.</p>
				<p>비밀번호는 타인에게 노출되지 않도록 주의해주세요.</p>
<%-- 				<input type="hidden" name="member_userid" value="${member.member_userid }"> --%>
				<input type="hidden" name="modeWhat" value="${mode }">
				<input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
				<input type="submit" value="확인">
			</form>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>


</body>
</html>