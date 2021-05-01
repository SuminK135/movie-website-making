<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<link rel="stylesheet" href="/resources/css/board_get.css" />
	<style type="text/css"></style>
	<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			var result = '<c:out value="${result}"/>';
			
			checkModal(result);
			
			history.replaceState({}, null, null);
			
			function checkModal(result) {
				
				if(result == '' || history.state) {
					return;
				}
				
				if(result == 'success') {
					alert("게시글 수정이 완료되었습니다.")
				}
			}
			
		});
	</script>
<title>Insert title here</title>
</head>
<body>

	<%@include file="../includes/header.jsp" %>
	<hr>
	
	<div class="board-get wrapper">
		<div class="get">
			
			<div class="contents_sub">
				<div class="board_get">
					<table>
						<tr>
							<th width="10%">제목</th>
							<td width="60%">${board.subject }</td>
							<th width="10%">등록일</th>
							<td width="20%"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.wdate }"/></td>
						</tr>
						<tr>
							<th>글쓴이</th>
							<td>${board.writer }</td>
							<th>조회</th>
							<td>${board.hit }</td>
						</tr>
						<tr>
							<td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%">
								<div id="bbs_file_wrap" align="left">
									<div>
										<img src="./upload/" width="550" onerror="" /><br />
									</div>
								</div>
								<br>
								<div style="white-space: pre;">${board.content }</div>
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
								value="수정" 
								class="btn_write btn_txt01" 
								style="cursor: pointer;" 
								onclick="location.href='modify?seq=${board.seq }'" />
						<input type="button" 
								value="삭제" 
								class="btn_write btn_txt01" 
								style="cursor: pointer;" 
								onclick="location.href='delete?seq=${board.seq }'" />
					</div>	
				</div>
				
			</div>
			
		</div>
	</div>
	
	<%@include file="../includes/footer.jsp" %>

</body>
</html>