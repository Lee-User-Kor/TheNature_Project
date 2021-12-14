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
.tcd_wrap {
	width: 1000px;
	margin: 100px auto;
}
.tcd_name {
	color: #272727;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
}
.tcd_e_name {
	color: #707070;
	font-size: 17px;
	text-align: center;
	margin: 20px 0;
}
.tcd_top {
	margin: 40px 0;
	display: flex;
	justify-content: space-between;
}
.tcdt_left {
	width: 390px;
	height: 250px;
}
.tcdt_left img {
	width: 390px;
	height: 250px;
}
.tcdt_right {
	width: 560px;
	border-top: 1px solid #707070;
	border-bottom: 1px solid #707070;
	padding: 10px 15px;
}
.tcdt_right table {
	border-collapse: collapse;
	height: 228px;
}
.f_td {
	color: #272727;
	font-size: 17px;
	font-weight: bold;
	width: 105px;
}
.s_td {
	color: #272727;
	font-size: 15px;
}
.tcd_ctnt1 {
	font-size: 20px;
	font-weight: bold;
	color: #272727;
	margin: 80px 0 20px 0;
}
.tcd_ctnt2 {
	border-top: 1px solid #707070;
	border-bottom: 1px solid #707070;
	padding: 20px 0;
}
.tcd_ctnt2 textarea {
	resize: none;
	border: none;
	outline: none;
	width: 98%;
	height: 285px;
}
.tcd_about_img {
	font-size: 20px;
	font-weight: bold;
	color: #272727;
	margin: 80px 0 20px 0;
}
.tcd_about_audio {
	font-size: 20px;
	font-weight: bold;
	color: #272727;
	margin: 80px 0 20px 0;
}
.img_slider_wrap {
	width: 1000px;
	height: 600px;
	overflow: hidden;
}
.slider_wrap {
	width: 1000px;
	height: 600px;
	overflow: hidden;
	display: flex;
}
.slider_img {
	width: 1000px;
	height: 600px;
	transition: all 300ms linear;
	position: relative;
	left: 0;
}
.slider_img img {
	width: 1000px;
	height: 600px;
} 
.ctr_btn_div {
	width: 1000px;
	height: 600px;
	display: flex;
	justify-content: space-between;
	position: relative;
	top: -600px;
}
.pre_div, .nxt_div {
	width: 30px;
	background-color: rgba(0, 0, 0, 0.5);
	text-align: center;
	padding: 287.5px 0;
	z-index: 1;
	cursor: pointer;
}
.tcd_list_btn_div {
	margin: 50px 0;
}
.tcd_list_btn_div button {
	border: 1px solid #35600C;
	padding: 5px 15px;
	background-color: white;
	color: #35600C;
	font-size: 15px;
	font-weight: bold; 
}
.tcd_list_btn_div button:hover {
	background-color: #35600C;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp"/>

<div class="total_wrap">
	<div class="tcd_wrap">
	
		<div class="tcd_name">
			<span>${tcVO.tree_name }</span>
		</div>
		
		<div class="tcd_e_name">
			<span>(${tcVO.tree_name_english })</span>
		</div>
		
		<div class="tcd_top">
			<div class="tcdt_left">
				<img src="${root }/tree_commentary_file/${tcVO.thumnail }">
			</div>
			<div class="tcdt_right">
				<table>
					<tbody>
						<tr>
							<td class="f_td">학명</td>
							<td class="s_td "><i>${tcVO.tree_name_scientific }</i></td>
						</tr>
						<tr>
							<td class="f_td">계</td>
							<td class="s_td">${tcVO.tree_kind01 }</td>
						</tr>
						<tr>
							<td class="f_td">문</td>
							<td class="s_td">${tcVO.tree_kind02 }</td>
						</tr>
						<tr>
							<td class="f_td">강</td>
							<td class="s_td">${tcVO.tree_kind03 }</td>
						</tr>
						<tr>
							<td class="f_td">목</td>
							<td class="s_td">${tcVO.tree_kind04 }</td>
						</tr>
						<tr>
							<td class="f_td">분포지역</td>
							<td class="s_td">${tcVO.tree_locate }</td>
						</tr>
						<tr>
							<td class="f_td">크기</td>
							<td class="s_td">${tcVO.tree_size }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="tcd_ctnt1">
			<span>상세설명</span>
		</div>
		<div class="tcd_ctnt2">
			<textarea readonly="readonly">${tcVO.content }</textarea>
		</div>
		
		<c:if test="${not empty imageVO }">
			<div class="tcd_about_img">
				<span>관련이미지</span>
			</div>
			<div class="img_slider_wrap">
				<div class="slider_wrap">
				<c:forEach items="${imageVO }" var="imageVO">
					<div class="slider_img"><img src="${root }/tree_commentary_file/${imageVO.img_path}"></div>
				</c:forEach>
				</div>
				<div class="ctr_btn_div">
				
					<div class="pre_div" onclick="prevHandler()"><img src="${root }/img/view/tree/arrow_left.png"></div>
					<div class="nxt_div" onclick="nextHandler()"><img src="${root }/img/view/tree/arrow_right.png"></div>
				</div>
				<script>
					let minus = '-'
					let su = 0
					let px = 'px'
					function nextHandler() {
						var sliderImg = document.querySelectorAll('.slider_img')
	
						if(su >= 1000 * (sliderImg.length - 1)) {
							return
						}else {
							su = su + 1000
							let pxMove = minus + su + px 
							for(let i = 0; i < sliderImg.length; i++){
								sliderImg[i].style.left = pxMove
							}
						}
					}
	
					function prevHandler() {
						var sliderImg = document.querySelectorAll('.slider_img')
						
						if(su == 0) {
							return
						}else {
							su = su - 1000
							let pxMove = minus + su + px 
							for(let i = 0; i < sliderImg.length; i++){
								sliderImg[i].style.left = pxMove
							}
						}
					}
				</script>
		</div>
		</c:if>
		
		<c:if test="${not empty tcVO.tree_audio }">
			<div class="tcd_about_audio">
				<span>나무해설</span>
			</div>
			<audio controls src="${root }/tree_commentary_audio/${tcVO.tree_audio }"></audio>
		</c:if>
		
		<div class="tcd_list_btn_div"><button onclick="history.back();">목록보기</button></div>
		
	</div>
</div>



<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>