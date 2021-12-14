<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
body {
	padding: 0;
	margin: 0;
	width: 100%;
	font-family: 'Nanum Gothic', sans-serif;
}

.hidden {
	display: none;
}

a {
	text-decoration: none;
	color: inherit;
	cursor: pointer;
}

.community_detail_main {
	width: 1000px;
	margin: auto;
	margin-top: 75px;
}

.community_detail_wrap {
	width: 100%;
}

.community_detail_wrap>.wrap_title {
	width: 100%;
	margin-bottom: 20px;
	font-size: 17px;
	font-weight: bold;
}

.community_detail_wrap>.img_area {
	width: 100%;
	min-height: 250px;
	max-height: 560px;
	text-align: center;
}
.posting_option {
	width: 100%;
	display: flex;
	justify-content: flex-end;
	font-size: 12px;
}

.posting_option>.like, .posting_option>.share {
	display: flex;
}

.posting_option>.like {
	margin-right: 11px;
}

.posting_option>.like>.like_icon, .posting_option>.share>.share_icon {
	margin-right: 5px;
	cursor: pointer;
	display: flex;
	align-items: center;
}

.posting_option>.like>.like_icon>img, .posting_option>.share>.share_icon>img
	{
	width: 11px;
}

.community_detail_wrap>.writer_info {
	width: 100%;
}

.writer_info>.writer_id {
	font-size: 17px;
	font-weight: bold;
	margin-bottom: 5px;
}

.writer_info>.write_date {
	font-size: 11px;
	color: #A5A3A3;
}

.community_detail_wrap>.community_detail_content {
	width: 100%;
}

.community_detail_content>.posting_title {
	width: 100%;
	font-size: 20px;
	font-weight: bold;
	margin: 30px 0;
}

.community_detail_content>.posting_content {
	margin-bottom: 20px;
}

.community_detail_content>.posting_content textarea {
	resize: none;
	width: 98%;
	height: 100px;
	border: none;
	outline: none;
	font-size: 15px;
	color: #333333;
}

.community_detail_wrap>.division_line {
	width: 100%;
	border-bottom: 1px solid #707070;
	margin-bottom: 20px;
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
	background-color: white;
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
	margin: 100px 0;
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<jsp:include page="/WEB-INF/jsp/header/header_second.jsp" />

	<div class="community_detail_main">
		<div class="community_detail_wrap">
			<div class="wrap_title">커뮤니티</div>
			<c:if test="${not empty iVO }">
			<div class="img_area">
<!-- 				<img src="img/view/community/community_detail_sample.svg" /> -->
				<img src="${root}/community_file/${iVO.img_path}">
			</div>
			</c:if>
			<div class="posting_option">
					<div class="like">
						<div class="like_icon">
							<c:if test="${not empty member }">
								<c:if test="${like_check == 0}">
									<img src="img/view/community/like_icon.svg" onclick="likeActivate(event)" />
								</c:if>
								<c:if test="${like_check == 1}">
									<img src="img/view/community/home_activate_like_icon.svg" onclick="likeActivate(event)" />
								</c:if>
							</c:if>
							<c:if test="${empty member }">
								<img src="img/view/community/like_icon.svg" onclick="likeActivate(event)" />
							</c:if>
							<script>
								// 하트 누를 때 하트 색 채워짐
								function likeActivate(event) {
									if('${member == null}' == 'true') {
										alert('로그인이 필요한 기능입니다.')
										return
									}
									
									var member_idx = '${member.idx}'
									var table_idx = '${cVO.idx}'
									var table_name = 'board_community'
									
									if (event.target.src.indexOf('activate') != -1) {
										event.target.src = '${root}/img/view/community/like_icon.svg'
										$.ajax({
											type: "POST",
											url: "ajax_like_deactivate_community",
											data: { member_idx: member_idx,
												table_idx: table_idx,
												table_name: table_name
											},
											dataType: "text",
											success: function(result) {
												if(result == 1) {
												} else {
													alert('좋아요 취소 실패')
												}
											},
											error: function(request, status, error) {
												console.log("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error)
											}
										})
									} else {
										event.target.src = '${root}/img/view/community/home_activate_like_icon.svg'
										$.ajax({
											type: "POST",
											url: "ajax_like_activate_community",
											data: { member_idx: member_idx,
												table_idx: table_idx,
												table_name: table_name
											},
											dataType: "text",
											success: function(result) {
												if(result == 1) {
												} else {
													alert('좋아요 실패')
												}
											},
											error: function(request, status, error) {
												console.log("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error)
											}
										})
									}
								}
							</script>
						</div>
						<span>좋아요</span>
					</div>
					<div class="share">
						<div class="share_icon">
							<img src="img/view/community/share_icon.svg" onclick="copyURL()" />
							<script>
								// 공유하기, URL복사
								function copyURL() {
									var url = ''
									var textarea = document
											.createElement("textarea")
									document.body.appendChild(textarea)
									url = window.document.location.href
									textarea.value = url
									textarea.select()
									document.execCommand('copy')
									document.body.removeChild(textarea)
									alert('URL이 복사되었습니다.')
								}
							</script>
						</div>
						<span>공유하기</span>
					</div>
				</div>
			<div class="writer_info">
				<div class="writer_id">${cVO.writer }</div>
				<div class="write_date">${cVO.write_date }</div>
			</div>
			<div class="community_detail_content">
				<div class="posting_title">${cVO.title }</div>
				<div class="posting_content">
					<textarea readonly="readonly">${cVO.content }</textarea>
				</div>
			</div>

			<div class="division_line"></div>

			<div class="cmt_write_div">
				<form method="POST" id="comment_form">
					<div class="cwd_writer">
						<span>${not empty member ? member.id : '로그인이 필요한 기능입니다.' }</span>
						<input type="hidden" id="community_idx" value="${cVO.idx }">
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
						var community_idx = $("#community_idx").val()
						$.ajax({
							type: "POST",
							url: "ajax_comment_write",
							data : { member_idx : member_idx,
								writer : writer,
								content : content,
								community_idx : community_idx
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
						var community_idx = $("#community_idx").val()
						$.ajax({
							type: "POST",
							url: "ajax_comment_read",
							data: { community_idx : community_idx },
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
						url: "ajax_cmt_modi",
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
						url: "ajax_cmt_del",
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
				<a href="community_detail?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
				<a href="community_detail?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<div class="num">${p }</div>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="community_detail?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.nowPage != paging.lastPage }">
				<a href="community_detail?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
				<a href="community_detail?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
			</c:if>
		</div>

	</div>

</body>
</html>