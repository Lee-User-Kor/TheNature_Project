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
	.notice_main {
		width: 1000px;
		margin: auto;
		margin-top: 80px;
		margin-bottom: 80px;
	}
	.notice_qna_kind {
		width: 100%;
		display: flex;
		justify-content: space-between;
		margin-bottom: 35px;
	}
	.notice_qna_kind > .go_notice {
		width: 10%;
		color: #5C8E46;
		font-weight: bold;
		padding-bottom: 15px;
		text-align: center;
		border-bottom: 2px solid #5C8E46;
		cursor: pointer;
	}
	.notice_qna_kind > .centerline {
		font-weight: bold;
		color: #707070;
		border-bottom: 1px solid #707070;
	}
	.notice_qna_kind > .go_qna {
		width: 10%;
		color: #707070;
		font-weight: bold;
		padding-bottom: 15px;
		text-align: center;
		border-bottom: 1px solid #707070;
		cursor: pointer;
	}
	.notice_qna_kind > .blank {
		width: 80%;
		border-bottom: 1px solid #707070; 
	}
	.notice_list {
		width: 100%;
		font-size: 13px;
		border-collapse: collapse;
        margin-bottom: 30px;
	}
	.notice_list th, .notice_list td {
		border-bottom: 1px solid #707070;
        padding: 15px;
	}
	.notice_list th {
		border-top: 1px solid #707070;
		background-color: #EDEDED;
	}
	.notice_list th:first-child {
		width: 12%;
	}
	.notice_list td {
		text-align: center;
	}
	.notice_list th:nth-child(2) {
		text-align: left;
		padding-left: 50px;
	}
	.notice_list td:nth-child(2) {
		text-align: left;
		padding-left: 40px;
	}
	.table_bottom_menu {
		display: flex;
		margin-bottom: 30px;
	}
	.table_bottom_menu > .board_search {
		display: flex;
	}
	.table_bottom_menu > .board_search > form {
		display: flex;
	}
	.board_search_input {
		padding: 8px;
		border: 1.5px solid #707070;
		font-size: 12px;
		border-right: none;
		width: 200px;
	}
	.board_search_input > input {
		all: unset;
		width: 95%;
		outline: none;
		font-size: 12px;
	}
	.board_search_btn {
		width: 14px;
		height: 14px;
		padding: 8px;
		border: 1.5px solid #707070;
		border-left: none;
	}
	.board_search_btn > .search_img {
		width: 14px;
		height: 14px;
		background-image: url('img/view/board/search_icon.svg');
		background-position: center center;
		background-repeat: no-repeat;
		cursor: pointer;
	}
	.board_search_kind {
		margin-left: 5px;
	}
	.board_search_kind > select {
		width: 120px;
        height: 33px;
        border: 1px solid #707070;
        text-align: center;
        font-size: 12px;
        outline: none;
	}
	/* 페이징 */
	.paging {
        display: flex;
        justify-content: center;
    }
    .paging > a {
    	width: 20px;
    	height: 20px;
    	padding: 10px;
        border: 1px solid #EDED;
        font-size: 13px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .paging > div {
    	background-color: #444547; 
    	color: white; 
    	padding: 10px;
		width: 20px; 
		height: 20px; 
		display: flex; 
		justify-content: center;
		border: 1px solid #EDED;
    }
    /* 페이징 */
</style>
</head>
<script>
	function goNotice() {
		location.href = 'notice'
	}
	function goQna() {
		location.href = 'qna'
	}
</script>
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp" />

<div class="notice_main">
	<div class="notice_qna_kind">
		<div class="go_notice" onclick="goNotice()">공지사항</div>
		<div class="centerline">|</div>
		<div class="go_qna" onclick="goQna()">1:1문의</div>
		<div class="blank"></div>
	</div>
	
	<table class="notice_list">
		<tr>
			<th>NO</th>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		<c:forEach items="${noticeList }" var="notice_list">
			<tr>
				<td>${notice_list.idx }</td>
				<td><a href="notice_detail?no=${notice_list.idx }">${notice_list.title }</a></td>
				<td>${notice_list.write_date }</td>
			</tr>
		</c:forEach>
<!-- 		<tr> -->
<!-- 			<td>2</td> -->
<!-- 			<td><a href="notice_detail">키우는 나무가 너무 상태가 안좋아졌어요 ㅠㅠ</a></td> -->
<!-- 			<td>2021/05/11</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>3</td> -->
<!-- 			<td><a href="notice_detail">온 지 얼마 안됐어요.</a></td> -->
<!-- 			<td>2021/05/11</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>4</td> -->
<!-- 			<td><a href="notice_detail">편하게 키울 만한 나무는?</a></td> -->
<!-- 			<td>2021/05/11</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>5</td> -->
<!-- 			<td><a href="notice_detail">ㅋㅋㅋㅋ우리집 강아지가 나무를 참 좋아해</a></td> -->
<!-- 			<td>2021/05/11</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>6</td> -->
<!-- 			<td><a href="notice_detail">영양제 싸게 구입하는 방법</a></td> -->
<!-- 			<td>2021/05/11</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>7</td> -->
<!-- 			<td><a href="notice_detail">이거 앱도 편하던데?</a></td> -->
<!-- 			<td>2021/05/11</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>8</td> -->
<!-- 			<td><a href="notice_detail">여름철과 겨울철 나무 어떤거 키우죠?</a></td> -->
<!-- 			<td>2021/05/11</td> -->
<!-- 		</tr> -->
	</table>
	
	<div class="table_bottom_menu">
		<div class="board_search">
		<form class="searchform">
		   <div class="board_search_input">
		       <input type="text" name="search_keyword" placeholder="제목으로 검색하세요.">
		   </div>
		   <div class="board_search_btn">
		       <div class="search_img" onclick="searchSubmit()"></div>
		   </div>
		</form>
		<script>
			function searchSubmit() {
				document.querySelector('.searchform').submit()
			}
		</script>
		   <div class="board_search_kind">
		       <select>
		           <option value="title">제목</option>
		       </select>
		   </div>
		</div>
	</div>
	
	<div class="paging">
	    <c:if test="${paging.nowPage != 1 }">
	    	<a href="notice?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
	    	<a href="notice?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
	    </c:if>
	    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		    <c:choose>
		    	<c:when test="${p == paging.nowPage }">
					<div class="num">${p }</div>                			
		    	</c:when>
		    	<c:when test="${p != paging.nowPage }">
		    		<a href="notice?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
		    	</c:when>
		    </c:choose>
	    </c:forEach>
	    <c:if test="${paging.nowPage != paging.lastPage }">
	    	<a href="notice?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
	    	<a href="notice?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
	    </c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>