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
	margin-left: 185px;
}
.cw_wrap {
	width: 1400px;
	height: 820px;
	margin: 74px auto;
	background-color: white;
}
.cww_wrap {
	width: 1200px;
	height: 720px;
	padding: 50px 0;
	margin: 0 auto;
}
.cw_title {
	color: #272727;
	font-size: 17px;
	font-weight: bold;
}
.cw_form {
	margin: 25px 0;
}
.cwf_table {
	border-top: 1px solid #707070;
	border-collapse: collapse;
	width: 100%;
}
.cwf_tr {
	border-bottom: 1px solid #707070;
}
.th_td {
	background-color: #EDEDED;
	text-align: center;
	font-weight: bold;
	font-size: 13px;
}
.td_td {
	padding: 5px 10px;
}
.td_div {
	border: 1px solid #707070;
	padding: 5px 10px;
	font-size: 13px;
}
.td_div input {
	border: none;
	outline: none;
	width: 90%;
}
input[type="file"] {
	width: 40%;
}
#clear_file {
	background-color: white;
	cursor: pointer;
	margin-left: 5px;
	border-radius: 30px;
	border: 1px solid #707070;
}
.td_textarea {
	border: none;
	outline: none;
	resize: none;
	width: 98%;
	height: 150px;
}
.dd_div {
	display: table;
	height: 150px;
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
	height: 35px;
}
.dd_icon_div input[type=file] {
	display: none;
}
.dd_icon_div img {
	margin: 7px 0;
    width: 80px;
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
.info_thumbnail {
	margin-top: 5px;
	font-size: 13px;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>

<div class="total_wrap">
	<div class="cw_wrap">
		<div class="cww_wrap">
		
			<div class="cw_title">
				<span>?????? ?????? ??????</span>
			</div>
			
			<form method="POST" id="video_modify_form" enctype="multipart/form-data">
				<input type="hidden" name="member_idx" value="${member.idx }">
				<input type="hidden" name="writer" value="${member.name }">
				<input type="hidden" name="idx" value="${tvVO.idx }">
				<div class="cw_form">
					<table class="cwf_table">
						<tbody class="cwf_tbody">
							<tr class="cwf_tr">
								<td class="th_td">??????<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="title" name="title" value="${tvVO.title }" placeholder="????????? ??????????????????."></div></td>
							</tr>
							<tr class="cwf_tr">
								<td class="th_td">??????<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="content" name="content" value="${tvVO.content }" placeholder="????????? ???????????? ??????????????????."></div></td>
							</tr>
							<tr class="cwf_tr">
								<td class="th_td">?????????<span style="color: red;">*</span></td>
								<td class="td_td">
									<div class="td_div">
										<input type="file" class="tv_video" name="tv_video" accept=".mp4">
										?????? ???????????? ?????? : <span class="span_file">${tvVO.video_path }</span>
									</div>
								</td>
							</tr>
							<tr class="cwf_tr">
								<td class="th_td">?????????</td>
								<td class="td_td">
									<div class="td_div">
										<input type="file" class="tv_thumbnail" name="tv_thumbnail" accept="image/*">
										<div class="info_thumbnail">??? ???????????? ???????????? ???????????? ????????? ?????? ??? ?????? ???????????? ???????????????.</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="btn_div">
					<input class="save_btn" type="submit" value="??????" onclick="videoSubmitCheck(event)">
					<input class="list_btn" type="button" value="??????" onclick="location.href = '${root}/admin/video_list'">
				</div>
			</form>
		</div>
	</div>
</div>

</body>
<script>
	// ?????? ?????? ????????? ??????
	function videoSubmitCheck(event) {
		event.preventDefault()
		var title = document.querySelector('.title').value
		var video = document.querySelector('.span_file').innerText
		
		if(title == '') {
			alert('????????? ????????????????????????.')
			return
		} else if(video == '') {
			alert('???????????? ?????????????????????.')
			return
		} else {
			alert('????????? ???????????????.')
			document.getElementById('video_modify_form').submit()
		}
	}
</script>
</html>