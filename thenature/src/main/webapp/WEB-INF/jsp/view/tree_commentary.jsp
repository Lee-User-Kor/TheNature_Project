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

.commentary_tab {
	width: 65px;
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

.card_tab {
	width: 65px;
	color: #707070;
	font-size: 17px;
	font-weight: bold;
}

.space_tab {
	width: 840px;
}

.sort_div {
	text-align: right;
	margin: 10px 0;
}

.sort_select {
	width: 130px;
	height: 34px;
	border: 1px solid #272727;
	color: #272727;
	font-size: 15px;
	padding-left: 10px;
	outline: none;
}

.ctnt_list {
	display: flex;
	flex-flow: wrap;
	justify-content: space-between;
}

.ctnt_each {
	width: 320px;
	height: 232px;
	margin: 20px 0;
/* 	margin-bottom: 20px; */
}

.ce_img_div {
	width: 320px;
	height: 200px;
	overflow: hidden;
}

.ce_img_div img {
	width: 320px;
	height: 200px;
	transition: all 200ms linear;
	cursor: pointer;
}

.ce_img_div img:hover {
	transform: scale(1.1);
}

.ce_name {
	border: 1px solid #707070;
	text-align: center;
	color: #333333;
	font-size: 16px;
	font-weight: bold;
	height: 30px;
	line-height: 30px;
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
			<div class="commentary_tab inner_tab"><a href="${root }/tree_commentary">나무해설</a></div>
			<div class="line_tab inner_tab">|</div>
			<div class="card_tab inner_tab"><a href="${root }/tree_card">나무카드</a></div>
			<div class="space_tab inner_tab"></div>
		</div>
<!-- 		<div class="sort_div"> -->
<!-- 			<select class="sort_select"> -->
<!-- 				<option>침엽수</option> -->
<!-- 			</select> -->
<!-- 		</div> -->
		<div class="ctnt_list">
			<c:forEach items="${treeCommentaryVO }" var="tcVO">
				<div class="ctnt_each">
					<div class="ce_img_div">
						<a href="${root }/tree_commentary_detail?no=${tcVO.idx}"><img src="${root }/tree_commentary_file/${tcVO.thumnail }"></a>
					</div>
					<div class="ce_name"><a href="${root }/tree_commentary_detail">${tcVO.tree_name }</a></div>
				</div>
			</c:forEach>
<!-- 			<div class="ctnt_each"> -->
<!-- 				<div class="ce_img_div"> -->
<%-- 					<a href="${root }/tree_commentary_detail"><img src="${root }/img/view/tree/jajak_tree.png"></a> --%>
<!-- 				</div> -->
<%-- 				<div class="ce_name"><a href="${root }/tree_commentary_detail">자작나무</a></div> --%>
<!-- 			</div> -->
<!-- 			<div class="ctnt_each"> -->
<!-- 				<div class="ce_img_div"> -->
<%-- 					<a href="${root }/tree_commentary_detail"><img src="${root }/img/view/tree/jajak_tree.png"></a> --%>
<!-- 				</div> -->
<%-- 				<div class="ce_name"><a href="${root }/tree_commentary_detail">자작나무</a></div> --%>
<!-- 			</div> -->
<!-- 			<div class="ctnt_each"> -->
<!-- 				<div class="ce_img_div"> -->
<%-- 					<a href="${root }/tree_commentary_detail"><img src="${root }/img/view/tree/jajak_tree.png"></a> --%>
<!-- 				</div> -->
<%-- 				<div class="ce_name"><a href="${root }/tree_commentary_detail">자작나무</a></div> --%>
<!-- 			</div> -->
<!-- 			<div class="ctnt_each"> -->
<!-- 				<div class="ce_img_div"> -->
<%-- 					<a href="${root }/tree_commentary_detail"><img src="${root }/img/view/tree/jajak_tree.png"></a> --%>
<!-- 				</div> -->
<%-- 				<div class="ce_name"><a href="${root }/tree_commentary_detail">자작나무</a></div> --%>
<!-- 			</div> -->
<!-- 			<div class="ctnt_each"> -->
<!-- 				<div class="ce_img_div"> -->
<%-- 					<a href="${root }/tree_commentary_detail"><img src="${root }/img/view/tree/jajak_tree.png"></a> --%>
<!-- 				</div> -->
<%-- 				<div class="ce_name"><a href="${root }/tree_commentary_detail">자작나무</a></div> --%>
<!-- 			</div> -->
<!-- 			<div class="ctnt_each"> -->
<!-- 				<div class="ce_img_div"> -->
<%-- 					<a href="${root }/tree_commentary_detail"><img src="${root }/img/view/tree/jajak_tree.png"></a> --%>
<!-- 				</div> -->
<%-- 				<div class="ce_name"><a href="${root }/tree_commentary_detail">자작나무</a></div> --%>
<!-- 			</div> -->
<!-- 			<div class="ctnt_each"> -->
<!-- 				<div class="ce_img_div"> -->
<%-- 					<a href="${root }/tree_commentary_detail"><img src="${root }/img/view/tree/jajak_tree.png"></a> --%>
<!-- 				</div> -->
<%-- 				<div class="ce_name"><a href="${root }/tree_commentary_detail">자작나무</a></div> --%>
<!-- 			</div> -->
<!-- 			<div class="ctnt_each"> -->
<!-- 				<div class="ce_img_div"> -->
<%-- 					<a href="${root }/tree_commentary_detail"><img src="${root }/img/view/tree/jajak_tree.png"></a> --%>
<!-- 				</div> -->
<%-- 				<div class="ce_name"><a href="${root }/tree_commentary_detail">자작나무</a></div> --%>
<!-- 			</div> -->
		</div>
	</div>
	
	<div class="paging">
	    <c:if test="${paging.nowPage != 1 }">
	    	<a href="tree_commentary?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
	    	<a href="tree_commentary?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
	    </c:if>
	    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		    <c:choose>
		    	<c:when test="${p == paging.nowPage }">
					<div class="num">${p }</div>                			
		    	</c:when>
		    	<c:when test="${p != paging.nowPage }">
		    		<a href="tree_commentary?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
		    	</c:when>
		    </c:choose>
	    </c:forEach>
	    <c:if test="${paging.nowPage != paging.lastPage }">
	    	<a href="tree_commentary?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
	    	<a href="tree_commentary?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
	    </c:if>
	</div>
	
</div>



<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>