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

.sort_div {
	margin: 20px 0;
}
.sort_div span {
	font-size: 14px;
	font-weight: bold;
/* 	color: #707070; */
}
/* .sort_all { */
/* 	color: #5C8E46 !important; */
/* } */
.ctnt_list {
	display: flex;
	flex-flow: wrap;
	justify-content: space-between;
}
.ctnt_each {
	width: 230px;
	margin-bottom: 50px;
}
.ce_img_div {
	width: 230px;
	overflow: hidden;
}
.ce_img_div img {
	width: 230px;
	transition: all 200ms linear;
}
.ce_img_div img:hover {
	cursor: pointer;
	transform: scale(1.1);
}
.ce_title_div {
	display: flex;
	justify-content: space-between;
	margin: 10px 0;
}
.ce_title {
	font-size: 13px;
	font-weight: bold;
}
.ce_like {
	font-size: 12px;
}
.ce_like img {
	vertical-align: middle;
	cursor: pointer;
}
.ce_like span {
	margin-left: 5px;
}
.ce_view_cnt_div {
	font-size: 11px;
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

<c:set var="mode" value="${param.mode }"/>
<div class="total_wrap">
	<div class="wrap">
		<div class="category_tab">
			<div class="webtoon_tab inner_tab"><a href="${root }/tree_webtoon?mode=all">나무 웹툰</a></div>
			<div class="space_tab inner_tab"></div>
		</div>
		<div class="sort_div">
			<span class="sort_all"><a href="${root }/tree_webtoon?mode=all">전체</a></span>
			<span style="color: #707070;">|</span>
			<span class="sort_pop"><a href="${root }/tree_webtoon?mode=pop">인기순</a></span>
			<script>
				var pop = document.querySelector('.sort_pop')
				var all = document.querySelector('.sort_all')
				if(${mode == 'pop'}) {
					pop.style.color = '#5C8E46'
					all.style.color = '#707070'
				}else {
					pop.style.color = '#707070'
					all.style.color = '#5C8E46'
				}			
			</script>
		</div>
		<div class="ctnt_list">
			<c:forEach items="${wVOList }" var="wVO_list">
			<div class="ctnt_each">
				<input type="hidden" value="${wVO_list.idx }">
				<div class="ce_img_div">
					<a href="${root }/webtoon_list?title=${wVO_list.title}"><img src="${root }/webtoon_file/${wVO_list.thumbnail }"></a>
				</div>
				<div class="ce_title_div">
					<div class="ce_title"><a href="${root }/webtoon_list?title=${wVO_list.title}">${wVO_list.title }</a></div>
					<div class="ce_like">
						<c:if test="${not empty member }">
							<c:if test="${wVO_list.isLike ==  'n' or wVO_list.isLike == null }">
								<img src="${root }/img/view/webtoon/icon_like_clear.png" onclick="likeHandler(event)">
							</c:if>
							<c:if test="${wVO_list.isLike ==  'y'}">
								<img src="${root }/img/view/webtoon/icon_like_full.png" onclick="likeHandler(event)">
							</c:if>
						</c:if>
						<c:if test="${empty member }">
							<img src="${root }/img/view/webtoon/icon_like_clear.png" onclick="likeHandler(event)">
						</c:if>
						<span>${wVO_list.like_count }</span>
					</div>
				</div>
<!-- 				<div class="ce_view_cnt_div">조회수 10 회</div> -->
			</div>
			</c:forEach>
		</div>
		<script>
			function likeHandler(event) {
				if('${member == null}' == 'true') {
					alert('로그인이 필요한 기능입니다.')
					return
				}
				
				var member_idx = '${member.idx}'
				var table_idx = event.target.parentNode.parentNode.parentNode.querySelector('input').value
				var table_name = 'board_webtoon'
				
				var src = event.target.src
				if(src.indexOf('clear') != -1) {
					event.target.src = '${root}/img/view/webtoon/icon_like_full.png'
						$.ajax({
							type: "POST",
							url: "ajax_like_activate_webtoon",
							data: { member_idx : member_idx,
								table_idx : table_idx,
								table_name : table_name
							},
							dataType: "text",
							success: function(result) {
								if(result == 1) {							
								}else {
									alert('좋아요 실패')
								}
							},
							error:function(request,status,error){
								console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						})
				}else {
					event.target.src = '${root}/img/view/webtoon/icon_like_clear.png'
						$.ajax({
							type: "POST",
							url: "ajax_like_deactivate_webtoon",
							data: { member_idx : member_idx,
								table_idx : table_idx,
								table_name : table_name
							},
							dataType: "text",
							success: function(result) {
								if(result == 1) {							
								}else {
									alert('좋아요 취소 실패')
								}
							},
							error:function(request,status,error){
							    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						})
				}
			}
		</script>
	</div>
	
	<div class="paging">
	    <c:if test="${paging.nowPage != 1 }">
	    	<a href="tree_webtoon?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
	    	<a href="tree_webtoon?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
	    </c:if>
	    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		    <c:choose>
		    	<c:when test="${p == paging.nowPage }">
					<div class="num">${p }</div>                			
		    	</c:when>
		    	<c:when test="${p != paging.nowPage }">
		    		<a href="tree_webtoon?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
		    	</c:when>
		    </c:choose>
	    </c:forEach>
	    <c:if test="${paging.nowPage != paging.lastPage }">
	    	<a href="tree_webtoon?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
	    	<a href="tree_webtoon?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
	    </c:if>
	</div>
	
</div>



<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>