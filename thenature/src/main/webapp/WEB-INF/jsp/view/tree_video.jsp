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

.video_tab {
	width: 70px;
	color: #5C8E46;
	font-size: 17px;
	font-weight: bold;
	border-bottom: 3px solid #5C8E46;
}

.line_tab {
	padding: 10px 0;
	width: 30px;
	text-align: center;
	color: #707070;
}

.ar_tab {
	width: 70px;
	color: #707070;
	font-size: 17px;
	font-weight: bold;
}

.space_tab {
	width: 830px;
}

.ctnt_list {
	display: flex;
	flex-flow: wrap;
	justify-content: space-between;
	margin: 40px 0;
}
.ctnt_each {
	width: 310px;
	margin-bottom: 30px;
}
.ce_video_div {
	width: 310px;
	border-radius: 30px;
	overflow: hidden;
}
.ce_video_div video {
	width: 310px;
	border-radius: 30px;
}
.ce_title {
	font-size: 15px;
	color: #272727;
	padding: 5px 20px;
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
			<div class="video_tab inner_tab"><a href="${root }/tree_video">나무 영상</a></div>
			<div class="line_tab inner_tab">|</div>
			<div class="ar_tab inner_tab"><a href="${root }/tree_ar">나무 AR</a></div>
			<div class="space_tab inner_tab"></div>
		</div>
		<div class="ctnt_list">
			<c:forEach items="${tvVO }" var="tvVO">
			<div class="ctnt_each">
				<div class="ce_video_div">
					<video src="${root }/tree_video/${tvVO.video_path }" poster="${root }/tree_video/${tvVO.thumbnail }" controls="controls"></video>
				</div>
				<div class="ce_title"><a>${tvVO.title }</a></div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="paging">
	    <c:if test="${paging.nowPage != 1 }">
	    	<a href="tree_video?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
	    	<a href="tree_video?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
	    </c:if>
	    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		    <c:choose>
		    	<c:when test="${p == paging.nowPage }">
					<div class="num">${p }</div>                			
		    	</c:when>
		    	<c:when test="${p != paging.nowPage }">
		    		<a href="tree_video?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
		    	</c:when>
		    </c:choose>
	    </c:forEach>
	    <c:if test="${paging.nowPage != paging.lastPage }">
	    	<a href="tree_video?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
	    	<a href="tree_video?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
	    </c:if>
	</div>
	
</div>



<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>