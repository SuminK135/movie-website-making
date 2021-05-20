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
	<script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			var seqValue = '<c:out value="${board.seq}"/>';
			//var replyT = $("#reply-table > tbody:first");
			
			showList(1);
			// 댓글 가져오기
			function showList(page) {
				
				replyService.getList({seq : seqValue, page : page||1 }, function(list) {
					
					var str = "";
					
					if(list == null || list.length == 0) {
						$("#reply-table > tbody:first").append("");;
						//replyT.html("");
						return;
					}
					
					for(var i=0, len=list.length||0; i<len; i++) {
						str += "<tr class='reply-tr1'>";
						str += "	<td data-rno='"+list[i].rno+"'>";
						str += "		<strong>" + list[i].writer + " (" + replyService.displayTime(list[i].mdate) + ")</strong>";
						str += "		<br>"
						str += "		"+ list[i].reply +"";
						str += "	</td>";		
						str += "</tr>";
					}
					$("#reply-table > tbody:first").append(str);
					
				});
				
			}
			
			// 댓글 등록하기
			var replyRegisterBtn = $("#replyRegisterBtn");
			var replyWriter = $("#replyWriter");
			var replyContent = $("#replyContent");
			
			replyRegisterBtn.on("click", function(e) {
				
				var reply = {
					writer : replyWriter.val(),
					reply : replyContent.val(),
					seq : seqValue
				};
				
				replyService.add(reply, function(result) {
					
					//alert(result);
					if(result) {
						alert("댓글이 등록되었습니다.");
					}
					replyWriter.val("");
					replyContent.val("");
					
					location.reload();
				
				});
				
			});
			
			// 댓글 수정하기
			
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			var result = '<c:out value="${result}"/>';
			
			checkAlert(result);
			
			history.replaceState({}, null, null);
			
			function checkAlert(result) {
				
				if(result == '' || history.state) {
					return;
				}
				
				if(result == 'success') {
					alert("게시글 수정이 완료되었습니다.")
				}
			}
			
			var moveListPaging = $("#moveListPaging");
			
			$(".btn_list").on("click", function(e) {
				
				e.preventDefault();
				
				moveListPaging.submit();
				
			});
			
			var modifyPaging = $("#modifyPaging");
			
			$(".modify").on("click", function(e) {
				
				e.preventDefault();
				
				modifyPaging.submit();
				
			});
			
			var removePaging = $("#removePaging");
			
			$(".remove").on("click", function(e) {
				
				e.preventDefault();
				
				removePaging.submit();
				
			});

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
				
				<table class="reply-table" id="reply-table">
					<tbody>
						<!-- <tr class="reply-tr1">
							<td data-rno=''>
								<strong>작성자 (2020-05-05)</strong>
								<br>
								내용
							</td>
						</tr> -->
					</tbody>
						<tr class="reply-tr2">
							<td>
								글쓴이&nbsp;&nbsp;<input type="text" id="replyWriter">
							</td>
						</tr>
						<tr class="reply-tr3">
							<td>
								<textarea rows="4" id="replyContent"></textarea>
								<input type="button" 
									   value="댓글달기"
									   id="replyRegisterBtn"
									   class="btn_write" 
									   style="cursor: pointer;" />
							</td>
						</tr>
				</table>
				
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
								class="btn_write btn_txt01 modify" 
								style="cursor: pointer;" 
								onclick="location.href='modify'" />
						<input type="button" 
								value="삭제"
								id="delete_modal"
								class="btn_write btn_txt01 remove" 
								style="cursor: pointer;" 
								onclick="location.href='remove'" />
					</div>	
				</div>
			
				<form id="moveListPaging" action="/board/list" method="get">
					<input type="hidden" name="pageNum" value="${pg.pageNum }">
					<input type="hidden" name="amount" value="${pg.amount }">
					<input type="hidden" name="type" value="${pg.type }">
					<input type="hidden" name="keyword" value="${pg.keyword }">
				</form>
					
				<form id="modifyPaging" action="/board/modify" method="get">
					<input type="hidden" name="seq" value="${board.seq }">
					<input type="hidden" name="pageNum" value="${pg.pageNum }">
					<input type="hidden" name="amount" value="${pg.amount }">
					<input type="hidden" name="type" value="${pg.type }">
					<input type="hidden" name="keyword" value="${pg.keyword }">
				</form>
					
				<form id="removePaging" action="/board/remove" method="get">
					<input type="hidden" name="seq" value="${board.seq }">
					<input type="hidden" name="pageNum" value="${pg.pageNum }">
					<input type="hidden" name="amount" value="${pg.amount }">
					<input type="hidden" name="type" value="${pg.type }">
					<input type="hidden" name="keyword" value="${pg.keyword }">
				</form>
				
			</div>
			
		</div>
		
	</div>
	
	<%@include file="../includes/footer.jsp" %>

</body>
<!-- 	<script type="text/javascript">
		$(document).ready(function() {
			
			console.log("==========");
			console.log("JS TEST");
			
			var seqValue = '<c:out value="${board.seq}"/>';
			
			replyService.add(
				{ reply: "JS Test", 
				  writer: "Tester", 
				  seq: seqValue
				},
				function(result) {
					alert("RESULT: " + result);
				}	
			);
			
			replyService.getList({seq:seqValue, page:1}, function(list) {
				for(var i=0, len=list.length||0; i<len; i++) {
					console.log(list[i]);
				}
			});
			
			reply remove test
			replyService.remove(20, function(count) {
				
				console.log(count);
				
				if(count === "success") {
					alert("REMOVED");
				}
				
			}, function(err) {
				alert('REMOVE REPLY ERROR....');
			});
			
			reply modify test
			replyService.update({
				rno : 19,
				seq : seqValue,
				reply : "Modified Reply....."
			}, function(result) {
				alert("댓글 수정 완료");
			});
			
			get test : 10번 댓글 가져오기
			replyService.get(10, function(data) {
				console.log(data);
			});
			
		});
	</script> -->
</html>