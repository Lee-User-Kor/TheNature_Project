<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
<style>
.total_wrap {
	margin-left: 185px;
}
.tcl_wrap {
	width: 1400px;
	height: 820px;
	margin: 74px auto;
	background-color: white;
}
.tclw_wrap {
	width: 1200px;
	height: 720px;
	padding: 50px 0;
	margin: 0 auto;
}
.board_title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}
.tcll_table {
	width: 100%;
	border-collapse: collapse;
	border-top: 1px solid #707070;
}
.th_td {
	font-weight: bold;
	font-size: 17px;
	height: 45px;
	background-color: #EDEDED;
}
.n_center {
	text-align: center;
}
.tcll_table tr {
	border-bottom: 1px solid #707070;
}
.td_td {
	height: 40px;
}
.btn_function {
	display: flex;
	justify-content: space-between;
	margin: 20px 0;
}
.btn_function button {
	border: 1px solid #707070;
	background-color: white;
	color: #707070;
	font-size: 15px;
	font-weight: bold;
	width: 100px;
	height: 35px;
}
.btn_function button:hover {
	background-color: #707070;
	color: white;
	cursor: pointer;
}
input[type=checkbox]:hover {
	cursor: pointer;
}


/* 페이징 */
.paging {
	display: flex;
	justify-content: center;
	margin-top: 100px;
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function allBoxHandler() {
		var allBox = document.getElementById('allBox')
		var allCheckBox = document.querySelectorAll('.ck_box')
		if(allBox.checked === true) {
			for(let i = 0; i < allCheckBox.length; i++) {
				allCheckBox[i].checked = true
			}
		}else {
			for(let i = 0; i < allCheckBox.length; i++) {
				allCheckBox[i].checked = false
			}
		}
	}
</script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>

<div class="total_wrap">
	<div class="tcl_wrap">
		<div class="tclw_wrap">
		
			<div class="board_title">회원 목록</div>
			
			<div class="tcl_list">
				<table class="tcll_table">
					<tbody class="tcll_tbody">
						<tr class="tcll_tr">
							<td class="th_td n_center"><input type="checkbox" id="allBox" onchange="allBoxHandler()"></td>
							<td class="th_td n_center">NO</td>
							<td class="th_td n_center" style="width: 100px;">회원등급</td>
							<td class="th_td n_center" style="width: 100px;">공급자</td>
							<td class="th_td n_center">아이디</td>
							<td class="th_td n_center">이름</td>
							<td class="th_td n_center">이메일</td>
							<td class="th_td n_center" style="width: 100px;">가입일자</td>
							<td class="th_td n_center" style="width: 100px;">탈퇴일자</td>
						</tr>
						<c:forEach items="${mVOList }" var="mVO_list">
							<tr class="tcll_tr">
								<td class="td_td n_center"><input type="checkbox" name="checkbox_each" value="${mVO_list.idx }" class="ck_box"></td>
								<td class="td_td n_center">${mVO_list.idx }</td>
								<td class="td_td n_center">${mVO_list.grade }</td>
								<c:if test="${mVO_list.grade == 1 }">
									<td class="td_td n_center is_producer">${mVO_list.is_producer == 'y' ? '대기중' : '일반' }</td>
								</c:if>
								<c:if test="${mVO_list.grade == 2 }">
									<td class="td_td n_center" style="color: green;">공급자</td>
								</c:if>
								<c:if test="${mVO_list.grade == 3 }">
									<td class="td_td n_center" style="color: blue; font-weight: bold;">관리자</td>
								</c:if>
								<td class="td_td n_center">${mVO_list.id }</td>
								<td class="td_td n_center">${mVO_list.name }</td>
								<td class="td_td n_center">${mVO_list.email }</td>
								<td class="td_td n_center">${mVO_list.join_date }</td>
								<td class="td_td n_center">${mVO_list.exit_date == null ? '-' : mVO_list.exit_date }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<script>
					const is_producer = document.querySelectorAll('.is_producer')
					for(let i = 0; i < is_producer.length; i++){
						if(is_producer[i].innerText == '대기중') {
							is_producer[i].style.color = 'red'
						}
					}
				</script>
			</div>
		
			<div class="btn_function">
				<div class="bf_left">
					<button class="modi_btn" onclick="gradeUp()">등급 올리기</button>
					<button class="del_btn" onclick="gradeDown()">등급 내리기</button>
				</div>
				<script>
					function gradeUp() {
						var chkBox = document.getElementsByName('checkbox_each')
	        			let cnt = 0
	        			for(let i = 0; i < chkBox.length; i++) {
	        				if(chkBox[i].checked) {
	        					cnt = cnt + 1
	        				}
	        			}
	        			if(cnt == 0) {
	        				alert('선택된 회원이 없습니다')
	        				return
	        			}
		        		
	        			if(confirm('선택된 회원들의 등급을 올리시겠습니까?')) {
		        			var upForm = document.createElement('form')
			        		upForm.method = 'POST'
			        		upForm.action = '${root}/admin/grade_up'
			        		for(let i = 0; i < chkBox.length; i++) {
			        			if(chkBox[i].checked) {
									var chkBoxVal = chkBox[i].value
									var input = document.createElement('input')
									input.type = 'text'
									input.name = 'member_idx'
									input.value = chkBoxVal
									upForm.append(input)
			        			}
			        		}
			        		document.body.appendChild(upForm)
			        		upForm.submit()
	        			}else {
	        				return
	        			}
					}
					function gradeDown() {
						var chkBox = document.getElementsByName('checkbox_each')
	        			let cnt = 0
	        			for(let i = 0; i < chkBox.length; i++) {
	        				if(chkBox[i].checked) {
	        					cnt = cnt + 1
	        				}
	        			}
	        			if(cnt == 0) {
	        				alert('선택된 회원이 없습니다')
	        				return
	        			}
		        		
	        			if(confirm('선택된 회원들의 등급을 내리시겠습니까?')) {
		        			var downForm = document.createElement('form')
			        		downForm.method = 'POST'
			        		downForm.action = '${root}/admin/grade_down'
			        		for(let i = 0; i < chkBox.length; i++) {
			        			if(chkBox[i].checked) {
									var chkBoxVal = chkBox[i].value
									var input = document.createElement('input')
									input.type = 'text'
									input.name = 'member_idx'
									input.value = chkBoxVal
									downForm.append(input)
			        			}
			        		}
			        		document.body.appendChild(downForm)
			        		downForm.submit()
	        			}else {
	        				return
	        			}
					}
				</script>
			</div>
			
			<div class="paging">
			    <c:if test="${paging.nowPage != 1 }">
			    	<a href="member_list?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
			    	<a href="member_list?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
			    </c:if>
			    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				    <c:choose>
				    	<c:when test="${p == paging.nowPage }">
							<div class="num">${p }</div>                			
				    	</c:when>
				    	<c:when test="${p != paging.nowPage }">
				    		<a href="member_list?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
				    	</c:when>
				    </c:choose>
			    </c:forEach>
			    <c:if test="${paging.nowPage != paging.lastPage }">
			    	<a href="member_list?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
			    	<a href="member_list?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
			    </c:if>
			</div>
		
		</div>
	</div>
</div>

</body>
</html>