<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="${root }/img/view/header/logo.ico" rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>The_Nature</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style>
body {
	padding: 0;
	margin: 0;
}
.center_div {
	margin-top: 100px;
}
.center_div input[type=text] {
	outline: none;
}
.center_div input {
	cursor: pointer;
}
.cc_div {
	margin: 20px 0;
}
.close_div {
	margin-top: 40px;
}
.close_div button {
	cursor: pointer;
}
</style>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}" />
		<div class="center_div" align="center">
			<div>인증번호를 입력해주세요.</div>
				<div class="cc_div">
					<form method="post">
						<input type="text" name="certification" id="pop_certification" /> 
						<input type="submit" onclick="submitCheck(event)" value="확인" />
						<input type="hidden" id="check" value="${check}">
					</form>
				</div>
		</div>

	<div class="close_div" align="center">
		<button onclick="self.close()">닫기</button>
	</div>
	<script>
		function submitCheck(event) {
			event.preventDefault()
			var popCertification = $('#pop_certification').val()
			$.ajax({
				type : "POST",
				url : "sendEmail",
				data : { popCertification : popCertification },
				dataType : "text",
				success : function(data) {
					if ($.trim(data) == 1) {
						alert('인증이 완료되었습니다.')
						opener.email_certification.value = '인증완료'
						opener.do_certification.style.backgroundColor = '#707070'
						opener.do_certification.style.color = 'white'
						opener.do_certification.style.cursor = ''
						opener.do_certification.value = '인증완료'
						opener.do_certification.disabled = true
						self.close()
					} else {
						alert('인증번호가 일치하지 않습니다.');
					}
				},
				error : function() {
					alert('에러입니다')
				}
			})
		}
	</script>
</body>
</html>