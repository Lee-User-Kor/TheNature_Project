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
		margin: 0;
		padding: 0;
		width: 100%;
		font-family: 'Nanum Gothic', sans-serif;
		background-color: #EBEBEB;
	}
	a {
		text-decoration: none;
		color: inherit;
		cursor: pointer;
	}
	.comment_list_main {
		width: 100%;
		margin: 3% 0;
	}
	.comment_list_main > .wrap {
		width: 1400px;
		height: 707px;
		margin-left: 18%;
		background-color: white;
		padding: 3% 0;
	}
	.wrap > .board_title {
		width: 80%;
		margin: 20px auto;
		font-size: 20px;
		font-weight: bold;
	}
	.comment_list {
		width: 80%;
		margin: auto;
    	border-collapse: collapse;
    	margin-bottom: 50px;
	}
	.comment_list th,
	.comment_list td {
		font-size: 12px;
     	padding: 10px;
    	border-bottom: 1px solid #707070;
	}
	.comment_list th {
		font-size: 13px;
    	border-top: 1px solid #707070;
     	padding: 13px 10px;
    	background-color: #EDEDED;
	}
	.comment_list td {
		text-align: center;
	}
	.comment_list th:first-child {
		width: 10%;
	}
	.comment_list th:nth-child(2) {
		width: 10%;
	}
	.comment_list th:nth-child(3) {
		width: 20%;
		text-align: inherit;
 		padding-left: 50px; 
	}
	.comment_list th:nth-child(4) {
		width: 25%;
		text-align: inherit;
 		padding-left: 50px; 
	}
	.comment_list th:nth-child(5) {
		width: 15%;
	}
	.comment_list th:last-child {
		width: 20%;
	}
	.comment_list td:nth-child(3) {
		text-align: inherit;
 		padding-left: 45px; 
	}
	.comment_list td:nth-child(4) {
		text-align: inherit;
 		padding-left: 45px; 
	}
	.comment_option_btn {
		display: flex;
		justify-content: space-between;
		width: 80%;
		margin: auto;
	}
	.comment_option_btn .left {
		display: flex;
	}
	.comment_option_btn .cancel {
		font-size: 13px;
		font-weight: bold;
		border: 1px solid #707070;
		padding: 5px 35px;	
		cursor: pointer;
		margin-right: 10px;	
		background-color: white;
		color: #707070;
	}
	.comment_option_btn .cancel:hover {
		background-color: #707070;
		color: white;
	}
	.paging {
        display: flex;
        justify-content: center;
        margin-top: 30px;
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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
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
<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>
<c:if test="${empty member }">
	<script>
		alert('접근 불가')
		location.href = '${root}/'
	</script>
</c:if>
<c:if test="${not empty member }">
	<c:if test="${member.grade < 3 }">
		<script>
			alert('접근 불가')
			location.href = '${root}/'
		</script>
	</c:if>
</c:if>
<div class="comment_list_main">
	<div class="wrap">
		<div class="board_title">댓글관리</div>
		<table class="comment_list">
        	<tr>
        		<th><input type="checkbox" class="checkbox_manage_posting" name="checkbox_controller" onclick="selectAll(this)"></th>
        		<th>분류</th>
        		<th>게시글 제목</th>
        		<th>댓글</th>
        		<th>작성자</th>
        		<th>작성시간</th>
        	</tr>
        	<c:forEach items="${comVO }" var="comVO" varStatus="st">
	        	<tr>
	        		<td class="td_td">
	        			<input type="checkbox" class="checkbox_manage_posting" name="checkbox_each" value="${comVO.idx }">
	        		</td>
	        		<td class="td_td">${comVO.table_name == 'board_community' ? '커뮤니티' : '웹툰' }</td>
	        		<c:if test="${comVO.table_name == 'board_community' }">
	        			<td><a class="td_td" href="${root }/community?no=${comVO.table_idx}" target="_blank">${comVO.post_title }</a></td>
	        		</c:if>
	        		<c:if test="${comVO.table_name == 'board_webtoon_detail' }">
	        			<td><a class="td_td" href="${root }/webtoon_detail?title=${comVO.bw_title }&round=${comVO.round }" target="_blank">${comVO.post_title }</a></td>
	        		</c:if>
	        		<td class="td_td">${comVO.content }</td>
	        		<td class="td_td">${comVO.writer }</td>
	        		<td class="td_td">${comVO.write_date }</td>
	        	</tr>
        	</c:forEach>
        </table>
        <script>
			// 문자열 길이 자르기
			var td_td = document.querySelectorAll('.td_td')
			for(let i = 0; i < td_td.length; i++) {
				console.log('td_td[i].innerText.length : ' + td_td[i].innerText.length)
				if(td_td[i].innerText.length > 11) {
					var text = td_td[i].innerText
					var subText = text.substring(0, 12)
					td_td[i].innerText = subText + '...'
				}
			}
		</script>
        <div class="comment_option_btn">
        	<div class="left">
	        	<input type="button" value="삭제" class="cancel" onclick="deleteComment()">
        	</div>
        	<script>
        		// 체크박스 선택 삭제
        		function deleteComment() {
        			if($('input[name="checkbox_each"]:checked').length == 0) {
        				alert('선택된 항목이 없습니다.')
        			}
        			if($('input[name="checkbox_each"]:checked').length != 0) {
        				var confirm_val = confirm('정말 삭제하시겠습니까?')
        				if(confirm_val) {
        					var check = []
        					$('input[name="checkbox_each"]:checked').each(function(e) {
        						check.push($(this).val())
        					})
        					var list = {
        						'check': check
        					}
        					
        					$.ajax({
        						url: 'delete_comment',
        						type: 'POST',
        						data: list,
        						success: function(data) {
        							if($.trim(data) == 0) {
        								alert('댓글이 삭제되었습니다.')
        								location.href = 'comment_list'
        							} else {
        								alert('삭제할 수 없습니다.')
        							}
        						},
        						error: function() {
        							alert('에러가 발생했습니다.')
        						}
        					})
        				}
        			}
        		}
        	</script>
        </div>
		<div class="paging">
		    <c:if test="${paging.nowPage != 1 }">
		    	<a href="comment_list?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
		    	<a href="comment_list?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
		    </c:if>
		    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			    <c:choose>
			    	<c:when test="${p == paging.nowPage }">
						<div class="num">${p }</div>                			
			    	</c:when>
			    	<c:when test="${p != paging.nowPage }">
			    		<a href="comment_list?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
			    	</c:when>
			    </c:choose>
		    </c:forEach>
		    <c:if test="${paging.nowPage != paging.lastPage }">
		    	<a href="comment_list?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
		    	<a href="comment_list?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
		    </c:if>
		</div>
	</div>	
</div>

</body>
</html>