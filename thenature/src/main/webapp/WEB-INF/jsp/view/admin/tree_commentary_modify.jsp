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
#clear_file1, #clear_file2 {
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
</style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>

<div class="total_wrap">
	<div class="cw_wrap">
		<div class="cww_wrap">
		
			<div class="cw_title">
				<span>나무 해설 수정</span>
			</div>
			
			<form method="POST" enctype="multipart/form-data" id="commentary_modify">
				<input type="hidden" name="member_idx" value="${member.idx }">
				<input type="hidden" name="writer" value="${member.name }">
				<input type="hidden" name="idx" value="${tcVO.idx }">
				<div class="cw_form">
					<table class="cwf_table">
						<tbody class="cwf_tbody">
							<tr class="cwf_tr">
								<td class="th_td">이름<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="tree_name" name="tree_name" value="${tcVO.tree_name }" placeholder="이름을 입력해주세요."></div></td>
								<td class="th_td">영문<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="tree_name_english" name="tree_name_english" value="${tcVO.tree_name_english }" placeholder="이름(영문)을 입력해주세요."></div></td>
								<td class="th_td">학명<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="tree_name_scientific" name="tree_name_scientific" value="${tcVO.tree_name_scientific }" placeholder="학명을 입력해주세요."></div></td>
							</tr>
							<tr class="cwf_tr">
								<td class="th_td">계<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="tree_kind01" name="tree_kind01" value="${tcVO.tree_kind01 }" placeholder="계를 입력해주세요."></div></td>
								<td class="th_td">문<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="tree_kind02" name="tree_kind02" value="${tcVO.tree_kind02 }" placeholder="문을 입력해주세요."></div></td>
								<td class="th_td">강<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="tree_kind03" name="tree_kind03" value="${tcVO.tree_kind03 }" placeholder="강을 입력해주세요."></div></td>
							</tr>
							<tr class="cwf_tr">
								<td class="th_td">목<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="tree_kind04" name="tree_kind04" value="${tcVO.tree_kind04 }" placeholder="목을 입력해주세요."></div></td>
								<td class="th_td">분포지역<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="tree_locate" name="tree_locate" value="${tcVO.tree_locate }" placeholder="분포지역을 입력해주세요."></div></td>
								<td class="th_td">크기<span style="color: red;">*</span></td>
								<td class="td_td"><div class="td_div"><input type="text" class="tree_size" name="tree_size" value="${tcVO.tree_size }" placeholder="크기를 입력해주세요."></div></td>
							</tr>
							<tr class="cwf_tr">
								<td class="th_td">상세설명<span style="color: red;">*</span></td>
								<td class="td_td" colspan="5">
									<div class="td_div">
										<textarea class="td_textarea" name="content" placeholder="상세설명을 입력해주세요.">${tcVO.content }</textarea>
									</div>
								</td>
							</tr>
							<tr class="cwf_tr">
								<td class="th_td">썸네일<span style="color: red;">*</span></td>
								<td class="td_td" colspan="5">
									<div class="td_div">
										<input type="file" class="tc_thumnail" name="tc_thumnail" accept="image/*" style="width: 40%;" onchange="showfile1();">
										현재 업로드된 파일 : <span class="span_file1">${tcVO.thumnail }</span>
									</div>
									<script>
										function showfile1() {
											var fileValue = document.querySelector('.tc_thumnail').value
											for(let i = 0; i < fileValue.length; i++) {
												if(fileValue.indexOf('\\') != -1) {
													fileValue = fileValue.substring(fileValue.indexOf('\\') + 1, fileValue.length)
												}
											}
											var spanFile = document.querySelector('.span_file1')
											spanFile.innerText = fileValue
										}
									</script>
								</td>
							</tr>
							<tr class="cwf_tr">
								<td class="th_td">오디오</td>
								<td class="td_td" colspan="5">
									<div class="td_div">
										<input type="file" class="tc_audio" name="tc_audio" accept="audio/*" style="width: 40%;" onchange="showfile2()">
										현재 업로드된 파일 : <span class="span_file2">${tcVO.tree_audio }</span>
<!-- 										<button id="clear_file2" onclick="clearFile2(event)">-</button> -->
										<script>
// 											function clearFile2(event) {
// 												event.preventDefault()
// 												var sfile2 = document.querySelector('.span_file2')
// 												var clearBtn2 = document.getElementById('clear_file2')
// 												sfile2.remove()
// 												clearBtn2.style.display = 'none'
												
// 												var file2 = document.querySelector('input[name="tc_audio"]')
// 												file2.value = ''
// 											}
										</script>
									</div>
									<script>
										function showfile2() {
											var fileValue = document.querySelector('.tc_audio').value
											for(let i = 0; i < fileValue.length; i++) {
												if(fileValue.indexOf('\\') != -1) {
													fileValue = fileValue.substring(fileValue.indexOf('\\') + 1, fileValue.length)
												}
											}
											var spanFile = document.querySelector('.span_file2')
											spanFile.innerText = fileValue
										}
									</script>
								</td>
							</tr>
							<tr class="cwf_tr">
								<td class="th_td">이미지</td>
								<td class="td_td" colspan="5">
									<div class="td_div" style="padding: 0;">
										<div class="dd_div drop-zone">
											<c:forEach items="${iVO }" var="iVO">
												<p>${iVO.img_path }</p>
											</c:forEach>
										</div>
										<div class="dd_icon_div">
											<label>
												<input type="file" id="file" name="tc_image" accept="image/*" multiple="multiple" onchange="fileCountLimit();">
												<img src="${root }/img/view/community/input_file.png">
											</label>
										</div>
										<script>
											function fileCountLimit() {
												var file = document.querySelector('.tc_image')
												if(file.files.length > 3) {
													alert('첨부파일은 3개씩만 첨부할 수 있습니다.')
													file.value = ''
													return
												} else if(file.files.length < 3) {
													alert('첨부파일은 3개씩만 첨부할 수 있습니다.')
													file.value = ''
													return
												}
											}
										</script>
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
												
									            // 파일 업로드 개수 제한(3개)
									            var fileUpload = document.querySelector('input[name="tc_image"]')
									            if(parseInt(fileUpload.get(0).files.length) > 3) {
									            	alert('첨부파일은 반드시 3개씩만 첨부해야합니다.')
									            	return
									            } else if(parseInt(fileUpload.get(0).files.length) < 3) {
									            	alert('첨부파일은 반드시 3개씩만 첨부해야합니다.')
									            	return
									            }
									            
									            // 드래그한 파일이 드랍되었을 때
									            dropZone.addEventListener("drop", function(e) {
									                e.preventDefault()
													
									                dropZone.style.border = ''
									                dropZone.style.backgroundColor = 'white'
									                
									                toggleClass("drop")
									
									                var files = e.dataTransfer && e.dataTransfer.files
									                console.log(files)
									
									                if (files != null) {
									                    if (files.length < 3) {
									                        alert("첨부파일은 반드시 3개씩만 첨부해야합니다.")
									                        return
									                    } else if(files.length > 3) {
									                    	alert("첨부파일은 반드시 3개씩만 첨부해야합니다.")
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
					<input class="save_btn" type="submit" value="수정" onclick="neccessaryCheck(event)">
					<input class="list_btn" type="button" value="목록" onclick="location.href = '${root}/admin/tree_commentary_list'">
				</div>
			</form>
		</div>
	</div>
</div>

</body>
<script>
	// 서브밋 체크
	function neccessaryCheck(event) {
		event.preventDefault()
		var name = document.querySelector('.tree_name').value
		var nameEnglish = document.querySelector('.tree_name_english').value
		var nameScientific = document.querySelector('.tree_name_scientific').value
		var treeKind1 = document.querySelector('.tree_kind01').value
		var treeKind2 = document.querySelector('.tree_kind02').value
		var treeKind3 = document.querySelector('.tree_kind03').value
		var treeKind4 = document.querySelector('.tree_kind04').value
		var treeLocate = document.querySelector('.tree_locate').value
		var treeSize = document.querySelector('.tree_size').value
		var content = document.querySelector('.td_textarea').value
		var thumnail = document.querySelector('.span_file1').innerText
		
		if(name == '' || nameEnglish == '' || nameScientific == '' || treeKind1 == '' || treeKind2 == '' ||
				treeKind3 == '' || treeKind4 == '' || treeLocate == '' || treeSize == '' || content == '' || thumnail == '') {
			alert('필수 정보를 입력하지 않으셨습니다.')
			return
		} else {
			alert('나무 해설이 수정되었습니다.')
			document.getElementById('commentary_modify').submit()
		}
	}
</script>
</html>