<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" href="/resources/css/base/jquery-ui.css" />
	<link rel="stylesheet" href="/resources/css/style.css" />
	<!-- JS -->
	<script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.cookie.min.js"></script>	
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<script type="text/javascript" src="/resources/js/home.js"></script>
	<script type="text/javascript">
		$(function() {
			
			var searchForm = $("#searchForm");
			
			$("#searchForm button").on("click", function(e) {
				
				if(!searchForm.find("option:selected").val()) {
					alert("검색종류를 선택하세요.");
					return false;
				}
				
				if(!searchForm.find("input[name='keyword']").val()) {
					alert("키워드를 입력하세요.");
					return false;
				}
				
				searchForm.find("input[name='pageNum']").val(1);
				e.preventDefault();
				
				searchForm.submit();
				
			});
			
		});
	</script>
</head>
<body>

<!-- header -->
<div class="container">
	<header class="header wrapper">
	
	<div class="sub-nav-bar">
		<ul class="sub-menu">
			<li><a href="#"><span>Login</span></a></li><!-- 마이페이지/관리자페이지 -->
			&nbsp;|&nbsp;
			<li><a href="#"><span>Sign Up</span></a></li><!-- 로그아웃 -->
		</ul>
	</div>
	
	<div class="mobile-menu">
		<p class="mobile-menu-open">
	   		<button>
	   			<span class="blind">메뉴열기</span>
	   			<span></span>
	   			<span></span>
	   			<span></span>
	   		</button>
	   	</p>
	   	<div class="mobile-menu-wrap">
	   		<p class="mobile-menu-close">
		   		<button>
		   			<span class="blind">메뉴닫기</span>
		   			<span></span>
		   			<span></span>
		   			<span></span>
		   		</button>
	   		</p>
	   		<ul>
	   			<li><a href="#"><span>Login</span></a></li>
				<li><a href="#"><span>Sign Up</span></a></li>
				<li><a href="#">영화정보</a></li>
				<li><a href="/board/list">커뮤니티</a></li>
				<li><a href="#">ABOUT</a></li>
	   		</ul>
	   	</div>
	</div>
	
		<div class="nav-bar">
			<h1><a href="/index"><img class="logo" alt="킹무비 홈" src="/resources/images/logo2.svg"></a></h1>
			<nav id="nav-menu" class="nav-menu">
				<div id="menu-animate">
					<ul class="main-nav">
						<li><a href="#">영화정보</a></li>
						<li><a href="/board/list">커뮤니티</a></li>
						<li><a href="#">ABOUT</a></li>
						<li><img class="search-logo" alt="검색" src="/resources/images/search.png" style="cursor: pointer"></li>
					</ul>
					
					<div id="slide-menu" class="slide-menu">
						<ul>
							<li><a href="#">세부정보1</a></li>
							<li></li>
							<li><a href="#">세부정보2</a></li>
							<li></li>
							<li><a href="#">세부정보3</a></li>
						</ul>
						<ul>
							<li><a href="/board/list">게시판</a></li>
							<li></li>
							<li><a href="#">Q n A</a></li>
							<li></li>
							<li><a href="#">공지사항</a></li>
						</ul>
						<ul>
							<li><a href="#">킹무비 소개</a></li>
							<li></li>
							<li><a href="#">CONTACT</a></li>
							<li></li>
							<li><a href="#">기능 목록</a></li>
						</ul>
						<ul>
							<li></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		
			<div class="search-wrap">
				<div class="search">
				<form id="searchForm" action="/board/list" method="get">
					<select name="type" class="search-type">
						<option value="" ${pageMaker.pg.type == null ? 'selected' : '' }>--</option>
						<option value="T" ${pageMaker.pg.type eq 'T' ? 'selected' : '' }>제목</option>
						<option value="C" ${pageMaker.pg.type eq 'C' ? 'selected' : '' }>내용</option>
						<option value="W" ${pageMaker.pg.type eq 'W' ? 'selected' : '' }>작성자</option>
						<option value="TC" ${pageMaker.pg.type eq 'TC' ? 'selected' : '' }>제목 or 내용</option>
						<option value="TW" ${pageMaker.pg.type eq 'TW' ? 'selected' : '' }>제목 or 작성자</option>
						<option value="TWC" ${pageMaker.pg.type eq 'TWC' ? 'selected' : '' }>제목 or 내용 or 작성자</option>
					</select>
					<input class="search-input" type="text" name="keyword" value="${pageMaker.pg.keyword }" />
					<input type="hidden" name="pageNum" value="${pageMaker.pg.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.pg.amount }">
					<button class="search-btn">검색</button>
				</form>
				</div>
			</div>
		
	</header>
</div>

</body>
</html>