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
	.qna_write_main {
		width: 100%;
		margin: 3% 0;
	}
	.qna_write_main > .wrap {
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
	form {
		width: 80%;
		margin: auto;
	}
	.qna_detail_main {
		width: 1000px;
		margin: 80px auto;
	}
	.qna_detail_wrap {
		width: 100%;
	}
	.qna_detail_top {
		width: 100%;
	}
	.qna_detail_title {
		width: 100%;
		border-top: 2px solid #707070;
	}
	.qna_detail_title > .title {
		padding: 15px 20px;
		font-weight: bold;	
	}
	.qna_detail_info {
		display: flex;
		width: 100%;
		border-top: 1px solid #707070;
		border-bottom: 1px solid #707070;
	}
	.qna_detail_info > .qna_detail_date, 
	.qna_detail_info > .qna_detail_writer {
		display: flex;
		width: 50%;
	}
	.qna_detail_date > .title,
	.qna_detail_writer > .title {
		width: 40%;
		padding: 15px 20px;
		background-color: #F7F5F5;
	}
	.qna_detail_date > .date,
	.qna_detail_writer > .writer {
		width: 60%;
		padding: 15px 20px;
	}
	.qna_detail_contents {
		width: 100%;
	}
	.qna_detail_contents > .question_area {
		display: flex;
		border-bottom: 1px solid #707070;
		margin-bottom: 10px;
	}
	.qna_detail_contents > .question_area > .q_tag {
		margin: 0 25px;
		display: flex;
		align-items: center;
	}
	.qna_detail_contents .qna_detail_contents_content {
		padding: 40px 20px;
	}
	.qna_detail_contents .qna_detail_contents_content .content {
		margin: 0;
		margin-bottom: 5px;
		padding: 0;
		font-size: 12px;
	}
	.qna_detail_contents .qna_detail_contents_content .content textarea {
		all: unset;
		width: 95%;
		font-size: 12px;
		padding: 5px;
	}
	.qna_detail_contents > .answer_area {
		display: flex;
		background-color: #F2F2F2;
	}
	.qna_detail_contents > .answer_area > .q_tag {
		margin: 0 25px;
		display: flex;
		align-items: center;
	}
	.answer_area > .answer_content > .content {
		padding: 40px 20px;
		width: 990px;
	}
	.answer_area > .answer_content > .content textarea {
		all: unset;
		background-color: white;
		width: 95%;
		height: 200px;
		font-size: 12px;
		padding: 5px;
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
		width: 100%;
		margin-top: 20px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>

<div class="qna_write_main">
	<div class="wrap">
		<div class="form_title">1:1문의 답변</div>
		<form method="POST" id="qna_apply_modify_form">
			<input type="hidden" name="idx" value="${qVO.idx }">
			<div class="qna_detail_wrap">
				<div class="qna_detail_top">
					<div class="qna_detail_title">
						<div class="title">${qVO.title }</div>
					</div>
					<div class="qna_detail_info">
						<div class="qna_detail_date">
							<div class="title">작성일</div>
							<div class="date">${qVO.write_date }</div>
						</div>
						<div class="qna_detail_writer">
							<div class="title">작성자</div>
							<div class="writer">${qVO.writer }</div>
						</div>
					</div>
				</div>
				<div class="qna_detail_contents">
					<div class="question_area">
						<div class="q_tag"><img src="../img/view/qna/q_tag1.svg" /></div>
						<div class="qna_detail_contents_content">
							<div class="content">
								<textarea name="content" readonly>${qVO.content }</textarea>
							</div>
						</div>
					</div>
					<div class="answer_area">
						<div class="q_tag"><img src="../img/view/qna/q_tag2.svg" /></div>
						<div class="answer_content">
							<div class="content">
								<textarea name="apply_content" class="apply_content" placeholder="내용을 입력하세요.">${qVO.apply_content }</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="btn_div">
				<input class="save_btn" type="submit" value="저장" onclick="qnaApplySubmit(event)">
				<input class="list_btn" type="button" value="목록" onclick="location.href = 'qna_list'">
			</div>
		</form>
	</div>
</div>

</body>
<script>
	// 문의 답변 서브밋
	function qnaApplySubmit(event) {
		event.preventDefault()
		var content = document.querySelector('.apply_content').value
		
		if(content == '') {
			alert('답변을 입력해야합니다.')
		} else {
			alert('답변을 등록합니다.')
			document.getElementById('qna_apply_modify_form').submit()
		}
	}
</script>
</html>