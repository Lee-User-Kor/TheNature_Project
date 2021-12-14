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
.m_wrap {
	width: 1400px;
	margin: 74px auto;
	display: flex;
	justify-content: space-between;
}
.mw_left {
	display: flex;
	flex-flow: wrap;
	justify-content: space-between;
	width: 850px;
}
.mw_left_inner {
	width: 415px;
	height: 400px;
	background-color: white; 
}
.mwli_top {
	margin-bottom: 20px;
}
.mwl_title {
	padding: 10px 20px;
	color: #343434;
	font-size: 17px;
	font-weight: bold;
	border-bottom: 2px solid #C7C7C7;
	display: flex;
	justify-content: space-between;
}
.mwl_content {
	height: 335px;
	padding: 10px 20px;
}
.mw_right {
	width: 530px;
	background-color: #343434;
	color: white;
}
.mwr_icon {
	text-align: center;
	padding-top: 65px;
}
.mwr_id {
	text-align: center;
	padding-top: 15px;
}
.mwr_info {
	border-bottom: 1px solid white;
	padding-bottom: 20px;
	padding-top: 30px;
}
.mwr_table {
	width: 400px;
	margin: 0 auto;
	border-collapse: collapse;
}
.f_td {
	padding: 15px 0;
	font-weight: bold;
}
.s_td {
	font-size: 14px;
}
.s_td button, .mwr_logout button {
	background-color: inherit;
	border: 1px solid white;
	color: white;
	border-radius: 15px;
	padding: 5px 10px;
}
.mwr_logout {
	width: 400px;
	margin: 20px auto;
}
.mwr_logout button:hover {
	background-color: white;
	color: #343434;
	cursor: pointer;
}
.mwlc_table {
	width: 100%;
	border-collapse: collapse;
}
.th_td {
	font-size: 13px;
	font-weight: bold;
}
.td_td {
	font-size: 12px;
	padding: 8px 0;
}
.more_span {
	font-size: 12px;
	display: table-cell;
	vertical-align: bottom;
}
</style>
</head>
<body>
<c:if test="${empty member }">
	<script>
		alert('접근 불가')
		location.href = '${root}/'
	</script>
</c:if>
<c:if test="${not empty member }">
	<c:if test="${member.grade < 3 }">
		<script>
			alert('접근 불가')
			location.href = '${root}/'
		</script>
	</c:if>
</c:if>
<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>

<div class="total_wrap">
	<div class="m_wrap">

		<div class="mw_left">
			<div class="mw_left_01 mw_left_inner mwli_top">
				<div class="mwl_title">
					<div><span>최근 업로드된 웹툰</span></div>
					<div style="display: table;"><span class="more_span"><a href="${root }/admin/webtoon_list">+더보기</a></span></div>
				</div>
				<div class="mwl_content">
					<table class="mwlc_table">
						<tbody class="mwlc_tbody">
							<tr class="mwlc_tr">
								<td class="th_td">NO</td>
								<td class="th_td">제목</td>
								<td class="th_td">부제</td>
								<td class="th_td">공급자</td>
							</tr>
							<c:forEach items="${wdVOList }" var="wdVO_list">
							<tr class="mwlc_tr">
								<td class="td1 td_td">${wdVO_list.idx }</td>
								<td class="td2 td_td"><a>${wdVO_list.bw_title }</a></td>
								<td class="td3 td_td"><a>${wdVO_list.title }</a></td>
								<td class="td4 td_td">${wdVO_list.writer }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="mw_left_01 mw_left_inner mwli_top">
				<div class="mwl_title">
					<div><span>최근 업로드된 커뮤니티</span></div>
					<div style="display: table;"><span class="more_span"><a href="${root }/admin/community_list">+더보기</a></span></div>
				</div>
				<div class="mwl_content">
					<table class="mwlc_table">
						<tbody class="mwlc_tbody">
							<tr class="mwlc_tr">
								<td class="th_td">NO</td>
								<td class="th_td">제목</td>
								<td class="th_td">작성자</td>
								<td class="th_td">등록일</td>
							</tr>
							<c:forEach items="${cVOList }" var="cVO_list">
							<tr class="mwlc_tr">
								<td class="td1 td_td">${cVO_list.idx }</td>
								<td class="td2 td_td"><a>${cVO_list.title }</a></td>
								<td class="td3 td_td">${cVO_list.writer }</td>
								<td class="td4 td_td">${cVO_list.write_date }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="mw_left_01 mw_left_inner">
				<div class="mwl_title">
					<div><span>최근 접수된 문의사항</span></div>
					<div style="display: table;"><span class="more_span"><a href="${root }/admin/qna_list">+더보기</a></span></div>
				</div>
				<div class="mwl_content">
					<table class="mwlc_table">
						<tbody class="mwlc_tbody">
							<tr class="mwlc_tr">
								<td class="th_td">NO</td>
								<td class="th_td">제목</td>
								<td class="th_td">작성자</td>
								<td class="th_td">처리현항</td>
							</tr>
							<c:forEach items="${qVOList }" var="qVO_list">
							<tr class="mwlc_tr">
								<td class="td1 td_td">${qVO_list.idx }</td>
								<td class="td2 td_td"><a>${qVO_list.title }</a></td>
								<td class="td3 td_td">${qVO_list.writer }</td>
								<td class="td4 td_td">${qVO_list.apply == 'y' ? '처리완료' : '처리중' }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<script>
						var apply = document.querySelectorAll('.td4')
						for(let i = 0; i < apply.length; i++) {
							if(apply[i].innerText == '처리완료') {
								apply[i].style.color = 'green'
							}else if(apply[i].innerText == '처리중'){
								apply[i].style.color = 'red'
							}
						}
					</script>
				</div>
			</div>
			<div class="mw_left_01 mw_left_inner">
				<div class="mwl_title">
					<div><span>최근 댓글 목록</span></div>
					<div style="display: table;"><span class="more_span"><a href="${root }/admin/comment_list">+더보기</a></span></div>
				</div>
				<div class="mwl_content">
					<table class="mwlc_table">
						<tbody class="mwlc_tbody">
							<tr class="mwlc_tr">
								<td class="th_td">NO</td>
								<td class="th_td">내용</td>
								<td class="th_td">작성자</td>
								<td class="th_td">작성일자</td>
							</tr>
							<c:forEach items="${cmtVOList }" var="cmtVO_list">
							<tr class="mwlc_tr">
								<td class="td1 td_td">${cmtVO_list.idx }</td>
								<td class="td2 td_td">${cmtVO_list.content }</td>
								<td class="td3 td_td">${cmtVO_list.writer }</td>
								<td class="td4 td_td">${cmtVO_list.write_date }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script>
			// 문자열 길이 자르기
			var td_td = document.querySelectorAll('.td_td')
			for(let i = 0; i < td_td.length; i++) {
				console.log('td_td[i].innerText.length : ' + td_td[i].innerText.length)
				if(td_td[i].innerText.length > 11) {
					var text = td_td[i].innerText
					var subText = text.substring(0, 12)
					td_td[i].innerText = subText + '...'
				}
			}
		</script>
		
		
		<div class="mw_right">
			<div class="mwr_icon">
				<img src="${root }/img/view/admin/sample_member_icon.png">
			</div>
			<div class="mwr_id">
				<span>${member.id }님</span>
			</div>
			<div class="mwr_info">
				<table class="mwr_table">
					<tbody class="mwr_tbody">
						<tr class="mwr_tr">
							<td class="f_td">관리자 아이디</td>
							<td class="s_td">${member.id }</td>
						</tr>
						<tr class="mwr_tr">
							<td class="f_td">관리자 이름</td>
							<td class="s_td">${member.name }</td>
						</tr>
						<tr class="mwr_tr">
							<td class="f_td">관리자 접속시간</td>
							<td class="s_td">${member.login_time }</td>
						</tr>
						<tr class="mwr_tr">
							<td class="f_td">관리자 권한</td>
							<td class="s_td"><button>admin</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="mwr_logout">
				<button onclick="location.href = '${root}/admin/logout'">로그아웃</button>
			</div>
		</div>

	</div>
</div>

</body>
</html>