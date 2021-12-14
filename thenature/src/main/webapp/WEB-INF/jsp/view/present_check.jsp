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

.pc_wrap {
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
	width: 100px;
}

.change_pw_tab {
	width: 100px;
}

.my_posting_tab {
	width: 90px;
/* 	color: #5C8E46; */
/* 	border-bottom: 3px solid #5C8E46; */
}

.manage_point_tab {
	width: 90px;
}

.present_check_tab {
	width: 75px;
	color: #5C8E46;
	border-bottom: 3px solid #5C8E46;
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

table {
	clear: both;
	width: 100%;
	height: 500px;
	border-collapse: collapse;
}

th {
	height: 70px;
	width: 70px;
	/* 	background-color: orange; */
}
.dayOfWeek {
	border: 1px solid #707070;
	height: 50px;
	background-color: #35600C;
	color: white;
}
td {
	text-align: right;
	vertical-align: top;
	height: 100px;
	width : 70px;
/* 	background-color: #FFFDC5; */
	border: 1px solid #707070;
	font-weight: bold;
	font-size: 14px;
	padding: 10px;
}

input {
	height: 70px;
	width: 70px;
	border: none;
	background-color: white;
	font-size: 30px;
	cursor: pointer;
}

.year_mon {
	font-size: 25px;
	height: 150px;
}

.colToday {
	background-color: #EEEEEE;
}

.btn_div {
	text-align: center;
	margin: 30px 0;
}
.btn_div button {
	border: 1px solid #35600C;
	color: #35600C;
	font-weight: bold;
	font-size: 13px;
	border-radius: 5px;
	background-color: white;
	width: 125px;
	height: 34px;
}
.btn_div button:hover {
	background-color: #35600C;
	color: white;
	cursor: pointer;
}
.dojang {
	width: 0;
    height: 0;
}
.dojang_img {
	position: relative;
    top: -10px;
    left: 13px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    $(function(){
        var today = new Date();
        var date = new Date();           

        $("input[name=preMon]").click(function() { // 이전달
            $("#calendar > tbody > td").remove();
            $("#calendar > tbody > tr").remove();
            today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
            buildCalendar();
            doInputVal()
            loadingCalendar()
        })
        
        $("input[name=nextMon]").click(function(){ //다음달
            $("#calendar > tbody > td").remove();
            $("#calendar > tbody > tr").remove();
            today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
            buildCalendar();
            doInputVal()
            loadingCalendar()
        })


        function buildCalendar() {
            nowYear = today.getFullYear();
            nowMonth = today.getMonth();
            firstDate = new Date(nowYear,nowMonth,1).getDate();
            firstDay = new Date(nowYear,nowMonth,1).getDay(); //1st의 요일
            lastDate = new Date(nowYear,nowMonth+1,0).getDate();

            if((nowYear%4===0 && nowYear % 100 !==0) || nowYear%400===0) { //윤년 적용
                lastDate[1]=29;
            }

            $(".year_mon").text(nowYear+"년 "+(nowMonth+1)+"월");

            for (i=0; i<firstDay; i++) { //첫번째 줄 빈칸
                $("#calendar tbody:last").append("<td></td>");
            }
            for (i=1; i <=lastDate; i++){ // 날짜 채우기
                plusDate = new Date(nowYear,nowMonth,i).getDay();
                if (plusDate==0) {
                    $("#calendar tbody:last").append("<tr></tr>");
                }
                $("#calendar tbody:last").append("<td class='date'><input type='hidden' class='today_date' name='today_date'>"+ i +"</td>");
            }
            if($("#calendar > tbody > td").length%7!=0) { //마지막 줄 빈칸
                for(i=1; i<= $("#calendar > tbody > td").length%7; i++) {
                    $("#calendar tbody:last").append("<td></td>");
                }
            }
            $(".date").each(function(index){ // 오늘 날짜 표시
                if(nowYear==date.getFullYear() && nowMonth==date.getMonth() && $(".date").eq(index).text()==date.getDate()) {
                    $(".date").eq(index).addClass('colToday');
                }
            }) 
        }
        buildCalendar();
        doInputVal()
		loadingCalendar()
    })
    
</script>
</head>
<body>
<c:if test="${empty member }">
	<script>
		alert('로그인이 필요한 기능입니다.')
		location.href = '${root}/login'
	</script>
</c:if>
<jsp:include page="/WEB-INF/jsp/header/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/header/header_second.jsp"/>

<div class="total_wrap">
	<div class="pc_wrap">
	
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
		<input type="hidden" name="member_idx" id="member_idx" value="${member.idx }">
		<table id="calendar">
			<thead>
				<tr>
					<th><input name="preMon" type="button" value="<"></th>
					<th colspan="5" class="year_mon"></th>
					<th><input name="nextMon" type="button" value=">"></th>
				</tr>
				<tr>
					<th class="dayOfWeek">SUN</th>
					<th class="dayOfWeek">MON</th>
					<th class="dayOfWeek">TUE</th>
					<th class="dayOfWeek">WED</th>
					<th class="dayOfWeek">THU</th>
					<th class="dayOfWeek">FRI</th>
					<th class="dayOfWeek">SAT</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<script>
// 			const yearMon = document.querySelector('.year_mon').innerText
// 			const date = document.querySelectorAll('.date')
// 			const inputDate = document.querySelectorAll('.today_date')
// 			for(let i = 0; i < date.length; i++) {
// 				inputDate[i].value = yearMon.substring(0, 4) + '-' + yearMon.substring(6, 8) + '-' + date[i].innerText.padStart(2, '0')
// 			}
			function doInputVal() {
				for(let i = 0; i < document.querySelectorAll('.date').length; i++) {				
				    document.querySelectorAll('.today_date')[i].value = document.querySelector('.year_mon').innerText.substring(0, 4) + '-' + document.querySelector('.year_mon').innerText.substring(6, 8) + '-' + document.querySelectorAll('.date')[i].innerText.padStart(2, '0')
				}
			}
			
		</script>
		<div class="btn_div">
			<button onclick="pCheckHandler()">출석체크하기</button>
		</div>
		<script>
			function pCheckHandler() {
				var box = document.querySelector('.colToday')
				if(box.classList.contains('activated')) {
					alert('이미 출석체크를 완료하셨습니다.')
					return
				}else {
					var member_idx = $("#member_idx").val()
					$.ajax({
						type: "POST",
						url: "ajax_present",
						data: { member_idx : member_idx },
						dataType: "text",
						success: function(result){
							if(result == 1) {
								box.innerHTML += '<div class="dojang"><img class="dojang_img" src="${root}/img/view/mypage/dojang.svg"></div' 
								box.classList.add('activated')
								window.location.reload()
							} else {
								alert('출석체크를 할 수 없습니다.')
							}
						},
						error: function() {
							alert('에러입니다.')
						}
					})
				}
			}
		</script>
		<c:forEach items="${presentVO }" var="present_list">
			<input type="hidden" class="testVal" value="${present_list.pc_date }">
		</c:forEach>
		<script>
			function loadingCalendar(){
				var inputVal = document.querySelectorAll('.today_date')
				var testVal = document.querySelectorAll('.testVal')
				console.log('testVal.length : ' + testVal.length)
				for(let i = 0; i < inputVal.length; i++){
					console.log(inputVal[i].parentNode)
					for(let j = 0; j < testVal.length; j++){
						if(inputVal[i].value == testVal[j].value) {
							inputVal[i].parentNode.classList.add('activated')
							inputVal[i].parentNode.innerHTML += '<div class="dojang"><img class="dojang_img" src="${root}/img/view/mypage/dojang.svg"></div'
						}
					}
				}
			}
		</script>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>

</body>
</html>