<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />    
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
		padding: 0;
        margin: 0;
        width: 100%;
        font-family: 'Nanum Gothic', sans-serif;
	}
	a {
		text-decoration: none;
    	color: inherit;
    	cursor: pointer;
	}
	.qna_write_form_wrap {
		width: 1000px;
		margin: auto;
		margin-top: 80px;
	}
	.qna_write_form_wrap > .page_name {
		width: 100%;
		margin-bottom: 20px;
    	font-size: 14px;
    	font-weight: bold;
	}
	.qna_write_form_wrap > .agree_text_div {
		width: 100%;
		border: 1px solid #707070;
	}
	.qna_write_form_wrap > .agree_text_div > .agree_wrap {
		width: 100%;
		padding: 30px;
	}
	.qna_write_form_wrap > .agree_text_div > .agree_wrap p {
		margin:0;
		margin-bottom: 20px;
		font-size: 12px;
	}
	.qna_write_form_wrap > .agree_text_div > .agree_wrap p:first-child {
		font-size: 15px;
	}
	.qna_write_form_wrap > .agree_text_div > .agree_wrap p:nth-child(6) {
		margin: 0;
	}
	.qna_write_form_wrap > .agree_text_div > .agree_wrap p:last-child {
		margin: 0;
	}
	.qna_write_form_wrap > .checkbox_div {
		display: flex;
		align-items: center;
		margin-top: 10px;
		margin-bottom: 25px;
		font-size: 14px;
	}
	.qna_write_form_wrap > .checkbox_div > label {
		display: flex;
		align-items: center; 
		justify-content: center;
	}
	.checkboxImg {
		display: none;
	}
	.agreeBox:hover, .disagreeBox:hover {
		cursor: pointer;
	}
	.agreeBox, .disagreeBox {
		width: 18px;
		height: 18px;
	}
	.necessary {
		text-align: right;
		margin: 10px 0;
		font-size: 13px;
	}
	.qna_write_form_wrap > form {
		width: 100%;
		border-top: 1px solid #707070;
	}
	form > .question_write_form {
		width: 100%;
	}
	form > .question_write_form > .title,
	form > .question_write_form > .writer,
	form > .question_write_form > .email,
	form > .question_write_form > .content {
		display: flex;
		border-bottom: 1px solid #707070;
	}
	form > .question_write_form .name {
		width: 15%;
		font-size: 13px;
		padding: 10px;
		background-color: #EEEEEE;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	form > .question_write_form .title_input {
		width: 100%;
		border: 1px solid #707070;
		box-sizing: border-box;
	}
	form > .question_write_form input {
		all: unset;
		font-size: 12px;
		padding: 8px;
	}
	form > .question_write_form .title_input > input {
		width: 95%;	
	}
	.input_wrap {
		width: 85%;
		padding: 8px 0;
		padding-left: 8px;
	}
	.input_wrap > .writer_input {
		width: 30%;
		border: 1px solid #707070;
	}
	.input_wrap > .writer_input > input {
		width: 95%;
	}
	.input_wrap > .email_input {
		width: 100%;
		display: flex;
		align-items: center;
	}
	.input_wrap > .email_input > .select_email_domain {
		padding: 6px;
		border: 1px solid #707070;
	}
	.input_wrap > .email_input > .select_email_domain > select {
		border: none;
		font-size: 12px;
		outline: none;
		height: 15px;
	}
	.input_wrap > .email_input input:first-child,
	.input_wrap > .email_input input:last-child {
		width: 28%;
		padding: 8px;
		border: 1px solid #707070;
		box-sizing: border-box;
	}
	.input_wrap > .content_input {
		width: 100%;
		height: 200px;
		border: 1px solid #707070;
		box-sizing: border-box;
	}
	.input_wrap > .content_input textarea {
		all: unset;
		width: 95%;
		height: 95%;
		font-size: 12px;
		padding: 8px;
	}
	.submit_div {
		margin-top: 15px;
	}
	.submit_div input[type="button"] {
		all: unset;
		cursor: pointer;
		width: 60px;
		padding: 5px 0;
		text-align: center;
		font-size: 12px;
		font-weight: bold;
		border: 1px solid #35600C;
		margin-right: 10px;
	}
	.submit_div #save {
		background-color: #35600C;
		color: white;
	}
	.submit_div #cancel {
		border: 1px solid #35600C;
		color: #35600C;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp" />

<c:if test="${empty member }">
	<script>
		alert('로그인이 필요한 페이지입니다.')
		history.back()
	</script>
</c:if>

<div class="qna_write_form_wrap">
	<div class="page_name">1:1문의 작성</div>
	<div class="agree_text_div">
		<div class="agree_wrap">
			<p>(필수) 개인정보보호를 위한 이용자 동의</p>
			<p>1. 수집·이용 목적 : 상담 및 온라인 신청 접수에 따른 수집·이용</p>
			<p>2. 개인정보 수집 항목</p>
			<p>- 필수항목 : 작성자명, 이메일</p>
			<p>3. 개인정보 보유 및 이용기간 : 3년</p>
			<p>4. 동의 거부 시 불이익에 관한 사항 : 수집·이용에 관한 사항의 동의를 거부할 때에는 서비스의 이용이 제한됩니다.</p>
			<p>단, 선택정보 사항을 획득하지 못한 사유로 인하여 서비스 제공을 거부하지 않습니다.</p>
		</div>
	</div>
	<div class="checkbox_div">
		<label class="chklabel">
			<input class="checkboxImg" name="chkbox" type="checkbox" id="agree" onclick="chkboxCtr(event);">
			<img class="agreeBox" name="chkimg" src="${root }/img/view/qna/checkbox.png">
		</label>
		<div style="margin-left: 10px; margin-right: 20px; display: flex; align-items: center;">
			<span style="vertical-align: sub">동의합니다.</span>
		</div>
		<label class="chklabel">
			<input class="checkboxImg" name="chkbox" type="checkbox" id="disagree" onclick="chkboxCtr(event);">
			<img class="disagreeBox" name="chkimg" src="${root }/img/view/qna/checkbox.png">
		</label>
		<div style="margin-left: 10px; display: flex; align-items: center;">
			<span style="vertical-align: sub">동의하지 않습니다.</span>
		</div>
		<script>
		// 동의 체크박스
			function chkboxCtr(event) {				
				if(event.target.checked) {
					var chkboxes = document.getElementsByName('chkbox')
					for(let i = 0; i < chkboxes.length; i++) {
						chkboxes[i].checked = false
						chkboxes[i].nextSibling.nextSibling.src = '${root }/img/view/qna/checkbox.png'
					}
					event.target.checked = true
					event.target.nextSibling.nextSibling.src = '${root }/img/view/qna/checkbox2.png'
				}
			}
		</script>
	</div>
	<div class="necessary"><span style="color: red; margin-right: 5px;">*</span><span>필수항목입니다.</span></div>
	<form method="POST" id="qna_write_form">
		<div class="question_write_form">
			<input type="hidden" name="member_idx" value="${member.idx }">
			<div class="title">
				<div class="name">제 목 <span style="color: red;">&nbsp;*</span></div>
				<div class="input_wrap">	
					<div class="title_input"><input type="text" name="title" class="form_title" value="" placeholder="20자 이내로 입력해주세요"></div>
				</div>
			</div>
			<div class="writer">
				<div class="name">작 성 자</div>
				<div class="input_wrap">	
					<div class="writer_input"><input type="text" name="writer" value="${member.name }" readonly></div>
				</div>
			</div>
			<div class="email">
				<div class="name">이 메 일 <span style="color: red;">&nbsp;*</span></div>
				<div class="input_wrap">	
					<div class="email_input">
						<input type="text" name="email_id" value="${fn:split(member.email, '@')[0] }" readonly>&nbsp;@&nbsp;
						<input type="text" id="email_domain" value="${fn:split(member.email, '@')[1] }" name="email_domain" style="width: 28%; border: 1px solid #707070;" readonly>
					</div>
				</div>
			</div>
			<div class="content">
				<div class="name">내 용 <span style="color: red;">&nbsp;*</span></div>
				<div class="input_wrap">	
					<div class="content_input"><textarea name="content" class="form_content"></textarea></div>
				</div>
			</div>
		</div>
		<!-- 저장/취소 -->
		<div class="submit_div">
			<label><input type="button" id="save" value="저장" onclick="writeSubmitCheck()"></label>
			<label><input type="button" id="cancel" value="취소" onclick="goQna()"></label>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
<script>
	function goQna() {
		event.preventDefault()
		location.href = 'qna'
	}
</script>
<script>
// 서브밋 체크
	function writeSubmitCheck() {
		var title = document.querySelector('.form_title').value
		var content = document.querySelector('.form_content').value
		
		if(document.getElementById('agree').checked == false) {
			alert('개인정보보호 조항에 동의하셔야합니다.')
			return
		} else if(document.getElementById('disagree').checked == true) {
			alert('개인정보보호 조항에 동의하셔야합니다.')
			return
		} else if(title == '') {
			alert('제목을 입력해야합니다.')
			return
		} else if(content == '') {
			alert('내용을 입력해야합니다.')
			return 
		} else {
			alert('문의가 등록되었습니다.')
			document.getElementById('qna_write_form').submit()
		}
	}
</script>
</html>