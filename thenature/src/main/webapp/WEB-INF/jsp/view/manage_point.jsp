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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	.my_posting_wrap {
		margin-bottom: 199px;
	}
	.change_memberinfo_wrap {
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
		width: 100px;
	}
	.change_pw_tab {
		width: 100px;
	}
	.my_posting_tab {
		width: 90px;
	}
	.manage_point_tab {
		width: 90px;
		color: #5C8E46;
		border-bottom: 3px solid #5C8E46;
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
	.posting_list {
		width: 100%;
    	border-collapse: collapse;
    	margin-bottom: 50px;
	}
	.posting_list th,
	.posting_list td {
		font-size: 12px;
     	padding: 10px;
    	border-bottom: 1px solid #707070;
	}
	.posting_list th {
		font-size: 13px;
    	border-top: 1px solid #707070;
     	padding: 13px 10px;
    	background-color: #EDEDED;
	}
	.posting_list td {
		text-align: center;
	}
	.posting_list th:first-child {
		width: 8%;
	}
	.posting_list th:nth-child(3) {
		width: 8%;
	}
	.posting_list th:nth-child(2) {
		width: 40%;
		text-align: inherit;
 		padding-left: 50px; 
	}
	.posting_list th:nth-child(4) {
		width: 12%;
	}
	.posting_list th:last-child {
		width: 12%;
	}
	.posting_list td:nth-child(2) {
		text-align: inherit;
 		padding-left: 45px; 
	}
	.posting_option_btn {
		display: flex;
	}
	.posting_option_btn > .modify {
		font-size: 13px;
		font-weight: bold;
		border: 1px solid #35600C;
		padding: 5px 35px;	
		cursor: pointer;
		margin-right: 10px;	
		color: #35600C;
	}
	.posting_option_btn > .cancel {
		background-color: #35600C;
		font-size: 13px;
		font-weight: bold;
		border: 1px solid #35600C;
		padding: 5px 35px;	
		cursor: pointer;
		margin-right: 10px;	
		color: white;
	}
</style>
<script>
//체크박스 전체선택/해제
function checkSelectAll() {
	const checkboxes = document.querySelectorAll('.checkbox_manage_posting')
	const checked = document.querySelectorAll('.checkbox_manage_posting:checked')
	const selectAll = document.querySelector('.checkbox_controller')
	
	if(checkboxes.length === checked.length) {
		selectAll.checked = true
	} else {
		selectAll.checked = false;
	}
}

function selectAll(selectAll) {
	const checkboxes = document.getElementsByName('checkbox_each')
	
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
	})
}	
</script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp"/>

<div class="my_posting_wrap">
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
		<table class="posting_list">
        	<tr>
        		<th>NO</th>
        		<th>내역</th>
        		<th>적립일</th>
        		<th>포인트</th>
        	</tr>
        	<c:forEach items="${pointVO }" var="point_list" varStatus="st">
	        	<tr>
	        		<td>${point_list.idx }</td>
	        		<td><a href="">${point_list.content }</a></td>
	        		<td>${point_list.point_date }</td>
	        		<td>${point_list.point_what == 'p' ? '+' : '-' }${point_list.point }P</td>
	        	</tr>
        	</c:forEach>
        </table>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>


</body>
</html>