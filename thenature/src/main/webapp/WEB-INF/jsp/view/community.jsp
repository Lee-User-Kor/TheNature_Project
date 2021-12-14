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
	.community_main {
		width: 1000px;
		margin: auto;
		margin-top: 80px;
		margin-bottom: 80px;
	}
	.community_kind {
		width: 100%;
		display: flex;
		justify-content: space-between;
		margin-bottom: 35px;
	}
	.community_kind > .go_community {
		width: 10%;
		color: #5C8E46;
		font-weight: bold;
		padding-bottom: 15px;
		text-align: center;
		border-bottom: 2px solid #5C8E46;
		cursor: pointer;
	}
	.community_kind > .blank {
		width: 90%;
		border-bottom: 1px solid #707070; 
	}
	.community_list {
		width: 100%;
		font-size: 13px;
		border-collapse: collapse;
        margin-bottom: 30px;
	}
	.community_list th, .community_list td {
		border-bottom: 1px solid #707070;
        padding: 15px;
	}
	.community_list th {
		border-top: 1px solid #707070;
		background-color: #EDEDED;
	}
	.community_list th:first-child {
		width: 12%;
	}
	.community_list td {
		text-align: center;
	}
	.community_list th:nth-child(2) {
		text-align: left;
		padding-left: 50px;
	}
	.community_list td:nth-child(2) {
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
	.tbm_write_div {
		margin-left: 526px;
	}
	.tbm_write_div button {
		width: 100px;
		height: 31px;
		border: 1px solid #5C8E46;
		color: #5C8E46;
		background-color: white;
		font-weight: bold;
	}
	.tbm_write_div button:hover {
		cursor: pointer;
		color: white;
		background-color: #5C8E46;
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
	function goCommunity() {
		location.href = 'community'
	}
</script>
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp" />

<div class="community_main">
	<div class="community_kind">
		<div class="go_community" onclick="goCommunity()">커뮤니티</div>
		<div class="blank"></div>
	</div>
	
	<table class="community_list">
		<tr>
			<th>NO</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${cVOList }" var="cVO_list">
			<tr>
				<td>${cVO_list.idx }</td>
				<td><a href="community_detail?idx=${cVO_list.idx }">${cVO_list.title }</a></td>
				<td>${cVO_list.write_date }</td>
				<td>${cVO_list.view_count }</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="table_bottom_menu">
		<div class="board_search">
		<form id="search_form" style="display: flex;">
		   	<div class="board_search_input">
		    	<input type="text" name="search_keyword">
		   	</div>
			<div class="board_search_btn">
		    	<div class="search_img"></div>
		    </div>
		    <div class="board_search_kind" onclick="searchSubmit()">
		       <select>
		           <option value="title">제목</option>
		       </select>
		    </div>
		</form>
		<script>
			function searchSubmit() {
				document.getElementById('search_form').submit()
			}
		</script>
		</div>
		<div class="tbm_write_div">
			<button onclick="location.href = '${root}/community_write'">글 쓰기</button>
		</div>
	</div>
	
	<div class="paging">
	    <c:if test="${paging.nowPage != 1 }">
	    	<a href="community?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
	    	<a href="community?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
	    </c:if>
	    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		    <c:choose>
		    	<c:when test="${p == paging.nowPage }">
					<div class="num">${p }</div>                			
		    	</c:when>
		    	<c:when test="${p != paging.nowPage }">
		    		<a href="community?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
		    	</c:when>
		    </c:choose>
	    </c:forEach>
	    <c:if test="${paging.nowPage != paging.lastPage }">
	    	<a href="community?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
	    	<a href="community?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
	    </c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>
</body>
</html>