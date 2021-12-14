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
	color: #707070;
	font-size: 17px;
	font-weight: bold;
}

.line_tab {
	padding: 10px 0;
	width: 30px;
	text-align: center;
	color: #707070;
}

.card_tab {
	width: 65px;
	color: #5C8E46;
	font-size: 17px;
	font-weight: bold;
	border-bottom: 3px solid #5C8E46;
}

.space_tab {
	width: 840px;
}
.ctnt_list {
	display: flex; 
/* 	justify-content: space-between; */
	flex-wrap: wrap;
	width: 100%;
	margin: 20px 0;
}
.ctnt_each {
	width: 190px; 
	margin-right: 10px;
}
.ctnt_each img {
	width: 190px;
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
		<div class="ctnt_wrap">
			<c:forEach items="${categoryArr }" var="categoryArr">
				<div class="ctnt_list">
					<c:forEach items="${cardVO }" var="cardVO">
						<c:if test="${categoryArr == cardVO.category }">
							<div class="ctnt_each">
								<img src="${root }/tree_card_file/${cardVO.img_path }">
								<input type="hidden" name="card_name" class="card_name" value="${cardVO.category }">
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
					<script>
						
					</script>
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard1_2.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard1_3.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard1_4.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard1_5.png"> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="ctnt_list"> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard2_1.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard2_2.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard2_3.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard2_4.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard2_5.png"> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="ctnt_list"> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard3_1.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard3_2.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard3_3.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard3_4.png"> --%>
<!-- 				</div> -->
<!-- 				<div class="ctnt_each"> -->
<%-- 					<img src="${root }/img/view/tree/gcard3_5.png"> --%>
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>
	
	<div class="paging">
	    <c:if test="${paging.nowPage != 1 }">
	    	<a href="tree_card?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
	    	<a href="tree_card?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
	    </c:if>
	    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		    <c:choose>
		    	<c:when test="${p == paging.nowPage }">
					<div class="num">${p }</div>                			
		    	</c:when>
		    	<c:when test="${p != paging.nowPage }">
		    		<a href="tree_card?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
		    	</c:when>
		    </c:choose>
	    </c:forEach>
	    <c:if test="${paging.nowPage != paging.lastPage }">
	    	<a href="tree_card?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
	    	<a href="tree_card?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
	    </c:if>
	</div>
	
</div>



<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>