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
	<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
	<link rel="stylesheet" href="/resources/css/base/jquery-ui.css" />
	<link rel="stylesheet" href="/resources/css/board.css" />
	<style type="text/css"></style>
	<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
	
	</script>
</head>
<body>

	<%@include file="../includes/header.jsp" %>

	<div id="top-img"></div>

	<div class="board wrapper">
		<div id="board-list" class="board-list">
			<!-- 상단 디자인 -->
			<div class="con_title">
				<h3>게시판</h3>
				<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
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
								<th width="3%">&nbsp;</th>
								<th width="5%">번호</th>
								<th>제목</th>
								<th width="10%">글쓴이</th>
								<th width="17%">등록일</th>
								<th width="5%">조회</th>
								<th width="3%">&nbsp;</th>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>1</td>
								<td class="left"><a href="board_view1.jsp"><img src="../../images/icon_hot.gif" alt="미리보기">&nbsp;adfs</a>&nbsp;<img src="../../images/icon_hot.gif" alt="HOT"></td>
								<td>asdfa</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>1</td>
								<td class="left"><a href="board_view1.jsp"><img src="../../images/icon_hot.gif" alt="미리보기">&nbsp;adfas</a>&nbsp;<img src="../../images/icon_hot.gif" alt="HOT"></td>
								<td>asdfa</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>	
					<!--//게시판-->
					<div class="align_right">
						<button type="button" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'">글쓰기</button>
					</div>
				</div>
			</div>
		<!--//하단 디자인 -->
		</div>
		
		<aside>
			<h3>커뮤니티</h3>
			<ul>
				<li>게시판</li>
				<li>QnA</li>
				<li>공지사항</li>
			</ul>
			<h3>게시판 소개</h3>
			<p>
				누구나 자유롭게 토론할 수 있는 커뮤니티 게시판입니다.
			</p>
		</aside>
		
	</div>

	<%@include file="../includes/footer.jsp" %>

</body>
</html>