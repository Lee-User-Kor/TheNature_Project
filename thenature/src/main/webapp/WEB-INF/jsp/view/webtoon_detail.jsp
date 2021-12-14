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
	width: 100%;
}
.wd_wrap {
	width: 1000px;
	margin: 100px auto;
}
.wd_top {
	font-size: 18px;
	color: #272727;
	display: flex;
	justify-content: space-between;
	padding: 0 15px;
}
.wd_title_div {
	background-color: #F5F5F5;
	height: 60px;
	margin: 20px 0;
}
.wd_title {
	height: 60px;
	display: table;
	margin: 0 auto;
}
.wd_title span {
	display: table-cell;
	vertical-align: middle;
	font-size: 24px;
	font-weight: bold;
	color: #272727;
}
.wd_ctr_div {
	position: relative;
	font-size: 11px;
	color: #707070;
	top: -36px;
	left: 900px;
	width: 90px;
}
.wd_ctnt_div {
	text-align: center;
	margin: 50px 0;
}
.middle_line {
	width: 100%;
	border-top: 1px solid #707070;
	border-bottom: 1px solid #707070;
	padding: 20px 0;
}
.middle_line:hover {
	cursor: pointer; 
}
.ml_title {
	width: 1000px;
	text-align: center;
	color: #707070; 
	font-size: 17px;
	font-weight: bold;
	margin: 0 auto;
}
.ml_title img {
	vertical-align: middle;
}
.cmt_write_div {
	border: 1px solid #707070;
}
.cwd_check {
	border-bottom: 1px solid #707070;
}
.cwd_writer {
	padding: 10px 15px;
	color: #5F5E5E;
	font-weight: bold;
	font-size: 20px;
}
.cwd_content {
	padding: 0 15px;
}
.cwd_content textarea {
	resize: none;
	width: 99%;
	height: 80px;
	border: none;
	outline: none;
}
.cwd_check {
	font-size: 14px;
	color: #5F5E5E;
	text-align: right;
	padding: 10px 15px;
}
.cwd_btn_div {
	text-align: right;
}
.cwd_btn_div input[type=submit] {
	border: none;
	border-left: 1px solid #707070;
	background-color: white;
	color: #35600C;
	font-size: 18px;
	font-weight: bold;
	width: 85px;
	height: 43px;
}
.cwd_btn_div input[type=submit]:hover {
	border: none;
	background-color: #35600C;
	color: white;
	cursor: pointer;
}
.cmt_read_div {
	padding: 40px 15px 20px 15px;;
	border-bottom: 1px solid #707070;
	height: 155px;
}
.crd_writer {
	padding: 10px 0;
	font-size: 19px;
	font-weight: bold;
	color: #272727;
	display: flex;
	justify-content: space-between;
}
.crd_writer img:hover {
	cursor: pointer;
}
.crd_content textarea {
	resize: none;
	width: 99%;
	height: 80px;
	border: none;
	outline: none;
	font-size: 14px;
	color: #272727;
	line-height: 20px;
}
.crd_date {
	padding: 10px 0;
}
.crd_date {
	color: #707070;
	font-size: 13px;
}
.cmt_menu {
	display: flex;
    flex-flow: column;
    font-size: 13px;
    position: relative;
    top: -155px;
    left: 920px;
    border: 1px solid #707070;
    width: 40px;
    text-align: center;
}
.cmt_fnc {
	padding: 5px;
}
.cmt_fnc:hover {
	background-color: #707070;
	color: white;
	cursor: pointer;
} 
.cmt_modi_btn {
	background-color: white;
	border: 1px solid #35600C;
	color: #35600C;
	height: 30px;
}
.cmt_modi_btn:hover {
	background-color: #35600C;
	color: white;
	cursor: pointer;
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
	<div class="wd_wrap">
		<div class="wd_top">
			<span>${wdVO.add_date }</span>
			<span>조회수 ${wdVO.view_count } 회</span>
		</div>
		<div class="wd_title_div">
			<div class="wd_title">
				<span>${wdVO.bw_title } ${wdVO.round }화</span>
			</div>
			<div class="wd_ctr_div">
				<c:if test="${wdVO.round != 1 }">
				<span><label><a href="${root }/webtoon_detail?title=${wdVO.bw_title}&round=${wdVO.round -1}"><img src="${root }/img/view/webtoon/arrow_left.png"> 이전화</a></label></span>
				</c:if>
				<span>|</span>
				<c:if test="${wdVO.round != maxRound }">
				<span><label><a href="${root }/webtoon_detail?title=${wdVO.bw_title}&round=${wdVO.round +1}">다음화 <img src="${root }/img/view/webtoon/arrow_right.png"></a></label></span>
				</c:if>
			</div>
		</div>
		<div class="wd_ctnt_div">
			<img src="${root }/webtoon_file/${wdVO.img_path}">
		</div>
	</div>
</div>

<div class="middle_line" onclick="goTopHandler()">
	<div class="ml_title">
		<span>맨 위로 <img src="${root }/img/view/webtoon/arrow_up.png"></span>
	</div>
</div>
<script>
	function goTopHandler() {
		scrollTo({top: 0, left: 0, behavior:'smooth'})
	}
</script>

<div class="total_warp">
	<div class="wd_wrap">
		<div class="cmt_write_div">
				<form method="POST" id="comment_form">
					<div class="cwd_writer">
						<span>${not empty member ? member.id : '로그인이 필요한 기능입니다.' }</span>
						<input type="hidden" id="webtoon_detail_idx" value="${wdVO.idx }">
						<input type="hidden" id="member_idx" name="member_idx" value="${member.idx }">
						<input type="hidden" id="writer" name="writer" value="${member.id }">
					</div>
					<div class="cwd_content">
						<textarea id="cmtContent" name="content" placeholder="${not empty member ? '바르고 고운말을 사용합시다.' : '로그인이 필요한 기능입니다' }" ${not empty member ? '' : 'disabled' } onkeyup="checkByteHandler()"></textarea>
					</div>
					<div class="cwd_check">
						<span id="checkByte">0/100</span>
					</div>
					<div class="cwd_btn_div">
						<c:if test="${not empty member }">
						<input type="submit" value="등록" onclick="cfSubmit(event)">
						</c:if>
					</div>
				</form>
				<script>
					function cfSubmit(event) {
						event.preventDefault()
						var member_idx = $("#member_idx").val()
						var writer = $("#writer").val()
						var content = $("#cmtContent").val()
						var webtoon_detail_idx = $("#webtoon_detail_idx").val()
						$.ajax({
							type: "POST",
							url: "ajax_comment_write_webtoon",
							data : { member_idx : member_idx,
								writer : writer,
								content : content,
								webtoon_detail_idx : webtoon_detail_idx
							},
							dataType: "text",
							success: function(result) {
								if(result == 1) {
									$("#cmtContent").val("")
									showCmt()
								}else {
									alert('댓글 등록 실패')
								}
							},
							error: function(a, b, c) {
								console.log('ERROR a : ' + a)
								console.log('ERROR b : ' + b)
								console.log('ERROR c : ' + c)
							}
						})
					} 
					function showCmt() {
						var webtoon_detail_idx = $("#webtoon_detail_idx").val()
						$.ajax({
							type: "POST",
							url: "ajax_comment_read_webtoon",
							data: { webtoon_detail_idx : webtoon_detail_idx },
							dataType: "text",
							success: function(result) {
								var data = JSON.parse(result)
								$.each(data, function(index, item){
									console.log(item.idx)
									console.log(item.content)
									
									var cmt_read_wrap = document.querySelector('.cmt_read_wrap')
									var cmt_read_div = document.createElement('div')
									cmt_read_div.classList.add('cmt_read_div')
									
									var crd_writer = document.createElement('div')
									crd_writer.classList.add('crd_writer')
									var span1 = document.createElement('span')
									span1.innerText = item.writer
									var span2 = document.createElement('span')
									span2.innerHTML = '<img src="${root }/img/view/webtoon/menu.png" onclick="menuHandler(event)">'
									crd_writer.append(span1)
									crd_writer.append(span2)
									
									var crd_content = document.createElement('div')
									crd_content.classList.add('crd_content')
									var text = document.createElement('textarea')
									text.readOnly = true
									text.value = item.content
									crd_content.append(text)
									
									var crd_date = document.createElement('div')
									crd_date.classList.add('crd_date')
									var span3 = document.createElement('span')
									span3.innerText = item.write_date
									crd_date.append(span3)
									
									var cmt_menu = document.createElement('div')
									cmt_menu.classList.add('cmt_menu')
									cmt_menu.classList.add('hidden')
									var input = document.createElement('input')
									input.type = 'hidden'
									input.value = item.idx
// 									var cmt_fnc1 = document.createElement('div')
// 									cmt_fnc1.classList.add('cmt_fnc')
// 									cmt_fnc1.innerText = '수정'
// 									var cmt_fnc2 = document.createElement('div')
// 									cmt_fnc2.classList.add('cmt_fnc')
// 									cmt_fnc2.innerText = '삭제'
// 									cmt_menu.append(cmt_fnc1)
// 									cmt_menu.append(cmt_fnc2)
									cmt_menu.append(input)
									cmt_menu.innerHTML += '<div class="cmt_fnc" onclick="cmtModi(event)"">수정</div><div class="cmt_fnc" onclick="cmtDel(event)">삭제</div>'
									
									cmt_read_div.append(crd_writer)
									cmt_read_div.append(crd_content)
									cmt_read_div.append(crd_date)
									cmt_read_div.append(cmt_menu)
									cmt_read_wrap.prepend(cmt_read_div)
								})
							},
							error: function(a, b, c) {
								console.log('ERROR a : ' + a)
								console.log('ERROR b : ' + b)
								console.log('ERROR c : ' + c)
							}
						})
					}
				</script>
				<script>
					function checkByteHandler() {
						var content = document.getElementById('cmtContent').value
						document.getElementById('checkByte').innerText = getTextLength(content)
								+ '/100'
						if (getTextLength(content) > 100) {
							var contentLength = content.length - 1
							var changeValue = content.substring(0,
									contentLength)
							document.getElementById('cmtContent').value = changeValue
							document.getElementById('checkByte').innerText = '100/100'
							alert("최대 100 Byte 까지 입력 가능합니다.");
						}
					}
					function getTextLength(content) {
						var len = 0
						for (var i = 0; i < content.length; i++) {
							if (escape(content.charAt(i)).length == 6) {
								len++
							}
							len++
						}
						return len
					}
				</script>
			</div>
		<div class="cmt_read_wrap">
				<c:forEach items="${cmtVOList }" var="cmtVO_list">
				<div class="cmt_read_div">
					<div class="crd_writer">
						<span>${cmtVO_list.writer }</span>
						<c:if test="${cmtVO_list.member_idx == member.idx }">
						<span><img src="${root }/img/view/webtoon/menu.png" onclick="menuHandler(event)"></span>
						</c:if>
					</div>
					<div class="crd_content">
						<textarea readonly>${cmtVO_list.content }</textarea>
					</div>
					<div class="crd_date">
						<span>${cmtVO_list.write_date }</span>
					</div>
					<div class="cmt_menu hidden">
						<input type="hidden" value="${cmtVO_list.idx }">
						<div class="cmt_fnc" onclick="cmtModi(event)">수정</div>
						<div class="cmt_fnc" onclick="cmtDel(event)">삭제</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<script>
				function cmtModi(event) {
					event.target.parentNode.parentNode.querySelector('textarea').readOnly = false
					var span = document.createElement('span')
					span.innerHTML = '<button class="cmt_modi_btn" onclick="modiSubmit(event)">수정</button>'
					const crd_date = event.target.parentNode.parentNode.querySelector('.crd_date')
					crd_date.append(span)
					event.target.parentNode.parentNode.querySelector('textarea').style.backgroundColor = '#EEEEEE'
					event.target.parentNode.parentNode.querySelector('textarea').focus()
				}
				function modiSubmit() {
					var idxVal = event.target.parentNode.parentNode.parentNode.querySelector('input').value
					var ctntVal = event.target.parentNode.parentNode.parentNode.querySelector('textarea').value
					
					$.ajax({
						type: "POST",
						url: "ajax_cmt_modi_webtoon",
						data: { idx : idxVal,
							content : ctntVal	
						},
						dataType: "text",
						success: function(result){
							if(result != 1) {
								alert('수정 실패')
							}
							window.location.reload()
						},
						error: function(a, b, c) {
							console.log('ERROR a : ' + a)
							console.log('ERROR b : ' + b)
							console.log('ERROR c : ' + c)
						}
					})
				}
				function cmtDel(event) {
					var idxVal = event.target.parentNode.parentNode.querySelector('input').value
					$.ajax({
						type: "POST",
						url: "ajax_cmt_del_webtoon",
						data: { idx : idxVal },
						dataType: "text",
						success: function(result){
							if(result != 1) {
								alert('삭제 실패')
							}
							window.location.reload()
						},
						error: function(a, b, c) {
							console.log('ERROR a : ' + a)
							console.log('ERROR b : ' + b)
							console.log('ERROR c : ' + c)
						}
					})
				}
			</script>
			<script>
				function menuHandler(event) {
					var menu = event.target.parentNode.parentNode.parentNode
							.getElementsByTagName('div')[3]
					if (menu.classList.contains('hidden')) {
						menu.classList.remove('hidden')
					} else {
						menu.classList.add('hidden')
					}
				}
			</script>
	</div>
	
	<div class="paging">
	    <c:if test="${paging.nowPage != 1 }">
	    	<a href="webtoon_detail?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
	    	<a href="webtoon_detail?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
	    </c:if>
	    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		    <c:choose>
		    	<c:when test="${p == paging.nowPage }">
					<div class="num">${p }</div>                			
		    	</c:when>
		    	<c:when test="${p != paging.nowPage }">
		    		<a href="webtoon_detail?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
		    	</c:when>
		    </c:choose>
	    </c:forEach>
	    <c:if test="${paging.nowPage != paging.lastPage }">
	    	<a href="webtoon_detail?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
	    	<a href="webtoon_detail?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
	    </c:if>
	</div>
</div>



<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>