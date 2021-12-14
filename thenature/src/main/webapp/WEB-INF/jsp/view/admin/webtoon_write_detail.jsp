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
	.webtoon_write_main {
		width: 100%;
		margin: 3% 0;
	}
	.webtoon_write_main > .wrap {
		width: 1400px;
		height: 745px;
		margin-left: 18%;
		background-color: white;
		padding: 2% 0;
	}
	.wrap > .form_title {
		width: 80%;
		margin: auto;
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 20px;
	}
	.cw_form {
		margin: 25px 0;
	}
	.cwf_table {
		border-collapse: collapse;
		border-top: 1px solid #707070;
		width: 80%;
		margin: auto;
	}
	.cwf_tr {
		border-bottom: 1px solid #707070;
	}
	.f_td {
		background-color: #EEEEEE;
		color: #272727;
		font-size: 17px;
		font-weight: bold;
		text-align: center;
	}
	.s_td {
		padding: 10px 15px;
	}
	.s_td_div {
		border: 1px solid #707070;
		padding: 5px 10px;
		font-size: 13px;
	}
	.s_td_div input[type=text], input[type=number] {
		border: none;
		outline: none;
		width: 40%;
		height: 25px;
	}
	.s_td > .add_info {
		margin-top: 10px;
	}
	.s_td_div > select {
		width: 100%;
		outline: none;
		border: none;
		margin: 5px 0;
	}
	.chapter_title {
		margin-top: 10px;
	}
	.s_td_div textarea {
		border: none;
		outline: none;
		resize: none;
		width: 98%;
		height: 200px;
	}
	.s_td_div > input[type="file"] {
		margin: 5px 10px;
	}
	.std_dd {
		padding: 0;
	}
	.dd_div {
		display: table;
		height: 400px;
		width: 100%;
	    text-align: center;
	}
	.dd_div span {
		display: table-cell;
		vertical-align: middle;
		color: #707070;
		font-size: 15px;
	}
	.dd_icon_div {
		border-top: 1px solid #707070;
		text-align: center;
		height: 51px;
	}
	.dd_icon_div input[type=file] {
		display: none;
	}
	.dd_icon_div img {
		margin: 10px 0;
		cursor: pointer;
	}
	.save_btn, .list_btn {
		border: 1px solid #707070;
		background-color: white;
		color: #707070;
		font-size: 15px;
		font-weight: bold;
		width: 80px;
		height: 33px;
	}
	.save_btn {
		margin-right: 15px;
	}
	.save_btn:hover, .list_btn:hover {
		background-color: #707070;
		color: white;
		cursor: pointer;
	}
	.btn_div {
		width: 80%;
		margin: auto;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>

<div class="webtoon_write_main">
	<div class="wrap">
		<div class="form_title">${not empty wdVO ? '웹툰 수정' : '웹툰 등록' }</div>
		<form method="POST" id="webtoon_detail_regist" enctype="multipart/form-data">
			<div class="cw_form">
				<table class="cwf_table">
					<tbody class="cwf_tbody">
						<tr class="cwf_tr">
							<td class="f_td">제목</td>
							<td class="s_td">
								<div class="s_td_div">
<!-- 									<input type="text" placeholder="웹툰 제목"> -->
									<c:if test="${empty wdVO }">
										<select name="bw_title" class="bw_title">
											<option selected disabled value="">웹툰 선택</option>
											<c:forEach items="${wVOList }" var="wVO_list">
												<option value="${wVO_list.title }">${wVO_list.title }</option>
											</c:forEach>
										</select>
									</c:if>
									<c:if test="${not empty wdVO }">
										<select name="bw_title" class="bw_title">
											<option disabled value="">웹툰 선택</option>
											<c:forEach items="${wVO }" var="wVO">
												<option value="${wVO.title }" ${wVO.title == wdVO.bw_title ? 'selected' : '' }>${wVO.title }</option>
											</c:forEach>
<%-- 										<input type="text" name="bw_title" value="${wdVO.bw_title }" readonly> --%>
										</select>
									</c:if>
								</div>
								<div class="s_td_div chapter_title">
									<input type="number" name="round" min="1" class="round" value="${not empty wdVO ? wdVO.round : '' }" placeholder="회차(숫자만 입력해주세요.)">
									<input type="text" name="title" class="title" value="${not empty wdVO ? wdVO.title : '' }" placeholder="회차 제목">
									<input type="hidden" name="writer" value="${member.id }">
									<input type="hidden" name="member_idx" value="${member.idx }">
									<c:if test="${not empty wdVO }">
										<input type="hidden" name="idx" value="${wdVO.idx }">
									</c:if>
								</div>
							</td>
						</tr>
						<tr class="cwf_tr">
							<td class="f_td">썸네일</td>
							<td class="s_td">
								<div class="s_td_div std_dd">
									<input type="file" name="thumbnail_file" class="thumbnail_file" accept="image/*" onchange="showfile1()">
									<c:if test="${empty wdVO }">
										현재 업로드된 파일 : <span class="span_file1"></span>
									</c:if>
									<c:if test="${not empty wdVO }">
										현재 업로드된 파일 : <span class="span_file1">${wdVO.thumbnail }</span>
									</c:if>
								</div>
								<script>
									function showfile1() {
										var fileValue = document.querySelector('.thumbnail_file').value
										for(let i = 0; i < fileValue.length; i++) {
											if(fileValue.indexOf('\\') != -1) {
												fileValue = fileValue.substring(fileValue.indexOf('\\') + 1, fileValue.length)
											}
										}
										var spanFile = document.querySelector('.span_file1')
										spanFile.innerText = fileValue
									}
								</script>
							</td>
						</tr>
						<tr class="cwf_tr">
							<td class="f_td">내용</td>
							<td class="s_td">
								<div class="s_td_div std_dd">
									<input type="file" name="content_file" class="content_file" accept="image/*" onchange="showfile2()">
									<c:if test="${empty wdVO }">
										현재 업로드된 파일 : <span class="span_file2"></span>
									</c:if>									
									<c:if test="${not empty wdVO }">
										현재 업로드된 파일 : <span class="span_file2">${wdVO.img_path }</span>
									</c:if>
								</div>
								<script>
									function showfile2() {
										var fileValue = document.querySelector('.content_file').value
										for(let i = 0; i < fileValue.length; i++) {
											if(fileValue.indexOf('\\') != -1) {
												fileValue = fileValue.substring(fileValue.indexOf('\\') + 1, fileValue.length)
											}
										}
										var spanFile = document.querySelector('.span_file2')
										spanFile.innerText = fileValue
									}
								</script>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="btn_div">
				<input class="save_btn" type="submit" value="저장" onclick="webtoonDetailCheck(event);">
				<input class="list_btn" type="button" value="목록" onclick="location.href = 'webtoon_list'">
			</div>
		
		
		</form>
	</div>
</div>

</body>
<script>
	// 웹툰 상세 회차 서브밋 체크
	function webtoonDetailCheck(event) {
		event.preventDefault()
		var bwTitle = document.querySelector('.bw_title').value
		var round = document.querySelector('.round').value
		var title = document.querySelector('.title').value
		var file1 = document.querySelector('.span_file1').innerText
		var file2 = document.querySelector('.span_file2').innerText
		
		if(bwTitle == '') {
			alert('웹툰을 선택해주세요.')
			return
		} else if(round == '') {
			alert('회차를 입력해주세요.')
			return
		} else if(title == '') {
			alert('제목을 입력해주세요.')
			return
		} else if(file1 == '') {
			alert('썸네일을 첨부해주세요.')
			return
		} else if(file2 == '') {
			alert('내용 이미지를 첨부해주세요.')
			return 
		} else {
			alert('웹툰을 등록합니다.')
			document.getElementById('webtoon_detail_regist').submit()
		}
	}
</script>
</html>