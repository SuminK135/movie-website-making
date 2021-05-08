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
	<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
	<link rel="stylesheet" href="/resources/css/base/jquery-ui.css" />
	<link rel="stylesheet" href="/resources/css/board_register.css" />
	<style type="text/css"></style>
	<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
	window.onload = function() {
		document.getElementById("boardsubmit").onclick = function() {
			
			if(document.removefrm.password.value.trim() == "") {
				alert('비밀번호를 입력하셔야 합니다.');
				return false;				
			}
			
			var pw = '<c:out value="${board.password}"/>';
			
			if(document.removefrm.password.value != pw) {
				alert('비밀번호가 틀립니다.');
				return false;				
			}
			
			document.removefrm.submit();
		};
	};
	</script>
</head>
<body>

	<%@include file="../includes/header.jsp" %>
	<hr>
	
	<div class="board-register wrapper">
		<div class="register">
		
			<form action="/board/remove" method="post" name="removefrm">
			
			<input type="hidden" name="seq" value="${board.seq }">
			<input type="hidden" name="pageNum" value="${pg.pageNum }">
			<input type="hidden" name="amount" value="${pg.amount }">
				
				<div class="contents_sub">
				<!--table-->
					<div class="board_write">
						<table>
						<tr>
							<th class="top">글쓴이</th>
							<td class="top" colspan="3">${board.writer }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">${board.subject }</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td colspan="3"><input type="password" name="password" value="" class="board_write_input_100"/></td>
						</tr>
						</table>
						
					</div>
		
					<div class="btn_area">
						<div class="align_left">			
							<input type="button" 
									value="보기" 
									class="btn_list btn_txt02" 
									style="cursor: pointer;" 
									onclick="history.back()" />
						</div>
						<div class="align_right">			
							<input type="button" 
									value="삭제" 
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