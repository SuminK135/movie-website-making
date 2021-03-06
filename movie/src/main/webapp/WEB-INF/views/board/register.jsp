<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>킹무비 - King Movie | Community</title>
	<meta content="IE=Edge" http-equiv="X-UA-Compatible">
	<!-- viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet">
	<!-- Favicon -->
	<link rel="icon" type="image/png" href="/resources/images/crown.png">
	<!-- CSS -->
	<link rel="stylesheet" href="/resources/css/base/jquery-ui.css" />
	<link rel="stylesheet" href="/resources/css/board_register.css" />
	<script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
/* 	window.onload = function() {
		document.getElementById('boardsubmit').onclick = function() {
			
			if(document.boardfrm.info.checked == false) {
				alert('개인정보 수집 및 이용에 동의하셔야 합니다.');
				return false;
			}
			
			if(document.boardfrm.writer.value.trim() == "") {
				alert('이름을 입력하셔야 합니다.');
				return false;				
			}
			
			if(document.boardfrm.password.value.trim() == "") {
				alert('비밀번호를 입력하셔야 합니다.');
				return false;				
			}
			
			if(document.boardfrm.subject.value.trim() == "") {
				alert('제목을 입력하셔야 합니다.');
				return false;				
			}	
			
			document.boardfrm.submit();
		};
	}; */
	</script>
	<script type="text/javascript">
	$(document).ready(function(e) {
		
		var formObj = $("form[role='form']");
		
		$("#boardsubmit").on("click", function(e) {
		
			e.preventDefault();
			
			console.log("submit clicked");
			
			if(document.boardfrm.info.checked == false) {
				alert('개인정보 수집 및 이용에 동의하셔야 합니다.');
				return false;
			}
			
			if(document.boardfrm.writer.value.trim() == "") {
				alert('이름을 입력하셔야 합니다.');
				return false;				
			}
			
			if(document.boardfrm.password.value.trim() == "") {
				alert('비밀번호를 입력하셔야 합니다.');
				return false;				
			}
			
			if(document.boardfrm.subject.value.trim() == "") {
				alert('제목을 입력하셔야 합니다.');
				return false;				
			}
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj) {
				
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";				
			
			});
			
			formObj.append(str).submit();
		});
	
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
		
		function checkExtension(fileName, fileSize) {
			
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
				
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
				
			return true;
				
		}
		
		$("input[type='file']").change(function(e) {
			
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			for(var i = 0; i < files.length; i++) {
				
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				
				formData.append("uploadFile", files[i]);
				
			}
			
			$.ajax({
				url: '/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
					type: 'POST',
					dataType: 'json',
					success: function(result) {
						
						console.log(result);
						showUploadResult(result); // 업로드 결과 처리 함수
						
					}
			});

		});
		
		//섬네일 등을 만들어 처리하는 부분
		function showUploadResult(uploadResultArr) {
			
			if(!uploadResultArr || uploadResultArr.length == 0) {return;}
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj) {
				//image type
				if(obj.fileType) {

					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

					str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>";
					str += "	<div>";
					str += "		<img src='/display?fileName=" + fileCallPath + "'><span>" + obj.fileName + "</span>";
					str += "		<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'>x</button><br>";
					str += "	</div>";
					str += "</li>";
					
				} else {
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					
					str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>";
					str += "	<div>";
					str += "		<img src='/resources/images/attach.png'><span>" + obj.fileName + "</span>";
					str += "		<button type='button' data-file=\'" + fileCallPath + "\' data-type='file'>x</button><br>";
					str += "	</div>";
					str += "</li>";
					
				}
			});
			
			uploadUL.append(str);
		}
		
		//첨부파일 삭제처리
		$(".uploadResult").on("click", "button", function(e) {
		
			//console.log("delete file");
		
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			//console.log(targetFile);
			//console.log(type);
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: '/deleteFile',
				data: {fileName: targetFile, type: type},
				dataType: 'text',
				type: 'POST',
				success: function(result) {
					
					alert(result);
					targetLi.remove();
						
				}
			});
			
		});
		
		
		
		
	
	});
	</script>
<body>
	
	<%@include file="../includes/header.jsp" %>
	<hr>
	
	<div class="board-register wrapper">
		<div class="register">
		
			<form action="/board/register" method="post" name="boardfrm" role="form">
				<div class="contents_sub">
				<!--table-->
					<div class="board_write">
						<table>
						<tr>
							<th class="top">글쓴이</th>
							<td class="top" colspan="3"><input type="text" name="writer" value="" class="board_write_input_100" maxlength="20" /></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="subject" value="" class="board_write_input" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td colspan="3"><input type="password" name="password" value="" class="board_write_input_100"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<textarea name="content" class="board_editor_area"></textarea>
							</td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td colspan="3">
								<input class="board_write_file" type="file" name="uploadFile" multiple />
								<div class="uploadResult">
									<ul>
									
									</ul>
								</div>
							</td>
						</tr>
						 <!-- 
						<tr>
							<th>이메일</th>
							<td colspan="3"><input type="text" name="mail1" value="" class="board_write_input_100"/> @ <input type="text" name="mail2" value="" class="board_write_input_100"/></td>
						</tr>
						 -->
						<tr>
							<th>이메일</th>
							<td colspan="3"><input type="text" name="mail" value="" class="board_write_input_100"/></td>
						</tr>
						</table>
						
						<table class="agree">
						<tr>
							<br />
							<td>
								<div class="agree-title">※ 개인정보 수집 및 이용에 관한 안내</div>
								<div class="agree-box">
									<textarea readonly="readonly" rows="4" >  1.  수집 개인정보 항목 : 회사명, 담당자명, 이메일, 전화번호, 팩스번호, 주소 등
  2.  개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보
  3.  개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다.
  4.  그 밖의 사항은 개인정보취급방침을 준수합니다.</textarea>
								</div>
								<div class="agree-check">
									<label><input type="checkbox" name="info" value="1" class=""> 개인정보 수집 및 이용에 대해 동의합니다.</label>
								</div>
							</td>
						</tr>
						</table>
					</div>
		
					<div class="btn_area">
						<div class="align_left">			
							<input type="button" 
									value="목록" 
									class="btn_list btn_txt02" 
									style="cursor: pointer;" 
									onclick="location.href='list?cpage='" />
						</div>
						<div class="align_right">			
							<input type="button" 
									value="등록" 
									id="boardsubmit" 
									class="btn_write btn_txt01" 
									style="cursor: pointer;" />					
						</div>	
					</div>	
					<!--/table-->
				</div>
			</form>
		</div>
	</div>
	
	<%@include file="../includes/footer.jsp" %>
	
</body>
</html>