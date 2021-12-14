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

.fi_wrap {
	width: 1000px;
	margin: 30px auto 139px auto;
}

.category_tab {
	display: flex;
}

.inner_tab {
	padding: 10px 0;
	border-bottom: 1px solid #707070;
}

.video_tab {
	width: 88px;
	color: #707070;
	font-size: 17px;
	font-weight: bold;
}

.line_tab {
	padding: 10px 0;
	width: 30px;
	text-align: center;
	color: #707070;
}

.ar_tab {
	width: 109px;
	color: #5C8E46;
	font-size: 17px;
	font-weight: bold;
	border-bottom: 3px solid #5C8E46;
}

.space_tab {
	width: 793px;
}

.fi_title {
	margin: 30px 0;
	color: #272727;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
}
.fi_input_div1 {
	width: 488px;
	margin: 15px auto;
	border: 1px solid #707070;
	padding: 5px;
}
.fi_input_div1 input {
	border: none;
	outline: none;
	width: 300px;
	height: 25px; 
}
.fi_input_div2 {
	width: 500px;
	margin: 15px auto;
	display: flex;
	justify-content: space-between;
}
.fi_input_div2 input {
	border: none;
	outline: none;
	width: 140px;
	height: 29px;
    padding: 5px;
}
.fi_input_email {
	border: 1px solid #707070;
}
.fi_select_domain {
	padding: 8px;
	border: 1px solid #707070;
}
.fi_select_domain select {
	padding: 2px 5px;
	border: none;
	outline: none;
	cursor: pointer; 
}
.btn_certification {
	padding: 5px;
	border: 1px solid #707070;
	cursor: pointer;
	font-size: 14px;
	display: flex;
	align-items: center;
}
.fi_btn_div {
	width: 500px;
	margin: 30px auto;
}
.fi_btn_div input[type=submit] {
	width: 500px;
	height: 60px;
	border: 1px solid #35600C;
	border-radius: 10px;
	background-color: white;
	color: #35600C;
	font-size: 17px;
	font-weight: bold;
}
.fi_btn_div input[type=submit]:hover {
	background-color: #35600C;
	color: white;
	cursor: pointer;
}
.fi_bot {
	text-align: center;
	font-size: 12px;
	color: #333333;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_third.jsp"/>

<div class="total_wrap">
	<div class="fi_wrap">
	
		<div class="category_tab">
			<div class="video_tab inner_tab"><a href="${root }/find_id">아이디 찾기</a></div>
			<div class="line_tab inner_tab">|</div>
			<div class="ar_tab inner_tab"><a href="${root }/find_pw">비밀번호 찾기</a></div>
			<div class="space_tab inner_tab"></div>
		</div>
		
		<div class="fi_title">
			<span>비밀번호 찾기</span>
		</div>
		
		<form method="POST" id="find_pw_form">
		<div class="fi_input_div1">
			<input type="text" name="m_id" id="m_id" placeholder="아이디을 입력하세요.">
		</div>

		<div class="fi_input_div2">
			<div class="fi_input_email">
				<input type="text" name="e_id" id="e_id" placeholder="이메일을 입력해주세요.">@<input id="e_domain" type="text" name="e_domain" id="e_domain" placeholder="직접입력">
			</div>
			<div class="fi_select_domain">
				<select id="domainSelect" onchange="selectDomain()">
					<option selected="selected" value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</div>
			<input type="hidden" id="email_certification" value="">
			<div class="btn_certification" id="do_certification" onclick="emailCheck(find_pw_form, '${root}');">인증</div>
			<script>
				function emailCheck(obj, root) {
					// 인증을 누를 때 member 테이블에 접근해서 회원정보 일치여부 확인
					var id = $('#m_id').val()
					var email = $('#e_id').val() + '@' + $('#e_domain').val()
					$.ajax({
						url: 'id_email_check',
						type: 'POST',
						data: {
							m_id : id,
							e_id : email
						},
						success: function(data) {
							if($.trim(data) == 0) {
								// 이메일 인증 팝업창
								if($("#e_id").val() == '' || $("#e_domain").val() == '') {
									alert('이메일을 입력해주세요')
									return
								} else {
									var emailAddr = $("#e_id").val() + '@' + $("#e_domain").val()
									let url = root + "/sendEmail?emailAddr=" + emailAddr
									window.open(url, "", "width=600, height=400")
								}								
							} else {
								alert("정보를 다시 확인해주세요.")
							}
						},
						error: function() {
							alert("에러입니다.")
						}
					})
				}
			</script>
			<script>
				function selectDomain() {
					var eDomain = document.getElementById('e_domain')
					var domainSelect = document.getElementById('domainSelect')
					eDomain.value = domainSelect.value
				}
			</script>
		</div>
		
		<div class="fi_btn_div">
			<input type="submit" value="비밀번호 찾기" onclick="findSubmitCheck();">
		</div>
		</form>

		<div class="fi_bot">
			<span><a href="${root }/find_id">아이디 찾기</a></span>
			<span style="margin: 0 10px;">|</span>
			<span><a href="${root }/login">로그인 하기</a></span>
		</div>
		
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
<script>
	// 서브밋 체크
	function findSubmitCheck() {
		event.preventDefault()
		var id = document.getElementById('m_id').value
		var email = document.getElementById('e_id').value
		var emailDomain = document.getElementById('e_domain').value
		var certification = document.getElementById('email_certification').value
		
		if(id == '') {
			alert('아이디를 입력해야 합니다.')
			return
		} else if(email == '' || emailDomain == '') {
			alert('이메일을 입력해야 합니다.')
			return
		} else 
		if(certification == '') {
			alert('이메일 인증을 진행해야합니다.')
			return
		} else {
			document.getElementById('find_pw_form').submit()
		}
	}
</script>
</html>