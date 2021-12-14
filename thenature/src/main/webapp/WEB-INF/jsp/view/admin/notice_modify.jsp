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
	.notice_write_main {
		width: 100%;
		margin: 3% 0;
	}
	.notice_write_main > .wrap {
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
	.cw_form {
		margin: 25px 0;
	}
	.cwf_table {
		border-collapse: collapse;
		border-top: 1px solid #707070;
		width: 80%;
		margin: auto;
	}
	.cwf_tr {
		border-bottom: 1px solid #707070;
	}
	.f_td {
		background-color: #EEEEEE;
		color: #272727;
		font-size: 17px;
		font-weight: bold;
		text-align: center;
	}
	.s_td {
		padding: 10px 15px;
	}
	.s_td_div {
		border: 1px solid #707070;
		padding: 5px 10px;
	}
	.s_td_div input[type=text] {
		border: none;
		outline: none;
		width: 90%;
		height: 25px;
	}
	.s_td_div textarea {
		border: none;
		outline: none;
		resize: none;
		width: 98%;
		height: 400px;
	}
	.std_dd {
		padding: 0;
	}
	.dd_div {
		display: table;
		height: 200px;
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
		height: 51px;
	}
	.dd_icon_div input[type=file] {
		display: none;
	}
	.dd_icon_div img {
		margin: 10px 0;
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
	.btn_div {
		width: 80%;
		margin: auto;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>

<div class="notice_write_main">
	<div class="wrap">
		<div class="form_title">공지사항 수정</div>
		<form method="POST" id="notice_write_form">
			<input type="hidden" name="member_idx" value="${member.idx }">
			<input type="hidden" name="writer" value="${member.name }">
			<input type="hidden" name="idx" value="${noticeVO.idx }">
			<div class="cw_form">
				<table class="cwf_table">
					<tbody class="cwf_tbody">
						<tr class="cwf_tr">
							<td class="f_td">제목</td>
							<td class="s_td">
								<div class="s_td_div">
									<input type="text" class="title" name="title" value="${noticeVO.title }" placeholder="제목을 입력해주세요.">
								</div>
							</td>
						</tr>
						<tr class="cwf_tr">
							<td class="f_td">내용</td>
							<td class="s_td">
								<div class="s_td_div">
									<textarea class="content" name="content" placeholder="내용을 입력해주세요.">${noticeVO.content }</textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="btn_div">
				<input class="save_btn" type="submit" value="저장" onclick="noticeModifySubmit(event)">
				<input class="list_btn" type="button" value="목록" onclick="location.href = 'notice_list'">
			</div>
		
		
		</form>
	</div>
</div>

</body>
<script>
	// 공지 서브밋
	function noticeModifySubmit(event) {
		event.preventDefault()
		var title = document.querySelector('.title').value
		var content = document.querySelector('.content').value
		
		if(title == '') {
			alert('제목을 입력해야합니다.')
			return
		} else if(content == '') {
			alert('내용을 입력해야합니다.')
			return
		} else {
			alert('공지사항를 수정합니다.')
			document.getElementById('notice_write_form').submit()
		}
	}
</script>
</html>