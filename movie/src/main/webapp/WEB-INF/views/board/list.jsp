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
	<!-- <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css"> -->
	<link rel="stylesheet" href="/resources/css/base/jquery-ui.css" />
	<link rel="stylesheet" href="/resources/css/board_list.css" />
	<style type="text/css"></style>
	<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			var result = '<c:out value="${result}"/>';
			
			checkModal(result);
			
			function checkModal(result) {
				
				if(result === '') {
					return;
				}
				
				if(parseInt(result) > 0) {
					alert("게시글 " + parseInt(result) + "번이 등록되었습니다.");
				}
				
			}
			
		});
	</script>
</head>
<body>

	<%@include file="../includes/header.jsp" %>

	<hr>

	<div class="board wrapper" id="for-order">
	
		<div id="board-list" class="board-list">
			<!-- 상단 디자인 -->
			<div class="con_title">
				<!-- <h3>게시판</h3> -->
				<p>HOME &gt; 커뮤니티 &gt; <strong>게시판</strong></p>
			</div>
			<div class="con_txt">
				<div class="contents_sub">
					<div class="board_top">
						<div class="bold">총 <span class="txt_orange">1</span>건</div>
					</div>
					<!--게시판-->
					<div class="board">
						<table>
							<tr>
							<!-- 60% -->
								<th width="1%">&nbsp;</th>
								<th width="7%">번호</th>
								<th>제목</th>
								<th width="12%">글쓴이</th>
								<th width="19%">등록일</th>
								<th width="7%">조회</th>
								<th width="1%">&nbsp;</th>
							</tr>
							<c:forEach items="${list }" var="board">
								<tr>
									<td>&nbsp;</td>
									<td><c:out value="${board.seq }"/></td>
									<td class="left">
										<a href="/board/get?seq=${board.seq }"><img src="" alt="미리보기">&nbsp;<c:out value="${board.subject }"/></a>
										&nbsp;
										<img src="/resources/images/icon_hot.gif" alt="HOT">
									</td>
									<td><c:out value="${board.writer }"/></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.wdate }" /> </td>
									<td><c:out value="${board.hit }"/></td>
									<td>&nbsp;</td>
								</tr>
							</c:forEach>
						</table>
					</div>	
					<!--//게시판-->
					<div class="align_right">
						<button type="button" 
								class="btn_write btn_txt01" 
								style="cursor: pointer;" 
								onclick="location.href='/board/register'">글쓰기</button>
					</div>
				</div>
			</div>
		<!--//하단 디자인 -->
		</div>
		
		<aside>
			<h3 class="side-title">커뮤니티</h3>
			<ul class="side-menu">
				<li><a href="">게시판</a></li>
				<li><a href="">QnA</a></li>
				<li><a href="">공지사항</a></li>
			</ul>
			<h3 class="side-title">게시판 소개</h3>
			<p>
				누구나 자유롭게 소통하는 커뮤니티 게시판입니다.
			</p>
		</aside>
		
	</div>

	<%@include file="../includes/footer.jsp" %>

</body>
</html>