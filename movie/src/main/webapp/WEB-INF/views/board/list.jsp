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
	<!-- <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css"> -->
	<link rel="stylesheet" href="/resources/css/base/jquery-ui.css" />
	<link rel="stylesheet" href="/resources/css/board_list.css" />
	<style type="text/css"></style>
	<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
	
	</script>
</head>
<body>

	<%@include file="../includes/header.jsp" %>

	<div id="top-img"></div>

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
							<tr>
								<td>&nbsp;</td>
								<td>1</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="/resources/images/icon_hot.gif" alt="HOT"></td>
								<td>writer</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>2</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="" alt="HOT"></td>
								<td>writer</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>3</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="" alt="HOT"></td>
								<td>writer</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>4</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="" alt="HOT"></td>
								<td>writer</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>5</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="" alt="HOT"></td>
								<td>writer</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>6</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="" alt="HOT"></td>
								<td>writer</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>7</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="" alt="HOT"></td>
								<td>writer</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>8</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="" alt="HOT"></td>
								<td>writer</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>9</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="" alt="HOT"></td>
								<td>writer</td>
								<td>2017-01-31</td>
								<td>6</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>10</td>
								<td class="left"><a href="board_view1.jsp"><img src="" alt="미리보기">&nbsp;게시글 제목입니다.</a>&nbsp;<img src="" alt="HOT"></td>
								<td>writer</td>
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