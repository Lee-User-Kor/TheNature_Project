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
	.qna_list_main {
		width: 100%;
		margin: 3% 0;
	}
	.qna_list_main > .wrap {
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
	.qna_list {
		width: 80%;
		margin: auto;
    	border-collapse: collapse;
    	margin-bottom: 50px;
	}
	.qna_list th,
	.qna_list td {
		font-size: 12px;
     	padding: 10px;
    	border-bottom: 1px solid #707070;
	}
	.qna_list th {
		font-size: 13px;
    	border-top: 1px solid #707070;
     	padding: 13px 10px;
    	background-color: #EDEDED;
	}
	.qna_list td {
		text-align: center;
	}
	.qna_list th:first-child {
		width: 8%;
	}
	.qna_list th:nth-child(2) {
		width: 8%;
	}
	.qna_list th:nth-child(3) {
		width: 40%;
		text-align: inherit;
 		padding-left: 50px; 
	}
	.qna_list th:nth-child(4) {
		width: 10%;
	}
	.qna_list th:nth-child(5) {
		width: 10%;
	}
	.qna_list th:last-child {
		width: 10%;
	}
	.qna_list td:nth-child(3) {
		text-align: inherit;
 		padding-left: 45px; 
	}
	.qna_option_btn {
		display: flex;
		justify-content: space-between;
		width: 80%;
		margin: auto;
	}
	.qna_option_btn .left {
		display: flex;
	}
	.qna_option_btn .modify {
		font-size: 13px;
		font-weight: bold;
		border: 1px solid #707070;
		padding: 5px 35px;	
		cursor: pointer;
		margin-right: 10px;	
		background-color: white;
		color: #707070;
	}
	.qna_option_btn .cancel {
		font-size: 13px;
		font-weight: bold;
		border: 1px solid #707070;
		padding: 5px 35px;	
		cursor: pointer;
		margin-right: 10px;	
		color: #707070;
		background-color: white;
	}
	.qna_option_btn .modify:hover,
	.qna_option_btn .cancel:hover {
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
<div class="qna_list_main">
	<div class="wrap">
		<div class="board_title">1:1문의</div>
		<table class="qna_list">
        	<tr>
        		<th><input type="checkbox" class="checkbox_manage_posting" name="checkbox_controller" onclick="selectAll(this)"></th>
        		<th>NO</th>
        		<th>제목</th>
        		<th>등록일</th>
        		<th>답변현황</th>
        	</tr>
        	<c:forEach items="${qnaVO }" var="qVO" varStatus="st">
	        	<tr>
	        		<td>
	        			<input type="checkbox" class="checkbox_manage_posting" name="checkbox_each" value="${qVO.idx }">
	        		</td>
	        		<td>${qVO.idx }</td>
	        		<td>
	        			<c:if test="${qVO.apply == 'y' }">
	        				<a href="${root }/qna_detail?no=${qVO.idx }" target="_blank">${qVO.title }</a>
	        			</c:if>
	        			<c:if test="${qVO.apply == 'n' }">
	        				<a href="${root}/admin/qna_write?no=${qVO.idx }">${qVO.title }</a>
	        			</c:if>
	        		</td>
	        		<td>${qVO.write_date }</td>
	        		<td class="apply">${qVO.apply == 'y' ? '답변완료' : '처리중' }</td>
	        	</tr>
	        	<script>
	        		var apply = document.querySelectorAll('.apply')
	        		for(let i = 0; i < apply.length; i++){
	        			if(apply[i].innerText == '처리중') {
	        				apply[i].style.color = 'red'
	        			}else {
	        				apply[i].style.color = 'green'
	        			}
	        		}
	        	</script>
        	</c:forEach>
        </table>
        <div class="qna_option_btn">
        	<div class="left">
	        	<input type="button" value="수정" class="modify" onclick="modifyQnaApply()">
	        	<input type="button" value="문의 삭제" class="cancel" onclick="deleteQna()">
	        	<input type="button" value="답변 삭제" class="cancel" onclick="deleteQnaApply()">
        	</div>
        	<script>
        		// 문의 답변 수정
        		function modifyQnaApply() {
        			if($('input[name="checkbox_each"]:checked').length == 0) {
        				alert('선택된 항목이 없습니다.')
        			}
        			if($('input[name="checkbox_each"]:checked').length != 0 && $('input[name="checkbox_each"]:checked').length != 1) {
        				alert('수정할 항목은 하나만 선택해야합니다.')
        			}
        			if($('input[name="checkbox_each"]:checked').length == 1) {
        				alert('수정 페이지로 이동합니다')
        				location.href = 'qna_modify?no=' + $('input[name="checkbox_each"]:checked').val()
        			}
        		}
        	</script>
        	<script>
        		// 문의 삭제
        		function deleteQna() {
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
        						url: 'delete_qna',
        						type: 'POST',
        						data: list,
        						success: function(data) {
        							if($.trim(data) == 0) {
        								alert('문의가 삭제되었습니다.')
        								location.href = 'qna_list'
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
        	<script>
        		// 문의 답변 삭제
        		function deleteQnaApply() {
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
        						url: 'delete_qna_apply',
        						type: 'POST',
        						data: list,
        						success: function(data) {
        							if($.trim(data) == 0) {
        								alert('답변이 삭제되었습니다.')
        								location.href = 'qna_list'
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
		    	<a href="qna_list?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
		    	<a href="qna_list?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
		    </c:if>
		    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			    <c:choose>
			    	<c:when test="${p == paging.nowPage }">
						<div class="num">${p }</div>                			
			    	</c:when>
			    	<c:when test="${p != paging.nowPage }">
			    		<a href="qna_list?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
			    	</c:when>
			    </c:choose>
		    </c:forEach>
		    <c:if test="${paging.nowPage != paging.lastPage }">
		    	<a href="qna_list?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
		    	<a href="qna_list?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
		    </c:if>
		</div>
	</div>	
</div>

</body>
</html>