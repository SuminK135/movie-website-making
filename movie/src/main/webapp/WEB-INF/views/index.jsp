<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>킹무비 - King Movie | Home</title>
	<meta content="IE=Edge" http-equiv="X-UA-Compatible">
	<!-- 
	<meta name="description" content="King Movie, 영화 정보 공유 커뮤니티">
	<meta name="keywords" content="Movie, 영화, 영화 사이트, King Movie, 영화 정보 공유 커뮤니티">	
	<meta property="og:type" content="website">
	<meta property="og:title" content="King Movie">
	<meta property="og:description" content="King Movie, 영화 정보 공유 커뮤니티">
	<meta property="og:url" content="">
	<meta property="og:image" content="">
	<link rel="canonical" href="">
	 -->
	<!-- viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet" />
	<!-- Favicon -->
	<link rel="icon" type="image/png" href="/resources/images/crown.png" />
	<!-- CSS -->
	<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css" />
	<link rel="stylesheet" href="/resources/css/base/jquery-ui.css" />
	<link rel="stylesheet" href="/resources/css/jquery.bxslider.css" />
	<link rel="stylesheet" href="/resources/css/style.css" />
	<style type="text/css">

	</style>
	<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<script type="text/javascript" src="/resources/js/home.js"></script>	
	<script type="text/javascript">
		$(function() {
			if($.cookie("popup") == "none") {
				return;
			} else {
				window.open("/popup", "popup", "width=300, height=377, left=300, top=50, scrollbars=no");
			}
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
						<li><a href="#"><img class="search-logo" alt="검색" src="/resources/images/search.png"></a></li>
					</ul>
					
					<div id="slide-menu" class="slide-menu">
						<ul>
							<li><a href="#">세부정보1</a></li>
							<li><a href="#">세부정보2</a></li>
							<li><a href="#">세부정보3</a></li>
						</ul>
						<ul>
							<li><a href="/board/list">게시판</a></li>
							<li><a href="#">QnA</a></li>
							<li><a href="#">공지사항</a></li>
						</ul>
						<ul>
							<li><a href="#">킹무비 소개</a></li>
							<li><a href="#">CONTACT</a></li>
							<li><a href="#">기능 목록</a></li>
						</ul>
						<ul>
							<li></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>

	</header>
</div>

<div id="home">

	<!-- 
	<div class="sub-nav-bar">
		<ul class="sub-menu">
			<li><a href="#">로그인</a></li>마이페이지 --><!-- 관리자페이지
			<li><a href="#">회원가입</a></li>로그아웃
		</ul>
	</div> -->
		
	<div class="home-content wrppaer">
		<h2 class="page-title">King Movie</h2>
		<p>최신 영화 정보를 무료로, 맘껏 즐기세요~!!</p>
		<a class="button" href="#"><span>둘러보기</span></a>
	</div>

</div>


<section id="title-group">

<div class="title container">

	<div class="title wrapper no1">
	
	<div class="no1-btns">
		<div class="title">
			<h4 class="sub-title tab1"><a href="#" class="on">공지사항</a></h4>
		</div>
		
		<div class="title">
			<h4 class="sub-title tab2"><a href="#">커뮤니티</a></h4>	
		</div>
	</div>
	<hr>
		<div class="tab-container-1">
				<ul class="notice-ul">
					<a href="#"><li>공지사항입니다.<span>2021.02.01</span></li></a>
					<a href="#"><li>공지사항입니다.<span>2021.02.01</span></li></a>
					<a href="#"><li>공지사항입니다.<span>2021.02.01</span></li></a>
					<a href="#"><li>공지사항입니다.<span>2021.02.01</span></li></a>
					<a href="#"><li>공지사항입니다.<span>2021.02.01</span></li></a>
				</ul>
				<a class="title-linked" href="#">> 더보기</a>
			</div>
		
		<!-- 
		<div class="tab-container-2">
				<ul class="notice-ul">
					<li><a class="tab-p1">커뮤니티</a><span>2021.02.01</span></li>
					<li><a class="">커뮤니티</a><span>2021.02.01</span></li>
					<li><a class="">커뮤니티</a><span>2021.02.01</span></li>
				</ul>
				<a class="title-linked" href="#">> 더보기</a>
			</div>
		 --> 
	</div>
	
	<div class="title wrapper no2">
		
		<div id="gallery-banner" class="title">
	    	<ul class="slide_gallery">
	        	<li><img src="/resources/images/slide1.jpg" alt="사진1"></li>
	            <li><img src="/resources/images/slide2.jpg" alt="사진2"></li>
	        </ul>
		</div>
		
	</div>
	
</div>
	
</section>
<!--
<section id="contact">
	<div class="contact wrapper">
		<h1>CONTACT</h1>
		<div class="contact-form">
			<form action="#">
					<div class="contact-1">
						<input type="text" id="name" name="your-name">
						<input type="email" id="email" name="your-email">
					</div>
					<div class="contact-2">
						<input type="text" id="title" name="title">
					</div>
					<div class="contact-3">
						<textarea id="message" name="your-message"></textarea>
					</div>
					<input type="submit" class="button" value="전송">
			</form>
		</div>
	</div>
</section>
 -->
<section id="video">
	<div class="video wrapper">
		<div class="video-box">
			<h1>PREVIEW</h1>
			<iframe src="https://www.youtube.com/embed/C2_e4qT1onA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		<!-- <div class="video-box">
			<h3>예고편</h3>
			<iframe width="300" height="200" src="https://www.youtube.com/embed/ioGnbnIAlJk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		<div class="video-box">
			<h3>예고편</h3>
			<iframe width="300" height="200" src="https://www.youtube.com/embed/ioGnbnIAlJk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div> -->
	</div>
</section>

<!-- footer -->
<!-- <footer>
	<div class="wrapper">
		<p>&copy Beta Test for The Web Project</p>
	</div>	
</footer> -->

<%@include file="./includes/footer.jsp" %>

</body>
</html>