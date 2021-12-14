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
.cw_wrap {
	width: 1000px;
	margin: 100px auto;
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
	border-collapse: collapse;
	border-top: 1px solid #707070;
	width: 1000px;
}
.cwf_tr {
	border-bottom: 1px solid #707070;
}
.f_td {
	background-color: #EEEEEE;
	color: #272727;
	font-size: 17px;
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
	height: 200px;
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
	border: 1px solid #5C8E46;
	background-color: white;
	color: #5C8E46;
	font-size: 15px;
	font-weight: bold;
	width: 80px;
	height: 33px;
}
.save_btn {
	margin-right: 15px;
}
.save_btn:hover, .list_btn:hover {
	background-color: #5C8E46;
	color: white;
	cursor: pointer;
}
</style>
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
	<div class="cw_wrap">
		
		<div class="cw_title">
			<span id="cw_title_span">게시글 작성</span>
		</div>
		<script>
			var link = window.location.href
			if(link.indexOf('modify') != -1) {
				document.getElementById('cw_title_span').innerText = '게시글 수정'
			}
		</script>
		<form method="POST" enctype="multipart/form-data">
		<div class="cw_form">
			<table class="cwf_table">
				<tbody class="cwf_tbody">
					<tr class="cwf_tr">
						<td class="f_td">제목</td>
						<td class="s_td">
							<div class="s_td_div">
								<input type="text" name="title" placeholder="제목을 입력해주세요." value="${not empty cVO ? cVO.title : '' }">
								<input type="hidden" name="member_idx" value="${member.idx }">
								<input type="hidden" name="writer" value="${member.id }">
								<c:if test="${not empty cVO }">
									<input type="hidden" name="idx" value="${cVO.idx }">
								</c:if>
							</div>
						</td>
					</tr>
					<tr class="cwf_tr">
						<td class="f_td">내용</td>
						<td class="s_td">
							<div class="s_td_div">
								<textarea name="content" placeholder="내용을 입력해주세요.">${not empty cVO ? cVO.content : '' }</textarea>
							</div>
						</td>
					</tr>
					<tr class="cwf_tr">
						<td class="f_td">첨부</td>
						<td class="s_td">
							<div class="s_td_div std_dd">
								<div class="dd_div drop-zone">
									<c:if test="${empty imgVO }">
										<span>Drag & Drop 으로 이미지를 끌어올려주세요.<br>(파일은 1개까지만 업로드할 수 있습니다.)</span>
									</c:if>
									<c:if test="${not empty imgVO }">
										<p>${imgVO.img_path }</p>
									</c:if>
								</div>
								<div class="dd_icon_div">
									<label>
										<input id="file" type="file" name="img_path" accept="image/*">
										<img src="${root }/img/view/community/input_file.png">
									</label>
								</div>
								<script>
							        (function() {
							            
							            var $file = document.getElementById("file")
							            var dropZone = document.querySelector(".drop-zone")
							
							            var toggleClass = function(className) {
							                
							                console.log("current event: " + className)
							
							                var list = ["dragenter", "dragleave", "dragover", "drop"]
							
							                for (var i = 0; i < list.length; i++) {
							                    if (className === list[i]) {
							                        dropZone.classList.add("drop-zone-" + list[i])
							                    } else {
							                        dropZone.classList.remove("drop-zone-" + list[i])
							                    }
							                }
							            }
							            
							            var showFiles = function(files) {
							                dropZone.innerHTML = ""
							                for(var i = 0, len = files.length; i < len; i++) {
							                    dropZone.innerHTML += "<p>" + files[i].name + "</p>"
							                }
							            }
							
							            var selectFile = function(files) {
							                // input file 영역에 드랍된 파일들로 대체
							                $file.files = files
							                showFiles($file.files)
							                
							            }
							            
							            $file.addEventListener("change", function(e) {
							                showFiles(e.target.files)
							            })
							
							            // 드래그한 파일이 최초로 진입했을 때
							            dropZone.addEventListener("dragenter", function(e) {
							                e.stopPropagation()
							                e.preventDefault()
											
							                dropZone.style.border = '1px dashed #707070'
							                dropZone.style.backgroundColor = '#EEEEEE'
							                
							                toggleClass("dragenter")
							
							            })
							
							            // 드래그한 파일이 dropZone 영역을 벗어났을 때
							            dropZone.addEventListener("dragleave", function(e) {
							                e.stopPropagation()
							                e.preventDefault()
											
							                dropZone.style.border = ''
							                dropZone.style.backgroundColor = 'white'
							                
							                toggleClass("dragleave")
							
							            })
							
							            // 드래그한 파일이 dropZone 영역에 머물러 있을 때
							            dropZone.addEventListener("dragover", function(e) {
							                e.stopPropagation()
							                e.preventDefault()
							
							                toggleClass("dragover")
							
							            })
							
							            // 드래그한 파일이 드랍되었을 때
							            dropZone.addEventListener("drop", function(e) {
							                e.preventDefault()
											
							                dropZone.style.border = ''
							                dropZone.style.backgroundColor = 'white'
							                
							                toggleClass("drop")
							
							                var files = e.dataTransfer && e.dataTransfer.files
							                console.log(files)
							
							                if (files != null) {
							                    if (files.length < 1) {
							                        alert("폴더 업로드 불가")
							                        return
							                    } else if(files.length > 1) {
							                    	alert("첨부파일은 최대 1개까지 업로드할 수 있습니다.")
							                    	return
							                    }
							                    selectFile(files)
							                } else {
							                    alert("ERROR")
							                }
							
							            })
							
							        })();
							
							        
							    </script>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="btn_div">
			<input class="save_btn" type="submit" value="저장">
			<c:if test="${empty cVO }">
				<input class="list_btn" type="button" value="목록" onclick="location.href = '${root}/community'">
			</c:if>
			<c:if test="${not empty cVO }">
				<input class="list_btn" type="button" value="목록" onclick="location.href = '${root}/my_posting'">
			</c:if>
		</div>
		
		
		</form>
	
	</div>
</div>



<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>


</body>
</html>