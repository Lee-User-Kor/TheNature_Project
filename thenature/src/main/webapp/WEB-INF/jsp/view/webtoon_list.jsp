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
.total_wrap {
	width: 100%;
}

.wrap {
	width: 1000px;
	margin: 100px auto;
}

.category_tab {
	display: flex;
}

.inner_tab {
	padding: 10px 0;
	border-bottom: 1px solid #707070;
}

.webtoon_tab {
	width: 70px;
	color: #5C8E46;
	font-size: 17px;
	font-weight: bold;
	border-bottom: 3px solid #5C8E46;
}

.space_tab {
	width: 930px;
}

.ctnt_top {
	display: flex;
	margin: 20px 0;
}
.ctntt_left {
	width: 300px;
	margin-right: 20px;
}
.ctntt_right {
	position: relative;
}
.ctntt_left img {
	width: 300px;
	border-radius: 10px;
}
.ctnttr_title {
	font-size: 20px;
	font-weight: bold;
	color: #272727;
}
.ctnttr_content {
	font-size: 15px;
	color: #272727;
	line-height: 25px;
	margin: 20px 0;
}
.ctnttr_star_point_div img {
	vertical-align: bottom;
}
.ctnttr_star_point_div span {
	font-size: 15px;
	font-weight: bold;
	margin-left: 10px;
}
.ctnttr_btn_div {
	position: absolute;
	bottom: 5px;
}
.view_fisrt_ctnt_btn {
	width: 100px;
	height: 35px;
	border: none;
	color: white;
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	padding: 5px 15px;
	background-color: #35600C;
	border-radius: 5px;
	cursor: pointer;
}
.ctnt_bot {
	border-top: 1px solid #707070;
}
.ctntb_each {
	border-bottom: 1px solid #707070;
	padding: 30px 0;
	display: flex;
}
.ctntbe_img_div {
	width: 160px;
}
.ctntbe_img_div img {
	width: 160px;
	border-radius: 5px;
}
.ctntbe_num {
	text-align: center;
	font-size: 17px;
	color: #272727;
	margin: 0 30px;
	display: table;
}
.ctntbe_num span {
	display: table-cell;
	vertical-align: middle;
}
.ctntbe_title {
	width: 410px;
	display: table;
	font-size: 17px;
	color: #272727;
}
.ctntbe_title span {
	display: table-cell;
	vertical-align: middle;
}
.ctntbe_sp {
	width: 175px;
	text-align: center;
	display: table;
}
.ctntbe_sp span {
	display: table-cell;
	vertical-align: middle;
	font-size: 14px;
} 
.ctntbe_sp img {
	width: 18px;
	height: 17px;
}
.ctntbe_date_div {
	display: table;
	width: 100px;
	text-align: center;
	margin-left: 25px;
	font-size: 12px;
	color: #707070;
}
.ctntbe_date_div span {
	display: table-cell;
	vertical-align: middle;
}
/* 페이징 */
.paging {
	display: flex;
	justify-content: center;
}
.paging>a {
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
.paging>div {
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
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp"/>

<div class="total_wrap">
	<div class="wrap">
		<div class="category_tab">
			<div class="webtoon_tab inner_tab"><a href="${root }/tree_webtoon?mode=all">나무 웹툰</a></div>
			<div class="space_tab inner_tab"></div>
		</div>
		<div class="ctnt_top">
			<div class="ctntt_left">
				<img src="${root }/webtoon_file/${wVO.thumbnail}">
			</div>
			<div class="ctntt_right">
				<div class="ctnttr_title">${wVO.title }</div>
				<div class="ctnttr_content">${wVO.content }</div>
				<div class="ctnttr_btn_div">
					<button class="view_fisrt_ctnt_btn" onclick="location.href = '${root}/webtoon_detail?title=${wVO.title }&round=1'">첫회보기</button>
				</div>
			</div>
		</div>
		<div class="ctnt_bot">
			<c:forEach items="${wdVOList }" var="wdVO_list">
			<div class="ctntb_each">
				<div class="ctntbe_img_div">
					<img src="${root }/webtoon_file/${wdVO_list.thumbnail}">
				</div>
				<div class="ctntbe_num"><span>${wdVO_list.round }화</span></div>
				<div class="ctntbe_title"><span><a href="${root }/webtoon_detail?title=${wdVO_list.bw_title }&round=${wdVO_list.round}">${wdVO_list.title }</a></span></div>
				<div class="ctntbe_date_div">
					<span>${wdVO_list.add_date }</span>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="paging">
	    <c:if test="${paging.nowPage != 1 }">
	    	<a href="webtoon_list?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
	    	<a href="webtoon_list?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
	    </c:if>
	    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		    <c:choose>
		    	<c:when test="${p == paging.nowPage }">
					<div class="num">${p }</div>                			
		    	</c:when>
		    	<c:when test="${p != paging.nowPage }">
		    		<a href="webtoon_list?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
		    	</c:when>
		    </c:choose>
	    </c:forEach>
	    <c:if test="${paging.nowPage != paging.lastPage }">
	    	<a href="webtoon_list?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
	    	<a href="webtoon_list?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
	    </c:if>
	</div>
	
</div>



<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>