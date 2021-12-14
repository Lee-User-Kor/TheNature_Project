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
	.change_memberinfo_form {
    	width: 100%;
    	margin: 0 auto;
    	margin-top: 50px;
    	margin-bottom: 50px;
    }
    .change_memberinfo_text {
    	font-weight: bold;
    	font-size: 20px;
    	text-align: center;
    	margin-bottom: 10px;
    }
    .change_memberinfo_text_left {
    	font-weight: bold;
    	font-size: 15px;
    	text-align: left;
    }
    .change_memberinfo_text_right {
    	font-weight: bold;
    	font-size: 15px;
    	text-align: right;
    	margin-bottom: 10px;
    }
    .change_memberinfo_table {
    	width: 100%;
    	border-collapse: collapse;
    	border-top: 1px solid #707070;
    }
    .change_memberinfo_table > tbody > tr > td {
    	border-bottom: 1px solid #707070;
    }
    .left_td {
    	width: 23%;
    	background-color: #F4F4F4; 
    	padding: 50px;
    	padding-left: 5%;
    	font-weight: bold;
    	font-size: 13px;
    }
    .right_td {
    	padding: 20px;
    }
    .right_td input {
    	outline: none;
    	font-size: 15px;
    	padding-left: 10px;
    	margin-right: 20px;
    	width: 65%;
    	border: none;
    	border-bottom: 1px solid #707070;
    }
    .right_td_btn, .cp_select {
    	width: 100px;
    	height: 30px;
    	border: 1px solid #707070;
    	color: #707070;
    	font-size: 13px;
    	background-color: white;
    	vertical-align: middle;
    }
    .cp_select {
    	outline: none;
    	padding-left: 5px;
    }
    .right_td_btn:hover {
    	background-color: #707070;
    	color: white;
    	cursor: pointer; 
    }
    .rule {
    	margin-top: 10px;
    	font-weight: bold;
    	font-size: 11px;
    }
    .change_memberinfo_wrap > .wrap > .change_memberinfo_form > form > .drop_member_div > .drop_member_btn {
    	width: 8%;
    	font-size: 14px;
    	font-weight: bold;
    	color: #35600C;
    	border: 1px solid #35600C;
    	border-radius: 50px;
    	padding: 5px 15px;
    	margin-top: 15px;
    	cursor: pointer;
    	text-align: center;
    }
    .form_submit_div {
    	text-align: center;
    	margin-top: 15px;
    }
    .form_submit_div button {
    	border-radius: 50px;
    }
    .form_submit_div > button:first-child {
    	background-color: #35600C;
    }
    .ok_btn, .cancel_btn {
    	width: 100px;
    	height: 35px;
    	font-size: 15px;
    	font-weight: bold;
    }
    .ok_btn:hover, .cancel_btn:hover {
    	cursor: pointer;
    }
    .ok_btn {
    	border: 1px solid #35600C;
    	background-color: #35600C;
    	color: white;
    	margin-right: 5px;
    }
    .cancel_btn {
    	border: 1px solid #35600C;
    	background-color: white;
    	color: #35600C;
    	margin-left: 5px;
    }
    #do_certification {
    	width: 100px;
    	height: 30px;
    	margin-left: 20px;
    	font-size: 15px;
    	color: #707070;
    	border: 1px solid #707070;
    	background-color: white;
    }
    #do_certification:hover {
    	cursor: pointer;
    	background-color: #707070;
    	color: white;
    }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp"/>

<div class="change_memberinfo_wrap">
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
		</div>
		<div class="change_memberinfo_form">
		    <form method="POST" id="change_memberinfo_form">
		    	<!-- 기본정보 -->
		    	<div class="change_memberinfo_text_left">기본정보</div>
		    	<!-- 필수입력사항 -->
		    	<div class="change_memberinfo_text_right"><span style="color: #EA933C;">* </span><span>필수입력사항</span></div>
		    	<!-- 입력 테이블 -->
		    	<div class="change_memberinfo_table_div">
		    		<table class="change_memberinfo_table">
		    			<tbody>
		    				<tr>
		    					<td class="left_td"><span>아이디</span><span style="color: #EA933C;"> *</span></td>
		    					<td class="right_td">
		    						<div><input type="text" name="id" placeholder="ID" value="${member.id }" required readonly></div>
		    						<div class="rule">(영문소문자/숫자, 4~16글자)</div>
		    						<input type="hidden" name="idx" value="${member.idx }">
		    					</td>
		    				</tr>
		    				<tr>
		    					<td class="left_td"><span>이름</span><span style="color: #EA933C;"> *</span></td>
		    					<td class="right_td"><input type="text" name="name" value="${member.name }" required readonly></td>
		    				</tr>
		    				<tr>
		    					<td class="left_td"><span>주소</span></td>
		    					<td class="right_td">
		    						<div><input type="text" name="post" id="postcode" placeholder="우편번호" value="${member.post }" required><button class="right_td_btn" onclick="sample6_execDaumPostcode(event)">주소검색</button></div>
		    						<div><input type="text" name="address" id="address" placeholder="주소" value="${member.address }" required style="margin: 20px 0 20px 0; width: 100%;"></div>
		    						<div><input type="text" name="address_detail" id="detailAddress" placeholder="나머지주소" value="${member.address_detail }" style="width: 100%;"></div>
		    					</td>
		    				</tr>
		    				<tr>
		    					<td class="left_td"><span>이메일</span><span style="color: #EA933C;"> *</span></td>
		    					<td class="right_td">
		    						<input type="text" id="email_id" name="email_first" value="${member.email_first }" required style="width: 30%; margin: 0;" onchange="checkModi()">&nbsp@&nbsp
		    						<input type="text" id="email_domain" name="email_second" value="${member.email_second }" style="width: 20%;">
		    						<select class="cp_select" onchange="this.form.email_domain.value=this[this.selectedIndex].value;">
		    							<option value="">직접입력</option>
		    							<option value="naver.com">naver.com</option>
		    							<option value="hanmail.net">hanmail.net</option>
		    							<option value="gmail.com">gmail.com</option>
		    							<option value="nate.com">nate.com</option>
		    						</select>
		    						<input class="hidden" id="do_certification" type="button" value="인증하기" onclick="emailCheck('${root}')">
		    						<input type="hidden" id="email_certification" value="">
		    						<script>
		    							function checkModi() {
		    								var emailAddr = $("#email_id").val() + '@' + $("#email_domain").val()
		    								if('${member.email}' != emailAddr) {
		    									document.getElementById('do_certification').classList.remove('hidden')
		    								}else {
		    									document.getElementById('do_certification').classList.add('hidden')
		    								}
		    							}
		    						</script>
		    						<script>
										function emailCheck(root) {
											if($("#email_id").val() == '' || $("#email_domain").val() == '') {
												alert('이메일을 입력해주세요')
												return
											}else {
												var emailAddr = $("#email_id").val() + '@' + $("#email_domain").val()
												let url = root + "/sendEmail?emailAddr=" + emailAddr
												window.open(url, "", "width=600, height=400")
											}
										}
									</script>
		    					</td>
		    				</tr>
		    				<tr>
		    					<td class="left_td"><span>휴대전화</span><span style="color: #EA933C;"> *</span></td>
		    					<td class="right_td">
		    						<div>
		    							<input type="text" name="tel" value="${member.tel }" required style="width: 30%;">
		    						</div>
		    					</td>
		    				</tr>
		    			</tbody>
		    		</table>
		    	</div>
		    	<div class="drop_member_div">
		    		<div class="drop_member_btn" id="drop_member_btn" onclick="dropMember();">회원탈퇴</div>
		    	</div>	    	
		    	<script>
		    		function dropMember() {
		    			var confirm_val = confirm('탈퇴를 진행합니다.')
		    			if(confirm_val) {
		    				var dropForm = document.createElement('form')
		    				dropForm.method = 'POST'
		    				dropForm.action = 'drop_member'
		    				
		    				var input = document.createElement('input')
		    				input.type = 'text'
		    				input.name = 'member_idx'
		    				input.value = document.querySelector('input[name="idx"]').value
		    				
		    				dropForm.append(input)
			    			document.body.appendChild(dropForm)
			    			dropForm.submit()
			    			alert('탈퇴되었습니다.')
		    			} else {
		    				return
		    			}
		    		}
		    	</script>
		    	<div class="form_submit_div">
		    		<button class="ok_btn" onclick="okForm(event)">완료</button>
		    		<a href="javascript:history.back();"><button class="cancel_btn">취소</button></a>
		    	</div>
		    </form>
		    <script>
		    	function okForm(event) {
		    		event.preventDefault()
		    		var form = document.querySelector('form')
		    		if(document.getElementById('do_certification').classList.contains('hidden')) {
		    			form.submit()
		    		}else {
		    			if(document.getElementById('email_certification').value == '인증완료') {
		    				form.submit()
		    			}else {
		    				alert('이메일 인증이 필요합니다.')
		    				return
		    			}
		    		}
		    	}
		    </script>
	    </div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 주소 api
	function sample6_execDaumPostcode(event) {
	event.preventDefault()
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
</html>