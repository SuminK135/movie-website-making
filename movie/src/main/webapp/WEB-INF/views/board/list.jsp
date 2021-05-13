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
			
			checkAlert(result);
			
			history.replaceState({}, null, null);
			
			function checkAlert(result) {
				
				if(result === '' || history.state) {
					return;
				}
				
				if(parseInt(result) > 0) {
					alert("게시글 " + parseInt(result) + "번이 등록되었습니다.");
				}
				
				if(result == 'success') {
					alert("게시글이 삭제되었습니다.")
				}
				
			}
			
			//Paging
			var pagingForm = $("#pagingForm");
			
			console.log(pagingForm);
			
			$(".pg-button a").on("click", function(e) {
				
				e.preventDefault();
				
				console.log('click');
				
				pagingForm.find("input[name='pageNum']").val($(this).attr("href"));
				
				pagingForm.submit();
				
			});
			
			$(".move").on("click", function(e) {
				
				e.preventDefault();
				pagingForm.append("<input type='hidden' name='seq' value='"+$(this).attr("href")+"'>");
				pagingForm.attr("action", "/board/get");
				pagingForm.submit();
				
			});
			
			
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
						<div class="bold">총 <span class="txt_orange">${pageMaker.total }</span>건</div>
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
										<a class="move" href="${board.seq }"><img src="" alt="미리보기">&nbsp;${board.subject }</a>
										<c:if test="${board.wgap eq 0 }">
											&nbsp;<img src="/resources/images/icon_hot.gif" alt="HOT">
										</c:if>
									</td>
									<td><c:out value="${board.writer }"/></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.wdate }" /> </td>
									<td><c:out value="${board.hit }"/></td>
									<td>&nbsp;</td>
								</tr>
							</c:forEach>
						</table>
						
						<!-- 페이징 -->
						<form id="pagingForm" action="/board/list" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.pg.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.pg.amount }">
							<input type="hidden" name="type" value="${pageMaker.pg.type }">
							<input type="hidden" name="keyword" value="${pageMaker.pg.keyword }">
						</form>
				
						<div class="pages">
							<ul class="pagination">

								<c:if test="${pageMaker.prev }">
									<li class="pg-button prev"><a href="${pageMaker.startPage - 1 }">&lt;&lt;</a></li>
								</c:if>
								
								<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
									<li class="pg-button ${pageMaker.pg.pageNum == num ? "present" : "" }">
										<a href="${num }">${num }</a>
									</li>
								</c:forEach>
								
								<c:if test="${pageMaker.next }">
									<li class="pg-button next">
										<a href="${pageMaker.endPage + 1 }">&gt;&gt;</a>
									</li>
								</c:if>
								
								<li>
									<div class="align_right">
										<button type="button"
										class="btn_write btn_txt01" 
										style="cursor: pointer;" 
										onclick="location.href='/board/register'">글쓰기</button>
									</div>
								</li>
	
							</ul>
							
							<!-- <ul>
								<li>
									<div class="align_right">
										<button type="button"
										class="btn_write btn_txt01" 
										style="cursor: pointer;" 
										onclick="location.href='/board/register'">글쓰기</button>
									</div>
								</li>
							</ul> -->
							
						</div>
						<!-- //페이징 -->
						
					</div>	
					<!--//게시판-->
					
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