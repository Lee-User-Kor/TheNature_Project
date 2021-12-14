<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	.notice_detail_main {
		width: 1000px;
		margin: 80px auto;
	}
	.notice_detail_wrap {
		width: 100%;
	}
	.notice_detail_top {
		width: 100%;
	}
	.notice_detail_title {
		width: 100%;
		border-top: 2px solid #707070;
	}
	.notice_detail_title > .title {
		padding: 15px 20px;
		font-weight: bold;	
	}
	.notice_detail_info {
		display: flex;
		width: 100%;
		border-top: 1px solid #707070;
		border-bottom: 1px solid #707070;
	}
	.notice_detail_info > .notice_detail_date, 
	.notice_detail_info > .notice_detail_writer {
		display: flex;
		width: 50%;
	}
	.notice_detail_date > .title,
	.notice_detail_writer > .title {
		width: 40%;
		padding: 15px 20px;
		background-color: #F7F5F5;
	}
	.notice_detail_date > .date,
	.notice_detail_writer > .writer {
		width: 60%;
		padding: 15px 20px;
	}
	.notice_detail_contents {
		width: 100%;
	}
	.notice_detail_contents > .notice_detail_contents_content {
		padding: 40px 20px;
		border-bottom: 1px solid #707070;
		font-size: 12px;
	}
	.notice_detail_contents > .notice_detail_contents_content > p {
		margin: 0;
		margin-bottom: 5px;
		padding: 0;
		font-size: 12px;
	}
	.notice_detail_menu {
		display: flex;
		width: 100%;
		justify-content: space-between;
		font-size: 15px;
		margin-top: 10px;
	}
	.notice_detail_menu > .prev:hover,
	.notice_detail_menu > .next:hover {
		text-decoration: underline;
		cursor: pointer;
	}
	.notice_detail_menu > .go_list {
		border: 1px solid #707070;
		cursor: pointer;
		width: 100px;
		text-align: center;
		padding: 5px 0;
	}
</style>
</head>
<script>
	function goNotice() {
		location.href = 'notice'
	}
</script>
<body>

	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<jsp:include page="/WEB-INF/jsp/header/header_second.jsp" />
	
	<div class="notice_detail_main">
		<div class="notice_detail_wrap">
			<div class="notice_detail_top">
				<div class="notice_detail_title">
					<div class="title">${noticeVO.title }</div>
				</div>
				<div class="notice_detail_info">
					<div class="notice_detail_date">
						<div class="title">작성일</div>
						<div class="date">${noticeVO.write_date }</div>
					</div>
					<div class="notice_detail_writer">
						<div class="title">작성자</div>
						<div class="writer">${noticeVO.writer }</div>
					</div>
				</div>
			</div>
			<div class="notice_detail_contents">
				<div class="notice_detail_contents_content">
					${noticeVO.content }
<!-- 					<p>홈페이지를 이용해 주시는 고객 여러분께 진심으로 감사드립니다.</p> -->
<!-- 					<p>당사 개인정보 처리방침이 일부 개정됨에 따라 아래와 같이 안내드리오니 서비스 이용에 참고하시기 바랍니다.</p> -->
<!-- 					<p>소중한 개인정보를 보다 안전하게 관리하기 위하여 더욱 노력하겠습니다.</p> -->
<!-- 					<p>감사합니다.</p><br> -->
<!-- 					<p>시행예정일 : 9월 10일</p><br> -->
<!-- 					<p>변경내용 : 개인정보</p> -->
				</div>
			</div>
			<div class="notice_detail_menu">
				<div class="prev" onclick="goPrev()">&lt; 이전글</div>
				<div class="go_list" onclick="goNotice()">목록보기</div>
				<div class="next" onclick="goNext()">다음글 &gt;</div>
				<script>
					function goPrev() {
						var no = parseInt('${noticeVO.idx}')
							if(no == 1){
							alert('첫번째 게시글 입니다.')
							return;
						}else {
							location.href = '${root}/notice_detail?no=' + (no - 1)
						}
					}
					function goNext() {
						var no = parseInt('${noticeVO.idx}')
						if(no == parseInt('${lastIdx }')){
							alert('마지막 게시글 입니다.')
							return;
						}else {
							location.href = '${root}/notice_detail?no=' + (no + 1)
						}
					}
				</script>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>
	
</body>
</html>