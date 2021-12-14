<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The_Nature</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
.home_total_wrap {
	width: 100%;
}
.home_top {
	width: 1500px;
	margin: auto;
	display: flex;
	height: 730px;
}
.ht_left {
	width: 600px;
}
.ht_left_inner {
	height: 350px;
	margin: 150px 0;
}
.ht_right {
	position: absolute;
	top: 0;
    left: 849px;
    z-index: -1;
}
.ht_right img {
	height: 850px;
}
.today_tree_div {
	font-size: 60px;
	font-weight: bold;
	color: #5C8E46;
}
.tree_name_div {
	font-size: 60px;
	font-weight: bold;
	color: #273415;
	margin: 20px 0;
}
.tree_ctnt_div {
	font-size: 15px;
	color: #7F817D;
	line-height: 20px;
	width: 320px;
}
.btn_div {
	margin: 20px 0;
}
.home_top_btn {
	border: 1px solid #3F5D27;
	background-color: white;
	color: #3F5D27;
	border-radius: 15px;
	padding: 5px 15px;
	margin-right: 20px;
}
.home_top_btn:hover {
	background-color: #5C8E46;
	border: 1px solid #5C8E46;
	color: white;
	cursor: pointer;
}
.home_butterfly {
	position: absolute;
	left: 0;
	top: 730px;
	width: 0;
	height: 0;
}
.home_wrap {
	width: 1000px;
	margin: 100px auto;
}
.hc_title {
	font-size: 20px;
	font-weight: bold;
	color: #272727;
}
.hc_more {
	font-size: 14px;
	color: #272727;
	text-align: right;
}
.hc_ctnt {
	display: flex;
	justify-content: space-between;
	margin: 10px 0;
}
.hce_img_div {
	width: 300px;
	height: 370px;
	border-radius: 15px;
	cursor: pointer;
	overflow: hidden;
}
.hce_img_div img {
	width: 300px;
	height: 370px;
}
.hce_btn_div {
	background-color: rgba(0, 0, 0, 0.4);
	display: flex;
	flex-flow: column;
	align-items: center;
	width: 300px;
	height: 210px;
	padding: 80px 0;
	position: absolute;
	top: 1000px;
	border-radius: 15px;
}
.hce_btn_div button {
	width: 117px;
	height: 33px;
	padding: 5px 15px;
	border: 1px solid white;
	background-color: rgba(0, 0, 0, 0);
	border-radius: 15px;
	color: white;
	font-size: 16px;
	font-weight: bold;
	margin: 34px 0;
}
.hce_btn_div button:hover {
	background-color: #5C8E46;
	border: 1px solid #5C8E46;	
	cursor: pointer;
}
.hce_like_icon_div img:hover {
	cursor: pointer;
}
.hce_title {
	color: #272727;
	font-size: 15px;
	margin: 5px;
}
.hce_function_div {
	margin: 5px;
	font-size: 10px;
	color: #9A9A9A;
	font-weight: bold;
}
.hce_function_div span {
	vertical-align: top;
}
.hidden {
	display: none; 
}
.home_video {
	margin: 100px 0;
}
.hv_title {
	font-size: 20px;
	font-weight: bold; 
}
.hv_category {
	font-size: 14px;
	color: #707070;
	text-align: right;
}
.hv_ctnt {
	display: flex;
	margin: 10px 0;
	overflow: hidden;
}
.hv_ctnt_left {
	width: 500px;
	margin-right: 40px;
	display: flex;
}
.hv_ctnt_right {
	width: 460px;
	position: relative;
}
.hvcl_video_div {
	width: 500px;
	border-radius: 15px;
	margin-right: 40px;
	position: relative;
    left: 0;
}
.hvcl_video_div video {
 	width: 500px;
 	border-radius: 15px;
}
.for_v_div {
	width: 500px;
    margin-right: 200px;
}
.for_v_div video {
	width: 300px !important;
	margin-top: 88px;
}
.hvcrt_title {
	font-size: 30px;
	font-weight: bold;
	color: #272727;
}
.hvcrt_ctnt {
	margin: 10px 0;
	font-size: 15px;
	color: #707070;
}
.hvcr_mid {
	width: 300px;
	border-radius: 15px;
	overflow: hidden;
}
.hvcr_mid video {
	border-radius: 15px;
	width: 300px;
}
.hvcr_bot {
	font-size: 12px;
	font-weight: bold;
	margin-top: 185px;
}
.hvcl_ctrl_div {
	width: 0;
	height: 0;
}
.hvclcd_prev {
	position: relative;
	top: 115px;
    left: -540px;
	cursor: pointer;
}
.hvclcd_next {
	position: relative;
	top: 64px;
    right: 85px;
	cursor: pointer; 
}
.home_webtoon {
	margin: 100px auto;
}
.hw_title {
	font-size: 20px;
	font-weight: bold;
	color: #272727;
}
.hw_more {
	font-size: 14px;
	color: #272727;
	text-align: right;
}
.hw_ctnt {
	margin: 10px 0;
	display: flex;
	flex-flow: wrap;
	justify-content: space-between;
}
.hwe_title {
	font-size: 17px;
	color: #272727;
	margin: 5px 0;
}
.hwe_content {
	font-size: 12px;
	color: #272727;
	margin: 10px 0;
}
.hwe_function_div {
	margin: 10px 0;
	font-size: 9px;
	color: #9A9A9A;
	font-weight: bold;
}
.hwe_function_div span {
	vertical-align: top;
}
.hwe_line {
	border-bottom: 1px solid #707070;
	margin: 10px 0;
}
.hw_each {
	width: 320px;
	margin-bottom: 50px;
}
.hwe_img_div {
	width: 320px;
	border-radius: 15px;
	overflow: hidden;
}
.hwe_img_div img {
	width: 320px;
	border-radius: 15px;
	transition: all 200ms linear;
}
.hwe_img_div img:hover {
	cursor: pointer;
	transform: scale(1.1);
}
.hwe_btn_div button {
	border: none;
	background-color: #5C8E46;
	color: white;
	font-size: 12px;
	font-weight: bold;
	padding: 5px 15px;
	cursor: pointer;
}
.home_rank {
	margin: 100px auto;
	display: flex;
	justify-content: space-between;
}
.hr_each {
	width: 320px;
	border-radius: 10px;
	overflow: hidden;
}
.hr_top {
	background-color: #EBF1E8;
	padding: 0 25px;
}
.hr_title {
	font-size: 20px;
	font-weight: bold;
	color: #272727;
	text-align: center;
	width: 270px;
	padding: 30px 0;
}
.hr_first_div {
	width: 270px;
	background-color: white;
	border-radius: 15px;
	display: flex;
}
.hrf_left {
	width: 110px;
	text-align: center;
}
.hrf_right {
	width: 160px;
	text-align: left;
	padding: 48px 0;
}
.hrfr_nickname {
	font-size: 13px;
	font-weight: bold;
	color: #707070;
}
.hrfr_point {
	font-size: 20px;
	font-weight: bold;
	color: #272727;
}
.hr_rank_span {
	font-size: 17px;
	font-weight: bold;
	color: #707070;
	width: 30px;
}
.hr_rank_point {
	font-size: 17px;
	font-weight: bold;
	color: #272727;
	width: 85px;
}
.hr_rank_nickname {
	font-size: 13px;
	font-weight: bold;
	color: #707070;
	width: 100px;
	text-align: right;
}
.hr_span_div {
	width: 270px;
	display: flex;
	justify-content: space-between;
	margin: 0 auto;
	padding: 10px 0;
}
.hr_fourth_div {
	background-color: #EBF1E8;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>

<c:if test="${not empty AlertMsg }">
	<script>
		alert('${AlertMsg}')
	</script>
	<% session.removeAttribute("AlertMsg"); %>
</c:if>

<div class="home_total_wrap">
	<div class="home_top">
		<div class="ht_left">
			<div class="ht_left_inner">
				<div class="today_tree_div">오늘의 나무</div>
				<div class="tree_name_div">${todayTcVO.tree_name }</div>
				<div class="tree_ctnt_div">${todayTcVO.content }</div>
				<script>
					var tree_ctnt_div = document.querySelector('.tree_ctnt_div').innerText
					if(tree_ctnt_div.length > 60) {
						var text = tree_ctnt_div.substring(0,60)
						document.querySelector('.tree_ctnt_div').innerHTML = text + '...' 
					}
				</script>
				<div style="font-size: 15px; color: #7F817D; margin: 5px 0;"><a href="${root }/tree_commentary_detail?no=${todayTcVO.idx}">+ 더보기</a></div>
				<div class="btn_div">
					<button class="home_top_btn" onclick="location.href = '${root}/present_check'">출석체크</button>
					<button class="home_top_btn" onclick="location.href = '${root}/community_write'">게시글 작성</button>
				</div>
				<div class="auto_div">
					<audio controls="controls">
						<source src="${root }/tree_commentary_audio/${todayTcVO.tree_audio }" type="audio/wav">
					</audio>
				</div>
			</div>
		</div>
		<div class="ht_right">
			<img src="${root }/img/view/home/home_banner.svg">
		</div>
	</div>
	
	<div class="home_butterfly">
		<img src="${root }/img/view/home/home_butterfly.svg">
	</div>
	
	<div class="home_wrap">
		<div class="home_community">
			<div class="hc_title">커뮤니티</div>
			<div class="hc_more"><a href="${root }/community">+ 더보기</a></div>
			<div class="hc_ctnt">
				<c:forEach items="${cVOList }" var="cVO_list">
				<div class="hc_each">
				<input type="hidden" value="${cVO_list.idx }">
					<div class="hce_img_div" onmouseover="showBtnDiv(event)">
						<c:forEach items="${imgVOList }" var="imgVO_list">
							<c:if test="${imgVO_list.table_idx == cVO_list.idx }">
								<img src="${root }/community_file/${imgVO_list.img_path }">
							</c:if>
						</c:forEach>
					</div>
					<script>
						var hce_img_div = document.querySelectorAll('.hce_img_div')
						for(let i = 0; i < hce_img_div.length; i++) {
							if(hce_img_div[i].innerHTML.indexOf('img') == -1) {
								hce_img_div[i].innerHTML = '<img src="${root }/community_file/home_community_sample.png">'
							}
						}
					</script>
					<div class="hce_btn_div hidden" onmouseout="hideBtnDiv(event)">
						<button onmouseover="showBtnDiv(event)" onclick="location.href = '${root}/community_write'">게시글 작성</button>
						<button onmouseover="showBtnDiv(event)" onclick="location.href = '${root}/community_detail?idx=${cVO_list.idx }'">자세히 보기</button>
					</div>
					<div class="hce_title">${cVO_list.title }</div>
					<div class="hce_function_div">
						<span class="hce_like_icon_div">
							<c:if test="${not empty member }">
								<c:if test="${cVO_list.isLike ==  'n' or cVO_list.isLike == null}">
									<img src="${root }/img/view/home/home_like_icon.svg" onclick="likeActivate(event)">
								</c:if>
								<c:if test="${cVO_list.isLike ==  'y'}">
									<img src="${root }/img/view/home/home_activate_like_icon.svg" onclick="likeActivate(event)">
								</c:if>
							</c:if>
							<c:if test="${empty member }">
								<img src="${root }/img/view/home/home_like_icon.svg" onclick="likeActivate(event)">
							</c:if>
						</span>
						<span>좋아요</span>
						<span class="hce_comment_icon_div"><img src="${root }/img/view/home/home_cmt_icon.svg"></span>
						<span>댓글 ${cVO_list.cmt_count }개</span>
					</div>
				</div>
				</c:forEach>
			<script>
				function showBtnDiv(event){
					event.target.parentNode.parentNode.getElementsByTagName('div')[1].classList.remove('hidden')
				}
				function hideBtnDiv(event){
					event.target.parentNode.getElementsByTagName('div')[1].classList.add('hidden')
				}
			</script>
			<script>
				function likeActivate(event){
					if('${member == null}' == 'true') {
						alert('로그인이 필요한 기능입니다.')
						return
					}
					
					var member_idx = '${member.idx}'
					var table_idx = event.target.parentNode.parentNode.parentNode.querySelector('input').value
					var table_name = 'board_community'
					
					if(event.target.src.indexOf('activate') != -1){
						event.target.src = '${root}/img/view/home/home_like_icon.svg'
						$.ajax({
							type: "POST",
							url: "ajax_like_deactivate",
							data: { member_idx : member_idx,
								table_idx : table_idx,
								table_name : table_name
							},
							dataType: "text",
							success: function(result) {
								if(result == 1) {							
								}else {
									alert('좋아요 취소 실패')
								}
							},
							error:function(request,status,error){
							    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						})
					}else {
						event.target.src = '${root}/img/view/home/home_activate_like_icon.svg'
						$.ajax({
							type: "POST",
							url: "ajax_like_activate",
							data: { member_idx : member_idx,
								table_idx : table_idx,
								table_name : table_name
							},
							dataType: "text",
							success: function(result) {
								if(result == 1) {							
								}else {
									alert('좋아요 실패')
								}
							},
							error:function(request,status,error){
								console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						})
					}
				}
			</script>
			</div>
		</div>
		<div class="home_video">
			<div class="hv_title">나무영상</div>
<!-- 			<div class="hv_category"> -->
<!-- 				<span><a>영상</a></span> -->
<!-- 				<span>|</span> -->
<!-- 				<span><a>AR</a></span> -->
<!-- 			</div> -->
			<div class="hv_ctnt">
				<div class="hv_ctnt_left">
					<c:forEach items="${tvVOList }" var="tvVO_list">
						<div class="hvcl_video_div">
							<video src="${root }/tree_video/${tvVO_list.video_path }" poster="${root }/tree_video/${tvVO_list.thumbnail }" controls="controls"></video>
						</div>
					</c:forEach>
				</div>
				<div class="hvcl_ctrl_div">
					<img class="hvclcd_prev" src="${root }/img/view/home/home_video_prev_btn.svg" onclick="hvPrevBtn(event)">
					<img class="hvclcd_next" src="${root }/img/view/home/home_video_next_btn.svg" onclick="hvNextBtn(event)">
				</div>
				<div class="hv_ctnt_right">
					<c:forEach items="${tvVOList }" var="tvVO_list_text">
						<div class="hvcr_top">
							<div class="hvcrt_title">${tvVO_list_text.title }</div>
							<div class="hvcrt_ctnt">${tvVO_list_text.content }</div>
						</div>
					</c:forEach>
					<div class="hvcr_bot"><a href="${root }/tree_video">영상 더보기 <img src="${root }/img/view/home/home_right_angle_bracket.svg"></a></div>
				</div>
			</div>
			<script>
				var hvcl_video_div = document.querySelectorAll('.hvcl_video_div')
				for(let i = 0; i < hvcl_video_div.length; i++) {
					if(i != 0) {
						hvcl_video_div[i].classList.add('for_v_div')
					}
				}
				
				var hvcr_top = document.querySelectorAll('.hvcr_top')
				for(let i = 0; i < hvcr_top.length; i++){
					if(i != 0) {
						hvcr_top[i].classList.add('hidden')
					}
				}
			</script>
			<script>
				let minus = '-'
				let su = 0
				let px = 'px'
				let clickCnt = 0
				function hvNextBtn(event) {
					var hvcl_video_div = document.querySelectorAll('.hvcl_video_div')
					var hvcr_top = document.querySelectorAll('.hvcr_top')
					if(su == 540 * (hvcl_video_div.length - 1)) {
						alert('마지막 컨텐츠입니다')
						return
					}
					su = su + 540
					for(let i = 0; i < hvcl_video_div.length; i++){
						if(i != hvcl_video_div.length - 1) {
							let pxMove = minus + su + px
							hvcl_video_div[i].style.transition = 'all 800ms linear'
							hvcl_video_div[i + 1].style.transition = 'all 800ms linear'
							hvcl_video_div[i].style.left = pxMove
							hvcl_video_div[i + 1].style.left = pxMove
						}
					}
					clickCnt = clickCnt + 1
					setTimeout(function() {
						hvcl_video_div[clickCnt].classList.remove('for_v_div')
					}, 500)
					hvcr_top[clickCnt - 1].classList.add('hidden')
					hvcr_top[clickCnt].classList.remove('hidden')
				}
				
				function hvPrevBtn(event) {
					var hvcl_video_div = document.querySelectorAll('.hvcl_video_div')
					var hvcr_top = document.querySelectorAll('.hvcr_top')
					if(su == 0) {
						alert('첫번째 컨텐츠입니다')
						return
					}
					su = su - 540
					for(let i = 0; i < hvcl_video_div.length; i++){
						if(i != hvcl_video_div.length - 1) {
							let pxMove = minus + su + px
							hvcl_video_div[i].style.transition = 'all 800ms linear'
							hvcl_video_div[i + 1].style.transition = 'all 800ms linear'
							hvcl_video_div[i].style.left = pxMove
							hvcl_video_div[i + 1].style.left = pxMove
						}
					}
					clickCnt = clickCnt - 1
					hvcl_video_div[clickCnt + 1].classList.add('for_v_div')
					hvcr_top[clickCnt + 1].classList.add('hidden')
					hvcr_top[clickCnt].classList.remove('hidden')
				}
			</script>
		</div>
		<div class="home_webtoon">
			<div class="hw_title">웹툰</div>
			<div class="hw_more"><a href="${root }/tree_webtoon?mode=all">+ 더보기</a></div>
			<div class="hw_ctnt">
				<c:forEach items="${webtoonVOList }" var="webtoonVO_list">
					<div class="hw_each">
						<input type="hidden" value="${webtoonVO_list.idx }">
						<div class="hwe_img_div"><a href="${root}/webtoon_list?title=${webtoonVO_list.title }"><img src="${root }/webtoon_file/${webtoonVO_list.thumbnail }"></a></div>
						<div class="hwe_title">${webtoonVO_list.title }</div>
						<div class="hwe_content">${webtoonVO_list.content }</div>
						<div class="hwe_function_div">
							<span class="hce_like_icon_div">
								<c:if test="${not empty member }">
									<c:if test="${webtoonVO_list.isLike ==  'n' or webtoonVO_list.isLike == null }">
										<img src="${root }/img/view/home/home_like_icon.svg" onclick="likeActivateWT(event)">
									</c:if>
									<c:if test="${webtoonVO_list.isLike ==  'y'}">
										<img src="${root }/img/view/home/home_activate_like_icon.svg" onclick="likeActivateWT(event)">
									</c:if>
								</c:if>
								<c:if test="${empty member }">
									<img src="${root }/img/view/home/home_like_icon.svg" onclick="likeActivateWT(event)">
								</c:if>
							</span>
							<span>좋아요</span>
							<span class="hce_comment_icon_div"><img src="${root }/img/view/home/home_cmt_icon.svg"></span>
							<span>댓글 ${webtoonVO_list.cmt_count }개</span>
						</div>
						<div class="hwe_line"></div>
						<div class="hwe_btn_div">
							<button onclick="location.href = '${root}/webtoon_detail?title=${webtoonVO_list.title }&round=1'">첫화보기</button>
							<button onclick="location.href = '${root}/webtoon_list?title=${webtoonVO_list.title }'">자세히 보기</button>
						</div>
					</div>
				</c:forEach>
				<script>
				function likeActivateWT(event){
					if('${member == null}' == 'true') {
						alert('로그인이 필요한 기능입니다.')
						return
					}
					
					var member_idx = '${member.idx}'
					var table_idx = event.target.parentNode.parentNode.parentNode.querySelector('input').value
					var table_name = 'board_webtoon'
					
					if(event.target.src.indexOf('activate') != -1){
						event.target.src = '${root}/img/view/home/home_like_icon.svg'
						$.ajax({
							type: "POST",
							url: "ajax_like_deactivate_webtoon",
							data: { member_idx : member_idx,
								table_idx : table_idx,
								table_name : table_name
							},
							dataType: "text",
							success: function(result) {
								if(result == 1) {							
								}else {
									alert('좋아요 취소 실패')
								}
							},
							error:function(request,status,error){
							    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						})
					}else {
						event.target.src = '${root}/img/view/home/home_activate_like_icon.svg'
						$.ajax({
							type: "POST",
							url: "ajax_like_activate_webtoon",
							data: { member_idx : member_idx,
								table_idx : table_idx,
								table_name : table_name
							},
							dataType: "text",
							success: function(result) {
								if(result == 1) {							
								}else {
									alert('좋아요 실패')
								}
							},
							error:function(request,status,error){
								console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						})
					}
				}
			</script>
			</div>
		</div>
		<div class="home_rank">
			<div class="hr_each">
				<div class="hr_top">
					<div class="hr_title">커뮤니티</div>
					<div class="hr_first_div">
						<div class="hrf_left">
							<img src="${root }/img/view/home/home_rank_medal.svg">
						</div>
						<div class="hrf_right">
							<div class="hrfr_nickname">${crVOList[0].member_id }</div>
							<div class="hrfr_point point_comma">${crVOList[0].count }회</div>
						</div>
					</div>
					<div class="hr_second_div hr_span_div">
						<span class="hr_rank_span">2위</span>
						<span class="hr_rank_point point_comma">${crVOList[1].count }회</span>
						<span class="hr_rank_nickname">${crVOList[1].member_id }</span>
					</div>
				</div>
				<div class="hr_third_div">
					<div class="hr_span_div">
						<span class="hr_rank_span">3위</span>
						<span class="hr_rank_point point_comma">${crVOList[2].count }회</span>
						<span class="hr_rank_nickname">${crVOList[2].member_id }</span>
					</div>
				</div>
				<div class="hr_fourth_div">
					<div class="hr_span_div">
						<span class="hr_rank_span">4위</span>
						<span class="hr_rank_point point_comma">${crVOList[3].count }회</span>
						<span class="hr_rank_nickname">${crVOList[3].member_id }</span>
					</div>
				</div>
				<div class="hr_fifth_div">
					<div class="hr_span_div">
						<span class="hr_rank_span">5위</span>
						<span class="hr_rank_point point_comma">${crVOList[4].count }회</span>
						<span class="hr_rank_nickname">${crVOList[4].member_id }</span>
					</div>
				</div>
			</div>
			<div class="hr_each">
				<div class="hr_top">
					<div class="hr_title">포인트</div>
					<div class="hr_first_div">
						<div class="hrf_left">
							<img src="${root }/img/view/home/home_rank_medal.svg">
						</div>
						<div class="hrf_right">
							<div class="hrfr_nickname">${prVOList[0].member_id }</div>
							<div class="hrfr_point point_comma">${prVOList[0].point } pt</div>
						</div>
					</div>
					<div class="hr_second_div hr_span_div">
						<span class="hr_rank_span">2위</span>
						<span class="hr_rank_point point_comma">${prVOList[1].point } pt</span>
						<span class="hr_rank_nickname">${prVOList[1].member_id }</span>
					</div>
				</div>
				<div class="hr_third_div">
					<div class="hr_span_div">
						<span class="hr_rank_span">3위</span>
						<span class="hr_rank_point point_comma">${prVOList[2].point } pt</span>
						<span class="hr_rank_nickname">${prVOList[2].member_id }</span>
					</div>
				</div>
				<div class="hr_fourth_div">
					<div class="hr_span_div">
						<span class="hr_rank_span">4위</span>
						<span class="hr_rank_point point_comma">${prVOList[3].point } pt</span>
						<span class="hr_rank_nickname">${prVOList[3].member_id }</span>
					</div>
				</div>
				<div class="hr_fifth_div">
					<div class="hr_span_div">
						<span class="hr_rank_span">5위</span>
						<span class="hr_rank_point point_comma">${prVOList[4].point } pt</span>
						<span class="hr_rank_nickname">${prVOList[4].member_id }</span>
					</div>
				</div>
			</div>
			<div class="hr_each">
				<div class="hr_top">
					<div class="hr_title">출석체크</div>
					<div class="hr_first_div">
						<div class="hrf_left">
							<img src="${root }/img/view/home/home_rank_medal.svg">
						</div>
						<div class="hrf_right">
							<div class="hrfr_nickname">${presentRankVOList[0].member_id }</div>
							<div class="hrfr_point point_comma">${presentRankVOList[0].count }회</div>
						</div>
					</div>
					<div class="hr_second_div hr_span_div">
						<span class="hr_rank_span">2위</span>
						<span class="hr_rank_point point_comma">${presentRankVOList[1].count }회</span>
						<span class="hr_rank_nickname">${presentRankVOList[1].member_id }</span>
					</div>
				</div>
				<div class="hr_third_div">
					<div class="hr_span_div">
						<span class="hr_rank_span">3위</span>
						<span class="hr_rank_point point_comma">${presentRankVOList[2].count }회</span>
						<span class="hr_rank_nickname">${presentRankVOList[2].member_id }</span>
					</div>
				</div>
				<div class="hr_fourth_div">
					<div class="hr_span_div">
						<span class="hr_rank_span">4위</span>
						<span class="hr_rank_point point_comma">${presentRankVOList[3].count }회</span>
						<span class="hr_rank_nickname">${presentRankVOList[3].member_id }</span>
					</div>
				</div>
				<div class="hr_fifth_div">
					<div class="hr_span_div">
						<span class="hr_rank_span">5위</span>
						<span class="hr_rank_point point_comma">${presentRankVOList[4].count }회</span>
						<span class="hr_rank_nickname">${presentRankVOList[4].member_id }</span>
					</div>
				</div>
			</div>
		</div>
		<script>
			var pointComma = document.querySelectorAll('.point_comma')
			for(let i = 0; i < pointComma.length; i++) {
				var comma = pointComma[i].innerText.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				pointComma[i].innerText = comma
			}
		</script>
	</div>
</div>


<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>