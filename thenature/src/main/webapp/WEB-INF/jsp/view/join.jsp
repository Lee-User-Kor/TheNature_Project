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
.join_wrap {
	width: 1000px;
	margin: 100px auto;
}
.join_title {
	text-align: center;
	color: #333333;
	font-size: 20px;
	font-weight: bold; 
}
.join_sub_title {
	display: flex;
	justify-content: space-between;
	padding-left: 10px;
}
.jst_left {
	color: #393737;
	font-size: 17px;
	font-weight: bold;
}
.jst_right {
	color: #393737;
	font-size: 20px;
	font-weight: bold;
}
.join_sub_title {
	margin: 10px 0;
}
.join_info {
	margin-bottom: 50px;
}
.join_table {
	width: 1000px;
	border-top: 1px solid #707070;
	border-collapse: collapse;
}
.join_tr {
	border-bottom: 1px solid #707070;
}
.f_td {
	width: 142px;
	padding: 0;
	padding-left: 50px;
	font-size: 17px;
	font-weight: bold;
	background-color: #F4F4F4;
}
.necessary {
	color: #C71717;
}
.s_td {
	width: 752px;
	padding: 20px;
}
.td_id_top {
	display: flex;
}
.td_id_input, .td_pw_input, .td_pw_check, .td_name, .td_post, .td_ad, .td_ad_detail, .td_tel {
	border-bottom: 1px solid #707070;
	padding: 5px 10px;
	width: 500px;
}
.td_id_input input[type=text], .td_pw_input input[type=password], .td_pw_check input[type=password], .td_name input[type=text],
.td_post input[type=text], .td_ad input[type=text], .td_ad_detail input[type=text], .td_tel input[type=text] {
	border: none;
	outline: none;
	width: 400px;
}
.td_id_btn, .td_ad_btn, .td_email_select {
	margin-left: 15px;
}
.td_id_btn input[type=button], .td_ad_btn input[type=button] {
	border: 1px solid #707070;
	background-color: white;
	font-size: 15px;
	height: 30px;
	padding: 0 15px;
	color: #393737;
}
.td_id_btn input[type=button]:hover, .td_ad_btn input[type=button]:hover {
	background-color: #707070;
	color: white;
	cursor: pointer;
}
.td_id_bot, .td_pw_bot {
	font-size: 12px;
	font-weight: bold;
	color: #393737;
	margin-top: 10px;
}
.td_top {
	display: flex;
}
.td_ad {
	margin: 10px 0;
}
.td_email_wrap {
	display: flex;
}
.td_email1, .td_email2 {
	border-bottom: 1px solid #707070;
	padding: 5px 10px;
}
.td_email1 input[type=text], .td_email2 input[type=text] {
	border: none;
	outline: none;
}
.td_email_select select {
	height: 30px;
	padding: 0 10px;
	border: 1px solid #707070;
	cursor: pointer;
	outline: none;
}
.separator {
	display: table;
}
.separator span {
	display: table-cell;
	vertical-align: middle; 
}
.agree_box {
	display: none; 
}
.join_agree_all {
	margin-top: 80px;
	color: #333333;
	font-size: 17px;
	font-weight: bold;
}
.join_agree_all_checkbox {
	margin: 20px 0 50px 0;
	color: #393737;
	font-size: 15px;
	font-weight: bold;
}
.join_agree_all_checkbox label {
	display: table;
}
.join_agree_all_checkbox span img {
	vertical-align: bottom;
}
.join_agree_all_checkbox span {
	display: table-cell;
	vertical-align: middle;
	padding-right: 8px;
}
.join_necessary_agree {
	color: #333333;
	font-size: 17px;
	font-weight: bold;
	margin-bottom: 20px;
}
.join_necessary_text {
	background-color: #F4F4F4;
	border: 1px solid #707070;
	padding: 15px 10px; 
}
.join_necessary_text textarea {
	resize: none;
	width: 97%;
	height: 150px;
	color: #707070;
	font-size: 14px;
    font-weight: bold;
    line-height: 25px;
    background-color: inherit;
    border: none;
    outline: none;
}
.form_btn_div {
	text-align: center;
}
.form_btn_div input {
	border: 1px solid #35600C;
	border-radius: 5px;
	color: #35600C;
	font-size: 17px;
	font-weight: bold;
	text-align: center;
	width: 100px;
	height: 35px;
	background-color: white;
}
.form_btn_div input:hover {
	background-color: #35600C;
	cursor: pointer;
	color: white;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp"/>

<div class="total_wrap">
	<div class="join_wrap">
		
		<div class="join_title">
			<span>회원가입</span>
		</div>
		
		<div class="join_sub_title">
			<div class="jst_left">
				<span>기본정보</span>
			</div>
			<div class="jst_right">
				<span style="color: #C71717;">*</span>
				<span>필수입력사항</span>
			</div>
		</div>
		
		<form id="join_form" method="POST">
		<div class="join_info">
			<table class="join_table">
				<tbody class="join_tbody">
					<tr class="join_tr">
						<td class="f_td">
							<span class="necessary">*</span>
							<span>아이디</span>
						</td>
						<td class="s_td">
							<div class="td_id_top">
								<div class="td_id_input"><input type="text" name="id" id="userId" placeholder="아이디" required></div>
								<div class="td_id_btn"><input type="button" value="중복확인" onclick="checkId()"></div>
								<script>
									// id 유효성 검사
									function checkIdUseful() {
										var getCheck = RegExp(/^[a-z0-9]{4,16}$/)
										
										if($("#userId").val() == ""){
									        alert("아이디를 입력해주세요.");
									        $("#userId").focus();
									        return false;
									      }
										
										if(!getCheck.test($("#userId").val())){
									        alert("형식에 맞게 입력해주세요");
									        $("#userId").val("");
									        $("#userId").focus();
									        return false;
									      }
									}
									// id 중복확인
									function checkId() {
										$("#show_checkId_result").text("")
										$("#checkIdResult").remove()
										if(checkIdUseful() == false) {
											return
										}
										var userId = $("#userId").val()
										$.ajax({
											type: "POST",
											url: "ajax_checkId",
											data: { userId : userId },
											dataType : "text",
											success: function(result){
												if(result == 1) {
													$("#show_checkId_result").text("사용할 수 있습니다.")
													$("#show_checkId_result").css("color", "blue")
													var moreVal = document.createElement('input')
													moreVal.type = 'hidden'
													moreVal.id = 'checkIdResult'
													moreVal.value = '1'
													$("#show_checkId_result").append(moreVal)
												}else {
													$("#show_checkId_result").text("사용할 수 없습니다.")
													$("#show_checkId_result").css("color", "red")
												}
											},
											error: function(a, b, c){
												console.log('ERROR a : ' + a)
												console.log('ERROR b : ' + b)
												console.log('ERROR c : ' + c)
											}
										})
									}
								</script>
							</div>
							<div class="td_id_bot">
								<span>(영문소문자/숫자, 4 ~ 16글자)</span>
								<span id="show_checkId_result"></span>
							</div>
						</td>
					</tr>
					<tr class="join_tr">
						<td class="f_td">
							<span class="necessary">*</span>
							<span>비밀번호</span>
						</td>
						<td class="s_td">
							<div class="td_pw_input"><input type="password" id="pw_first" name="pw" placeholder="비밀번호" required onkeyup="checkPwRule()"></div>
							<script>
								// pw 유효성 검사
								function checkPwRule() {
									var pw = $("#pw_first").val();
									var num = pw.search(/[0-9]/g);
									var eng = pw.search(/[a-z]/ig);
									var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
									if(pw.length < 10 || pw.length > 16){
										$("#show_checkPw_result").text("10자리 ~ 16자리 이내로 입력해주세요.");
										$("#show_checkPw_result").css("color", "red")
									}else if(pw.search(/\s/) != -1){
										$("#show_checkPw_result").text("비밀번호는 공백 없이 입력해주세요.");
										$("#show_checkPw_result").css("color", "red")
									}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
										$("#show_checkPw_result").text("영문 대소문자,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
										$("#show_checkPw_result").css("color", "red");
									}else if($("#userId").val()==($("#pw_first").val())) {
										$("#show_checkPw_result").text("id와 비밀번호는 같을 수 없습니다.");
										$("#show_checkPw_result").css("color", "red");
									}else {
										$("#show_checkPw_result").text("사용 가능");
										$("#show_checkPw_result").css("color", "blue");
										var moreVal = document.createElement('input')
										moreVal.type = 'hidden'
										moreVal.id = 'checkPwResult'
										moreVal.value = '1'
										$("#show_checkPw_result").append(moreVal)
									}
								}
							</script>
							<div class="td_pw_bot">
								<span>(영문 대소문자/숫자/특수문자 중 2가지 이상조합, 10 ~ 16자)</span>
								<span id="show_checkPw_result"></span>
							</div>
						</td>
					</tr>
					<tr class="join_tr">
						<td class="f_td">
							<span class="necessary">*</span>
							<span>비밀번호 확인</span>
						</td>
						<td class="s_td">
							<div class="td_pw_check"><input type="password" id="pw_second" name="pw_check" placeholder="비밀번호 확인" required onkeyup="confirmPw()"></div>
							<script>
								function confirmPw() {
									var check = $("#checkPwResult").val()
									if(check != 1) {
										$("#show_confirmPw_result").text("비밀번호를 확인해주세요.")
										$("#show_confirmPw_result").css("color", "red")
									}
									if($("#pw_first").val()!=($("#pw_second").val())){
										$("#show_confirmPw_result").text("비밀번호가 일치하지 않습니다.")
										$("#show_confirmPw_result").css("color", "red")
									}else {
										$("#show_confirmPw_result").text("비밀번호가 일치합니다.")
										$("#show_confirmPw_result").css("color", "blue")
										var moreVal = document.createElement('input')
										moreVal.type = 'hidden'
										moreVal.id = 'confirmPwResult'
										moreVal.value = '1'
										$("#show_confirmPw_result").append(moreVal)
									}
								}
							</script>
							<div class="td_pw_bot">
								<span id="show_confirmPw_result"></span>
							</div>
						</td>
					</tr>
					<tr class="join_tr">
						<td class="f_td">
							<span class="necessary">*</span>
							<span>이름</span>
						</td>
						<td class="s_td">
							<div class="td_name"><input type="text" id="chk_name" name="name" placeholder="이름" required></div>
						</td>
					</tr>
					<tr class="join_tr">
						<td class="f_td" style="padding-left: 66px;">
							<span>주소</span>
						</td>
						<td class="s_td">
							<div class="td_top">
								<div class="td_post"><input type="text" name="post" id="postcode" placeholder="우편번호"></div>
								<div class="td_ad_btn"><input type="button" value="주소검색" onclick="sample6_execDaumPostcode()"></div>
							</div>
							<div class="td_ad"><input type="text" name="address" id="address" placeholder="주소"></div>
							<div class="td_ad_detail"><input type="text" name="address_detail" id="detailAddress" placeholder="상세주소"></div>
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							// 주소 api
								function sample6_execDaumPostcode() {
							    new daum.Postcode({
							        oncomplete: function(data) {
							            var addr = '';
							//             var extraAddr = '';
							            if (data.userSelectedType === 'R') {
							                addr = data.roadAddress;
							            } else {
							                addr = data.jibunAddress;
							            }
							            if(data.userSelectedType === 'R'){
							//                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							//                     extraAddr += data.bname;
							//                 } 
							//                 if(data.buildingName !== '' && data.apartment === 'Y'){
							//                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							//                 }
							//                 if(extraAddr !== ''){
							//                     extraAddr = ' (' + extraAddr + ')';
							//                 }
							//                 document.getElementById("sample6_extraAddress").value = extraAddr;
							//             } else {
							//                 document.getElementById("sample6_extraAddress").value = '';
							            }
							            document.getElementById('postcode').value = data.zonecode;
							            document.getElementById("address").value = addr;
							            document.getElementById("detailAddress").focus();
							        }
							    }).open();
							}
							</script>
						</td>
					</tr>
					<tr class="join_tr">
						<td class="f_td">
							<span class="necessary">*</span>
							<span>이메일</span>
						</td>
						<td class="s_td">
							<div class="td_email_wrap">
								<div class="td_email1"><input type="text" id="chk_email_first" name="email_first" placeholder="이메일" required></div>
								<div class="separator"><span>@</span></div>
								<div class="td_email2"><input id="e_domain" name="email_second" type="text" placeholder="직접입력" required></div>
								<div class="td_email_select">
									<select id="domainSelect" onchange="selectDomain()">
										<option selected="selected" value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</div>
								<input type="hidden" id="email_certification" value="">
								<div class="td_id_btn"><input id="do_certification" type="button" value="인증하기" onclick="emailCheck(join_form, '${root}')"></div>
							</div>
							<script>
								function emailCheck(obj, root) {
									var esVal = $("#e_domain").val()
									console.log(esVal)
									if($("#chk_email_first").val() == '' || $("#e_domain").val() == '') {
										alert('이메일을 입력해주세요')
										return
									}else {
										var emailAddr = $("#chk_email_first").val() + '@' + $("#e_domain").val()
										let url = root + "/sendEmail?emailAddr=" + emailAddr
										window.open(url, "", "width=600, height=400")
									}
								}
							</script>
							<script>
								function selectDomain() {
									var eDomain = document.getElementById('e_domain')
									var domainSelect = document.getElementById('domainSelect')
									eDomain.value = domainSelect.value
								}
							</script>
						</td>
					</tr>
					<tr class="join_tr">
						<td class="f_td">
							<span class="necessary">*</span>
							<span>휴대전화</span>
						</td>
						<td class="s_td">
							<div class="td_tel"><input type="text" name="tel" id="telNum" placeholder="-를 제외한 번호만 입력해주세요." required onchange="checkDash()"></div>
							<script>
								function checkDash() {
									var telNum = document.getElementById('telNum')
									var telNumVal = telNum.value
									if(telNumVal.indexOf('-') != -1) {
										alert('휴대전화 항목에 번호만 입력해주세요.')
										telNum.value = ''
									}
								}
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="join_agree_all">
			<span>전체동의</span>
		</div>
		<div class="join_agree_all_checkbox">
			<label>
				<span><input type="checkbox" id="box_all" class="agree_box" onchange="boxAllImgHandler(event)"><img class="box_img" src="${root }/img/view/join/check_clear.png"></span>
				<span>이용약관/개인정보이용 모두 동의합니다.</span>
			</label>
			<script>
				function boxAllImgHandler(event) {
					var boxAll = document.getElementById('box_all')
					var agreeBox = document.querySelectorAll('.agree_box')
					var boxImg = document.querySelectorAll('.box_img')
					if(boxAll.checked === true) {
						for(let i = 0; i < boxImg.length; i++) {
							boxImg[i].src = '${root}/img/view/join/check_full.png'
							agreeBox[i].checked = true
						}
					}else {
						for(let i = 0; i < boxImg.length; i++) {
							boxImg[i].src = '${root}/img/view/join/check_clear.png'
							agreeBox[i].checked = false
						}
					}
				}
			</script>
		</div>
		
		<div class="join_necessary_agree">
			<span>[필수] 이용약관 동의</span>
		</div>
		<div class="join_necessary_text">
			<textarea>제7조(회원 탈퇴 및 자격 상실등)
① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며, “몰”은 즉시 회원탈퇴를 처리합니다.
① 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
 1. 가입 신청시에 허위 내용을 등록한 경우
 2.“몰”을 이용하여 구입한 재화 등의 대금, 기타”몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
 3. 다른사람의 “몰”이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는경우</textarea>
		</div>
		<div class="join_agree_all_checkbox">
			<label>
				<span>이용약관에 동의 하십니까?</span>
				<span><input type="checkbox" id="box_one" class="agree_box" onchange="boxImgHandler(event)"><img class="box_img" src="${root }/img/view/join/check_clear.png"></span>
			</label>
		</div>

		<div class="join_necessary_agree">
			<span>[필수] 개인정보 수집 및 이용 동의</span>
		</div>
		<div class="join_necessary_text">
			<textarea>제7조(회원 탈퇴 및 자격 상실등)
① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며, “몰”은 즉시 회원탈퇴를 처리합니다.
① 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
 1. 가입 신청시에 허위 내용을 등록한 경우
 2.“몰”을 이용하여 구입한 재화 등의 대금, 기타”몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
 3. 다른사람의 “몰”이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는경우</textarea>
		</div>
		<div class="join_agree_all_checkbox">
			<label>
				<span>이용약관에 동의 하십니까?</span>
				<span><input type="checkbox" id="box_two" class="agree_box" onchange="boxImgHandler(event)"><img class="box_img" src="${root }/img/view/join/check_clear.png"></span>
			</label>
		</div>

		<div class="join_necessary_agree">
			<span>[선택] 더네이처 정보 수신 동의</span>
		</div>
		<div class="join_necessary_text">
			<textarea>제7조(회원 탈퇴 및 자격 상실등)
① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며, “몰”은 즉시 회원탈퇴를 처리합니다.
① 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
 1. 가입 신청시에 허위 내용을 등록한 경우
 2.“몰”을 이용하여 구입한 재화 등의 대금, 기타”몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
 3. 다른사람의 “몰”이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는경우</textarea>
		</div>
		<div class="join_agree_all_checkbox" style="margin-bottom: 15px;">
			<label>
				<span>SNS수신에 동의 하십니까?</span>
				<span><input type="checkbox" name="agree_sns" id="box_three" class="agree_box" onchange="boxImgHandler(event)"><img class="box_img" src="${root }/img/view/join/check_clear.png"></span>
			</label>
		</div>
		<div class="join_agree_all_checkbox">
			<label>
				<span>이메일 수신을 동의 하십니까?</span>
				<span><input type="checkbox" name="agree_email" id="box_four" class="agree_box" onchange="boxImgHandler(event)"><img class="box_img" src="${root }/img/view/join/check_clear.png"></span>
			</label>
		</div>
		<script>
			function boxImgHandler(event) {
				if(event.target.checked === true) {
					event.target.parentNode.parentNode.parentNode.getElementsByTagName('img')[0].src = '${root}/img/view/join/check_full.png'
				}else {
					event.target.parentNode.parentNode.parentNode.getElementsByTagName('img')[0].src = '${root}/img/view/join/check_clear.png'
				}
			}
		</script>
		
		<div class="form_btn_div">
			<input style="margin-right: 20px;" type="submit" value="완료" onclick="checkConfirm(event)">
			<input type="button" value="취소">
			<script>
				function checkConfirm(event) {
					event.preventDefault()
					var form = document.querySelector('form')
					var idVal = $("#checkIdResult").val()
					var pwVal1 = $("#checkPwResult").val()
					var pwVal2 = $("#confirmPwResult").val()
					var box1 = document.getElementById('box_one')
					var box2 = document.getElementById('box_two')
					var box3 = document.getElementById('box_three')
					var box4 = document.getElementById('box_four')
					if(idVal == '1' && pwVal1 == '1' && pwVal2 == '1' && box1.checked === true && box2.checked === true 
							&& $("#chk_name").val() != '' && $("#chk_email_first").val() != ''
							&& $("#e_domain").val() != '' && $("#telNum").val() != '' && $("#email_certification").val() == '인증완료'){
						if(box3.checked === true && box4.checked === true){
							box3.value = 'y'
							box4.value = 'y'
						}else if(box3.checked === true && box4.checked === false) {
							box3.value = 'y'
						}else if(box3.checked === false && box4.checked === true) {
							box4.value = 'y'
						}
						form.submit()
					}else {
						if(idVal != '1') {
							alert('아이디 중복확인은 필수입니다.')
							return
						}else if(pwVal1 != '1' || pwVal2 != '1') {
							alert('패스워드를 확인해주세요.')
							return
						}else if(box1.checked === false || box2.checked === false) {
							alert('이용약관을 확인해주세요.')
							return
						}else if($("#chk_name").val() == '') {
							alert('이름을 확인해주세요.')
							return
						}else if($("#chk_email_first").val() == '' || $("#e_domain").val() == '') {
							alert('이메일을 확인해주세요.')
							return
						}else if($("#telNum").val() == '') {
							alert('휴대전화를 확인해주세요.')
							return
						}else if($("#email_certification").val() != '인증완료') {
							alert('이메일 인증을 해주세요.')
							return
						}
					}
				}
			</script>
		</div>
		</form>
		
	</div>
</div>


<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>