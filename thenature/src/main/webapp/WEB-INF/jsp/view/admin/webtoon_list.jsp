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
	.webtoon_list_main {
		width: 100%;
		margin: 3% 0;
	}
	.webtoon_list_main > .wrap {
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
	.webtoon_list {
		width: 80%;
		margin: auto;
    	border-collapse: collapse;
    	margin-bottom: 50px;
	}
	.webtoon_list th,
	.webtoon_list td {
		font-size: 12px;
     	padding: 10px;
    	border-bottom: 1px solid #707070;
	}
	.webtoon_list th {
		font-size: 13px;
    	border-top: 1px solid #707070;
     	padding: 13px 10px;
    	background-color: #EDEDED;
	}
	.webtoon_list td {
		text-align: center;
	}
	.webtoon_list th:first-child {
		width: 8%;
	}
	.webtoon_list th:nth-child(2) {
		width: 8%;
	}
	.webtoon_list th:nth-child(3) {
		width: 10%;
	}
	.webtoon_list th:nth-child(4) {
		width: 40%;
		text-align: inherit;
 		padding-left: 50px; 
	}
	.webtoon_list th:nth-child(5) {
		width: 12%;
	}
	.webtoon_list th:last-child {
		width: 12%;
	}
	.webtoon_list td:nth-child(4) {
		text-align: inherit;
 		padding-left: 45px; 
	}
	.webtoon_option_btn {
		display: flex;
		justify-content: space-between;
		width: 80%;
		margin: auto;
	}
	.webtoon_option_btn .left {
		display: flex;
	}
	.webtoon_option_btn .modify {
		font-size: 13px;
		font-weight: bold;
		border: 1px solid #707070;
		padding: 5px 35px;	
		cursor: pointer;
		margin-right: 10px;	
		background-color: white;
		color: #707070;
	}
	.webtoon_option_btn .cancel {
		font-size: 13px;
		font-weight: bold;
		border: 1px solid #707070;
		padding: 5px 35px;	
		cursor: pointer;
		margin-right: 10px;	
		background-color: white;
		color: #707070;
	}
	.webtoon_option_btn .write {
		font-size: 13px;
		font-weight: bold;
		border: 1px solid #707070;
		padding: 5px 35px;	
		cursor: pointer;
		background-color: white;
		color: #707070;
	}
	.webtoon_option_btn .write:first-child {
		margin-right: 5px;
	}
	.webtoon_option_btn .modify:hover,
	.webtoon_option_btn .cancel:hover,
	.webtoon_option_btn .write:hover {
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

<div class="webtoon_list_main">
	<div class="wrap">
		<div class="board_title">웹툰관리</div>
		<table class="webtoon_list">
        	<tr>
        		<th><input type="checkbox" class="checkbox_manage_posting" name="checkbox_controller" onclick="selectAll(this)"></th>
        		<th>NO</th>
        		<th>웹툰제목</th>
        		<th>회차제목</th>
        		<th>공급자</th>
        		<th>등록일</th>
        		<th>조회수</th>
        	</tr>
        	<c:forEach items="${wdVOList }" var="wdVO_list" varStatus="st">
	        	<tr>
	        		<td>
	        			<input type="checkbox" class="checkbox_manage_posting" name="checkbox_each" value="${wdVO_list.idx }">
	        		</td>
	        		<td>${wdVO_list.idx }</td>        		
	        		<td><a href="${root }/webtoon_list?title=${wdVO_list.bw_title}" target="_blank">${wdVO_list.bw_title }</a></td>
	        		<td><a href="${root }/webtoon_detail?title=${wdVO_list.bw_title}&round=${wdVO_list.round}" target="_blank">${wdVO_list.title }</a></td>
	        		<td>${wdVO_list.writer }</td>
	        		<td>${wdVO_list.add_date }</td>
	        		<td>${wdVO_list.view_count }</td>
	        	</tr>
        	</c:forEach>
        </table>
        <div class="webtoon_option_btn">
        	<div class="left">
	        	<input type="button" value="수정" class="modify" onclick="webtoonModify()">
	        	<input type="button" value="삭제" class="cancel" onclick="deleteWebtoon()">
        	</div>
        	<script>
        		// 체크 항목 수정
        		function webtoonModify() {
        			var chkbox = document.getElementsByName('checkbox_each')
        			let cnt = 0;
        			for(let i = 0; i < chkbox.length; i++) {
        				if(chkbox[i].checked) {
        					cnt = cnt + 1
        				}
        			}
        			if(cnt > 1) {
        				alert('수정은 하나씩만 할 수 있습니다.')
        				return
        			} else if(cnt == 0) {
        				alert('선택된 항목이 없습니다.')
        				return
        			}
        			
        			var modifyForm = document.createElement('form')
        			modifyForm.method = 'GET'
        			modifyForm.action = '${root}/admin/modify_webtoon'
        			for(let i = 0; i < chkbox.length; i++) {
        				if(chkbox[i].checked) {
        					var chkboxVal = chkbox[i].value
        					var input = document.createElement('input')
        					input.type = 'text'
        					input.name = 'webtoon_detail_idx'
        					input.value = chkboxVal
        					modifyForm.append(input)
        				}
        			}
        			document.body.appendChild(modifyForm)
        			modifyForm.submit()
        		}
        	</script>
        	<script>
        		// 체크 항목 삭제
        		function deleteWebtoon(){
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
	        					url: 'delete_webtoon',
	        					type: 'POST',
	        					data: list,
	        					success: function(data) {
									if($.trim(data) == 0) {
										alert('웹툰이 삭제되었습니다.')
										location.href = 'webtoon_list'
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
        	<div class="right">
	        	<input type="button" value="웹툰 등록" class="write" onclick="location.href = 'webtoon_write'">
	        	<input type="button" value="회차 등록" class="write" onclick="location.href = 'webtoon_write_detail'">
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
</div>

</body>
</html>