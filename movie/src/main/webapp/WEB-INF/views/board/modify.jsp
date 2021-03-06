<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	window.onload = function() {
		document.getElementById("boardsubmit").onclick = function() {
			
			if(document.modifyfrm.info.checked == false) {
				alert('개인정보 수집 및 이용에 동의하셔야 합니다.');
				return false;
			}
			
			if(document.modifyfrm.writer.value.trim() == "") {
				alert('이름을 입력하셔야 합니다.');
				return false;				
			}
			
			if(document.modifyfrm.password.value.trim() == "") {
				alert('비밀번호를 입력하셔야 합니다.');
				return false;				
			}
			
			var pw = '<c:out value="${board.password}"/>';
			
			if(document.modifyfrm.password.value != pw) {
				alert('비밀번호가 틀립니다.');
				return false;				
			}
			
			if(document.modifyfrm.subject.value.trim() == "") {
				alert('제목을 입력하셔야 합니다.');
				return false;				
			}	
			
			document.modifyfrm.submit();
		};
	};
	
	$(document).ready(function() {
		
		var moveListPaging = $("#moveListPaging");
		
		$(".btn_list").on("click", function(e) {
			
			e.preventDefault();
			
			moveListPaging.submit();
			
		});
		
		
	});
	</script>
</head>
<body>

	<%@include file="../includes/header.jsp" %>
	<hr>
	
	<div class="board-register wrapper">
		<div class="register">
		
			<form action="/board/modify" method="post" name="modifyfrm">
			
				<input type="hidden" name="seq" value="${board.seq }"> <!-- Hidden -->
				<input type="hidden" name="pageNum" value="${pg.pageNum }">
				<input type="hidden" name="amount" value="${pg.amount }">
				<input type="hidden" name="type" value="${pg.type }">
				<input type="hidden" name="keyword" value="${pg.keyword }">
				
				<div class="contents_sub">
				<!--table-->
					<div class="board_write">
						<table>
						<tr>
							<th class="top">글쓴이</th>
							<td class="top" colspan="3"><input type="text" name="writer" value="${board.writer }" class="board_write_input_100" maxlength="5" /></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="subject" value="${board.subject }" class="board_write_input" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td colspan="3"><input type="password" name="password" value="" class="board_write_input_100"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<textarea name="content" class="board_editor_area">${board.content }</textarea>
							</td>
						</tr>
						<!-- 
						<tr>
							<th>파일첨부</th>
							<td colspan="3"><input type="file" name="upload" value="" class="board_write_file" /></td>
						</tr>
						 -->
						 <!-- 
						<tr>
							<th>이메일</th>
							<td colspan="3"><input type="text" name="mail1" value="" class="board_write_input_100"/> @ <input type="text" name="mail2" value="" class="board_write_input_100"/></td>
						</tr>
						 -->
						<tr>
							<th>이메일</th>
							<td colspan="3"><input type="text" name="mail" value="${board.mail }" class="board_write_input_100"/></td>
						</tr>
						</table>
						
						<table class="agree">
						<tr>
							<br />
							<td>
								<div class="agree-title">※ 개인정보 수집 및 이용에 관한 안내</div>
								<div class="agree-box">
									<textarea readonly="readonly" rows="4">  1.  수집 개인정보 항목 : 회사명, 담당자명, 이메일, 전화번호, 팩스번호, 주소 등
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
									onclick="location.href='list'" />
						</div>
						<div class="align_right">			
							<input type="button" 
									value="수정" 
									id="boardsubmit" 
									class="btn_write btn_txt01" 
									style="cursor: pointer;" />			
						</div>	
					</div>	
					<!--/table-->
				</div>
			</form>
			
			<form id="moveListPaging" action="/board/list" method="get">
				<input type="hidden" name="pageNum" value="${pg.pageNum }">
				<input type="hidden" name="amount" value="${pg.amount }">
				<input type="hidden" name="type" value="${pg.type }">
				<input type="hidden" name="keyword" value="${pg.keyword }">
			</form>
			
		</div>
	</div>
	
	<%@include file="../includes/footer.jsp" %>
	
</body>
</html>