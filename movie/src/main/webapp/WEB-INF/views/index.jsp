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
	<meta name="description" content="King Movie, 영화 정보 공유 커뮤니티">
	<meta name="keywords" content="Movie, 영화, 영화 사이트, King Movie, 영화 정보 공유 커뮤니티">	
	<meta property="og:type" content="website">
	<meta property="og:title" content="King Movie">
	<meta property="og:description" content="King Movie, 영화 정보 공유 커뮤니티">
	<meta property="og:url" content="">
	<meta property="og:image" content="">
	<link rel="canonical" href="">
	<!-- viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet" />
	<!-- Favicon -->
	<link rel="icon" type="image/png" href="/resources/images/crown.png" />
	<!-- CSS -->
	<!--<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css" />-->
	<link rel="stylesheet" href="/resources/css/base/jquery-ui.css" />
	<link rel="stylesheet" href="/resources/css/jquery.bxslider.css" />
	<link rel="stylesheet" href="/resources/css/style.css" />
</head>
<body>
<!-- header -->
<%@include file="./includes/header.jsp" %>

<div id="home">
		
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

<section id="video">
	<div class="video wrapper">
		<div class="video-box">
			<h1>PREVIEW</h1>
			<iframe src="https://www.youtube.com/embed/C2_e4qT1onA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	</div>
</section>

<%@include file="./includes/footer.jsp" %>

</body>
</html>