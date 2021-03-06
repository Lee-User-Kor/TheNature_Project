<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
<style>
.total_wrap {
	width: 100%;
}
.login_wrap {
	width: 1001px;
	margin: 106px auto;
	display: flex;
}
.lw_left_wrap {
	width: 500px;
}
.middle_line, .cross_line {
	width: 1px;
	border-right: 1px solid #707070;	
}
.lw_left {
	width: 400px;
	margin: 0 auto;
}
.lwl_title {
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	color: #272727;
}
.lwl_input {
	display: flex;
	margin-top: 50px;
	margin-bottom: 5px;
}
.input_info {
	width: 260px;
	border: none;
	outline: none;
}
.lwli_left {
	width: 292px;
}
.lwlil_top, .lwlil_bot {
	border: 1px solid #707070;
	padding: 5px;
	width: 280px;
}
.lwlil_top {
	margin-bottom: 15px;
}
.lwli_right {
	width: 108px;
	text-align: center;
}
.lwli_right input[type=submit] {
	border: 1px solid #35600C;
	background-color: white;
	color: #35600C;
	border-radius: 15px;
	width: 95px;
	height: 75px;
	font-weight: bold;
	font-size: 12px;
}
.lwli_right input[type=submit]:hover {
	color: white;
	background-color: #35600C;
	cursor: pointer;
}
.function_div {
	color: #5F5E5E;
	font-size: 11px;
	display: table;
	margin-bottom: 20px;
}
.function_div span {
	display: table-cell;
	vertical-align: middle;
}
input[type=checkbox] {
	border: 1px solid #707070;
	cursor: pointer;
}
form {
	display: flex;
}
.lwl_bot {
	border-top: 1px solid #707070;
	display: flex;
}
.join_div, .find_div {
	width: 199px;
	padding: 25px 0;
}
.jd_img_div, .jd_btn_div, .fd_img_div, .fd_btn_div {
	text-align: center;
}
.jd_btn_div button, .fd_btn_div button {
	font-size: 10px;
	color: #333333;
	border: 1px solid #D0D0D0;
	background-color: white;
	cursor: pointer;
	padding: 5px 10px;
	border-radius: 5px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<c:if test="${not empty findId }">
	<script>
		var id = '${findId}'
		console.log(id)
		alert('???????????? ???????????? ' + id + '?????????.')
	</script>
</c:if>

<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_third.jsp"/>
<div class="total_wrap">
	<div class="login_wrap">
		<div class="lw_left_wrap">
			<!-- normal user -->
			<div class="lw_left">
				<div class="lwl_title">
					<span>????????? ?????? ?????????</span>
				</div>
				<div class="lwl_input">
					<form action="${root }/login_normal" method="POST">
						<div class="lwli_left">
							<div class="lwlil_top"><input class="input_info" id="userId" name="id" type="text" placeholder="?????????"></div>
							<div class="lwlil_bot"><input class="input_info" name="pw" type="password" placeholder="????????????"></div>
						</div>
						<div class="lwli_right">
							<input type="submit" value="????????? ?????????">
						</div>
					</form>
				</div>
				<div class="function_div">
					<label><input id="idSaveCheck" type="checkbox"><span>????????? ??????</span></label>
					<script>
					$(document).ready(function(){
						 
					    // ????????? ???????????? ???????????? ID ?????? ????????????. ????????? ???????????? ?????????.
					    var key = getCookie("key");
					    $("#userId").val(key); 
					     
					    if($("#userId").val() != ""){ // ??? ?????? ID??? ???????????? ?????? ????????? ?????? ???, ?????? ?????? ????????? ID??? ????????? ????????????,
					        $("#idSaveCheck").attr("checked", true); // ID ??????????????? ?????? ????????? ??????.
					    }
					     
					    $("#idSaveCheck").change(function(){ // ??????????????? ????????? ?????????,
					        if($("#idSaveCheck").is(":checked")){ // ID ???????????? ???????????? ???,
					            setCookie("key", $("#userId").val(), 7); // 7??? ?????? ?????? ??????
					        }else{ // ID ???????????? ?????? ?????? ???,
					            deleteCookie("key");
					        }
					    });
					     
					    // ID ??????????????? ????????? ???????????? ID??? ???????????? ??????, ?????? ?????? ?????? ??????.
					    $("#userId").keyup(function(){ // ID ?????? ?????? ID??? ????????? ???,
					        if($("#idSaveCheck").is(":checked")){ // ID ??????????????? ????????? ????????????,
					            setCookie("key", $("#userId").val(), 7); // 7??? ?????? ?????? ??????
					        }
					    });
					});
					 
					function setCookie(cookieName, value, exdays){
					    var exdate = new Date();
					    exdate.setDate(exdate.getDate() + exdays);
					    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
					    document.cookie = cookieName + "=" + cookieValue;
					}
					 
					function deleteCookie(cookieName){
					    var expireDate = new Date();
					    expireDate.setDate(expireDate.getDate() - 1);
					    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
					}
					 
					function getCookie(cookieName) {
					    cookieName = cookieName + '=';
					    var cookieData = document.cookie;
					    var start = cookieData.indexOf(cookieName);
					    var cookieValue = '';
					    if(start != -1){
					        start += cookieName.length;
					        var end = cookieData.indexOf(';', start);
					        if(end == -1)end = cookieData.length;
					        cookieValue = cookieData.substring(start, end);
					    }
					    return unescape(cookieValue);
					}
					</script>
				</div>
				<div class="lwl_bot">
					<div class="join_div">
						<div class="jd_img_div"><img src="${root }/img/view/login/join.png"></div>
						<div class="jd_btn_div"><button onclick="location.href = '${root}/join'">????????? ????????????</button></div>
					</div>
					<div class="cross_line"></div>
					<div class="find_div">
						<div class="fd_img_div"><img src="${root }/img/view/login/find.png"></div>
						<div class="fd_btn_div"><button onclick="location.href = '${root}/find_id'">????????? ?????????/???????????? ??????</button></div>
					</div>
				</div>
			</div>
		</div>
		<!-- line -->
		<div class="middle_line"></div>
		<!-- producer -->
		<div class="lw_left_wrap">
			<!-- normal user -->
			<div class="lw_left">
				<div class="lwl_title">
					<span>????????? ?????? ?????????</span>
				</div>
				<div class="lwl_input">
					<form action="${root }/login_producer" method="POST">
						<div class="lwli_left">
							<div class="lwlil_top"><input class="input_info" id="producerId" name="id" type="text" placeholder="?????????"></div>
							<div class="lwlil_bot"><input class="input_info" name="pw" type="password" placeholder="????????????"></div>
						</div>
						<div class="lwli_right">
							<input type="submit" value="????????? ?????????">
						</div>
					</form>
				</div>
				<div class="function_div">
					<label><input id="idSaveCheckForP" type="checkbox"><span>????????? ??????</span></label>
					<script>
					$(document).ready(function(){
						 
					    // ????????? ???????????? ???????????? ID ?????? ????????????. ????????? ???????????? ?????????.
					    var key = getCookie("keyP");
					    $("#producerId").val(key); 
					     
					    if($("#producerId").val() != ""){ // ??? ?????? ID??? ???????????? ?????? ????????? ?????? ???, ?????? ?????? ????????? ID??? ????????? ????????????,
					        $("#idSaveCheckForP").attr("checked", true); // ID ??????????????? ?????? ????????? ??????.
					    }
					     
					    $("#idSaveCheckForP").change(function(){ // ??????????????? ????????? ?????????,
					        if($("#idSaveCheckForP").is(":checked")){ // ID ???????????? ???????????? ???,
					            setCookie("keyP", $("#producerId").val(), 7); // 7??? ?????? ?????? ??????
					        }else{ // ID ???????????? ?????? ?????? ???,
					            deleteCookie("keyP");
					        }
					    });
					     
					    // ID ??????????????? ????????? ???????????? ID??? ???????????? ??????, ?????? ?????? ?????? ??????.
					    $("#producerId").keyup(function(){ // ID ?????? ?????? ID??? ????????? ???,
					        if($("#idSaveCheckForP").is(":checked")){ // ID ??????????????? ????????? ????????????,
					            setCookie("keyP", $("#producerId").val(), 7); // 7??? ?????? ?????? ??????
					        }
					    });
					});
					 
					function setCookie(cookieName, value, exdays){
					    var exdate = new Date();
					    exdate.setDate(exdate.getDate() + exdays);
					    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
					    document.cookie = cookieName + "=" + cookieValue;
					}
					 
					function deleteCookie(cookieName){
					    var expireDate = new Date();
					    expireDate.setDate(expireDate.getDate() - 1);
					    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
					}
					 
					function getCookie(cookieName) {
					    cookieName = cookieName + '=';
					    var cookieData = document.cookie;
					    var start = cookieData.indexOf(cookieName);
					    var cookieValue = '';
					    if(start != -1){
					        start += cookieName.length;
					        var end = cookieData.indexOf(';', start);
					        if(end == -1)end = cookieData.length;
					        cookieValue = cookieData.substring(start, end);
					    }
					    return unescape(cookieValue);
					}
					</script>
				</div>
				<div class="lwl_bot">
					<div class="join_div">
						<div class="jd_img_div"><img src="${root }/img/view/login/join.png"></div>
						<div class="jd_btn_div"><button onclick="location.href = '${root}/join_producer'">????????? ????????????</button></div>
					</div>
					<div class="cross_line"></div>
					<div class="find_div">
						<div class="fd_img_div"><img src="${root }/img/view/login/find.png"></div>
						<div class="fd_btn_div"><button onclick="location.href = '${root}/find_id'">????????? ?????????/???????????? ??????</button></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>