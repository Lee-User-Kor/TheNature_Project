<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	.change_memberinfo_wrap {
		width: 100%;
	}
	.wrap {
		width: 1000px;
		margin: 100px auto;
	}
	.category_tab {
		display: flex;
		margin-bottom: 40px;
	}
	.inner_tab {
		padding: 10px 0;
		border-bottom: 1px solid #707070;
		font-size: 17px;
		font-weight: bold;
		text-align: center;
	}
	.change_memberinfo_tab {
		color: #5C8E46;
		width: 100px;
		border-bottom: 3px solid #5C8E46;
	}
	.change_pw_tab {
		width: 100px;
	}
	.my_posting_tab {
		width: 90px;
	}
	.manage_point_tab {
		width: 90px;
	}
	.present_check_tab {
		width: 75px;
	}
	.line_tab {
		padding: 10px 0;
		width: 30px;
		text-align: center;
		color: #707070;
	}
	.space_tab {
		width: 425px;
	}
	.notice_password_change {
		margin: 20px 0;
	}
	.notice_password_change p {
		margin: 0;
		margin-bottom: 10px;
		font-size: 13px;
	}
	.box_change_pw {
		width: 100%;
	}
	.change_pw_form > .pre_password {
		display: flex;
	}
	.pre_password > .pre_password_title {
		width: 20%;
    	font-size: 13px;
    	font-weight: bold;
    	display: flex;
    	align-items: center;
    	background-color: #F4F2F2;
    	padding: 20px 0;
    	border-top: 1px solid #707070;
    	border-bottom: 1px solid #707070;
	}
	.pre_password_title > span {
		margin-left: 15px;
	}
	.pre_password_title > .need_icon {
		width: 12px;
    	height: 15px;
    	margin-right: 5px;
	}
	.pre_password_input {
		width: 80%;
    	padding: 20px 0;
    	border-top: 1px solid #707070;
    	border-bottom: 1px solid #707070;
	}
	.pre_password_input > input {
		all: unset;
    	width: 250px;
    	font-size: 12px;
    	border-bottom: 1px solid #707070;
    	padding: 5px;
    	margin-left: 25px;
	}
	.pre_password_input > p {
		margin: 0;
    	margin-top: 5px;
    	margin-left: 25px;
    	font-size: 11px;
    	font-weight: bold;
	}
	.change_pw_form > .new_password {
		display: flex;
	}
	.new_password_title {
		width: 20%;
    	font-size: 13px;
    	font-weight: bold;
    	display: flex;
    	align-items: center;
    	background-color: #F4F2F2;
    	padding: 20px 0;
    	border-bottom: 1px solid #707070;
	}
	.new_password_title > span {
		margin-left: 15px;
	}
	.new_password_title > .need_icon {
		width: 12px;
		height: 15px;
		margin-right: 5px;
	}
	.new_password_input {
		width: 80%;
    	padding: 20px 0;
    	border-bottom: 1px solid #707070;
	}
	.new_password_input > input {
		all: unset;
    	width: 250px;
    	font-size: 12px;
    	border-bottom: 1px solid #707070;
    	padding: 5px;
    	margin-left: 25px;
	}
	.new_password_input > p {
		margin: 0;
    	margin-top: 5px;
    	margin-left: 25px;
    	font-size: 11px;
    	font-weight: bold;
	}
	.new_password_check {
		display: flex;
    	margin-bottom: 15px;
	}
	.new_password_check_title {
		width: 20%;
    	font-size: 13px;
    	font-weight: bold;
    	display: flex;
    	align-items: center;
    	background-color: #F4F2F2;
    	padding: 20px 0;
    	border-bottom: 1px solid #707070;
	}
	.new_password_check_title > span {
		margin-left: 15px;
	}
	.new_password_check_title > .need_icon {
		width: 12px;
    	height: 15px;
    	margin-right: 5px;
	}
	.new_password_check_input {
		width: 80%;
    	display: flex;
    	padding: 20px 0;
    	border-bottom: 1px solid #707070;
	}
	.new_password_check_input > input {
		all: unset;
    	width: 250px;
    	font-size: 12px;
    	border-bottom: 1px solid #707070;
    	padding: 5px;
    	margin-left: 25px;
	}
	.co_check_btn {
		border: 1px solid #707070;
    	font-size: 12px;
    	color: #707070;
    	padding: 5px 25px;
    	cursor: pointer;
    	margin-left: 10px;
	}
	.text_co_password {
		font-size: 10px;
    	color: blue;
    	padding: 5px;
    	display: flex;
    	align-items: center;
	}
	.text_noco_password {
		font-size: 10px;
    	color: red;
    	padding: 5px;
    	display: flex;
    	align-items: center;
	}
	.change_pw_form > .button_area {
		text-align: center;
    	margin-top: 30px;
	}
	.change_pw_form > .button_area input[type="button"] {
		all: unset;
    	font-size: 13px;
    	font-weight: bold;
    	padding: 5px 35px;
    	border: 1px solid #72886C;
    	border-radius: 50px;
    	cursor: pointer;
	}
	.change_pw_form > .button_area input[name="change_btn"] {
		background-color: #35600C;
    	color: white;
	}
	.change_pw_form > .button_area input[name="cancel"] {
		color: #35600C;
    	margin-left: 5px;
	}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp"/>

<div class="change_pw_wrap">
	<div class="wrap">
		<div class="category_tab">
			<div class="change_memberinfo_tab inner_tab"><a href="${root }/mypage?mode=info">회원정보수정</a></div>
			<div class="line_tab inner_tab">|</div>
			<div class="change_pw_tab inner_tab"><a href="${root }/mypage?mode=pw">비밀번호수정</a></div>			
			<div class="line_tab inner_tab">|</div>
			<div class="my_posting_tab inner_tab"><a href="${root }/my_posting">게시글관리</a></div>
			<div class="line_tab inner_tab">|</div>
			<div class="manage_point_tab inner_tab"><a href="${root }/manage_point">포인트관리</a></div>
			<div class="line_tab inner_tab">|</div>
			<div class="present_check_tab inner_tab"><a href="${root }/present_check">출석체크</a></div>
			<div class="space_tab inner_tab"></div>
			<script>
				var link = window.location.href
				if(link.indexOf('change_pw')) {
					document.querySelector('.change_pw_tab').style.color = '#5C8E46'
					document.querySelector('.change_pw_tab').style.borderBottom = '3px solid #5C8E46'
					document.querySelector('.change_memberinfo_tab').style.color = 'black'
					document.querySelector('.change_memberinfo_tab').style.borderBottom = '1px solid #707070'
				}
			</script>
		</div>
		<div class="notice_password_change">
        	<p>- 새로운 비밀번호를 입력하여 주십시오.</p>
        	<p>- 연속된 숫자, 생일, 주민등록번호 등 알기 쉬운 숫자는 피해주시기 바랍니다.</p>
        </div>
        <div class="box_change_pw">
        	<form class="change_pw_form" method="POST" id="changepw_form">
				<input type="hidden" name="idx" value="${member.idx }">
        		<div class="pre_password">
        			<div class="pre_password_title">
        				<span>비밀번호</span>
        				<div class="need_icon" style="color: #EA933C;">*</div>
        			</div>
        			<div class="pre_password_input">
        				<input type="password" id="prepw" name="prepassword" placeholder="비밀번호를 입력하세요.">
        			</div>
        		</div>
        		<div class="new_password">
        			<div class="new_password_title">
        				<span>새비밀번호</span>
        				<div class="need_icon" style="color: #EA933C;">*</div>
        			</div>
        			<div class="new_password_input">
        				<input type="password" class="pw" name="newpassword" id="password1" placeholder="비밀번호를 입력하세요.">
        				<span id="pw_true" style="display: none; color: blue; font-size: 11px; margin-left: 25px;">사용가능</span>
  							<span id="pw_false" style="display: none; color: red; font-size: 11px; margin-left: 25px;">사용불가</span>
        				<input type="hidden" id="password_check" value="false">
        				<p>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10~16자)</p>
        			</div>
        			<script>
        			// 비밀번호 정규식
        			$('.pw').keyup(
						function (){
							var pw = $("#password1").val();
							var num = pw.search(/[0-9]/g);
							var eng = pw.search(/[a-z]/ig);
							var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

							if(pw.length < 10 || pw.length > 16){
								$("#pw_false").css('display', 'block');
								$("#pw_true").css('display', 'none');
								$('#password_check').val('false');
							} else if(pw.search(/\s/) != -1){
								$("#pw_false").css('display', 'block');
								$("#pw_true").css('display', 'none');
								$('#password_check').val('false');
							} else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
								$("#pw_false").css('display', 'block');
								$("#pw_true").css('display', 'none');
								$('#password_check').val('false');
							} else {
								$("#pw_true").css('display', 'block');
								$("#pw_false").css('display', 'none');
								$('#password_check').val('true');
						 }
						}
					);
        			</script>
        		</div>
        		<div class="new_password_check">
        			<div class="new_password_check_title">
        				<span>새비밀번호 확인</span>
        				<div class="need_icon" style="color: #EA933C;">*</div>
        			</div>
        			<div class="new_password_check_input">
        				<input type="password" name="password" id="password2" placeholder="새비밀번호 확인" onkeyup="checkPassword()">
        				<input type="hidden" id="checkForCheck" value="false">
        				<script>
							// 비밀번호 일치여부
							function checkPassword() {
								const password1 = document.getElementById('password1').value
								const password2 = document.getElementById('password2').value
								
								if(password1 == password2 && password1 != '') {
									document.querySelector('.text_co_password').classList.remove('hidden')
									document.querySelector('.text_noco_password').classList.add('hidden')
									var checkForCheck = document.getElementById('checkForCheck')
									checkForCheck.value = 'true'
								} 
								else {
									document.querySelector('.text_noco_password').classList.remove('hidden')
									document.querySelector('.text_co_password').classList.add('hidden')
								}
								console.log(password1)
							}
						</script>
        				<div class="text_co_password hidden">비밀번호가 일치합니다.</div>
        				<div class="text_noco_password hidden">비밀번호가 일치하지 않습니다.</div>
        			</div>
        		</div>
        		<div class="button_area">
	        		<input onclick="checkSubmit(event)" type="button" name="change_btn" value="완료">
	        		<script>
						function checkSubmit(event) {
							event.preventDefault();
							var pwCheck = document.getElementById('password_check')
							var form = document.querySelector('.change_pw_form')
							if(pwCheck.value == 'false' || document.getElementById('prepw').value == '') {
								alert("잘못된 비밀번호를 입력하셨습니다.")
							}else {
								if(document.getElementById('checkForCheck').value == 'true'){
									form.submit();
								}else {
									alert('비밀번호 확인이 필요합니다.')
								}
							}
						}
					</script>
	        		<a href="javascript:history.back();"><input type="button" name="cancel" value="취소"></a>
        		</div>
        	</form>
        </div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>