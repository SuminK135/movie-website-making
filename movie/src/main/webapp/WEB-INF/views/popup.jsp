<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	* {margin: 0; padding: 0;}
	body{font-size: 12px;}
	input{vertical-align: middle;}
	#notice_wrap{
		width: 300px;
		position: absolute;
		left: 30px;
		top: 30px;
		box-shadow: 0 0 8px #000;
	}
	.closeWrap{
		background-color: #000;
		color: #fff;
		text-align: right;
		padding: 5px 10px;
	}
	.closeWrap button{
		margin-left: 20px;
		cursor: pointer;
	}
</style>
<meta charset="UTF-8">
<title>King Movie | Popup</title>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.cookie.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		if($.cookie("popup") == "none") {
			$("#notice-wrap").hide();
		}
		
		var $expChk = $("#expiresChk");
		$(".btnClose").on("click", closePop);
		
		function closePop() {
			if($expChk.is(":checked")) {
				$.cookie("popup", "none", {expires:3, path:"/"});
			}
			//$("#notice-wrap").fadeOut("fast");
			window.open('', '_self').close();
		}
		
	});
</script>
</head>
<body>
<!-- 	<p>
		<img src="images/popup1.jpg" usemap="#intro" alt="popup-test">
		<map name="intro" id="intro">
			<area shape="rect" coords="230,368,280,390" href="#" alt="close" onclick="window.close();" />
		</map>
	</p>
 -->
 
 	<div id="notice-wrap">
 		<img src="/resources/images/popup2.jpg" alt="popup-test" usemap="#intro">
 		<p class="closeWrap">
 			<input type="checkbox" name="expiresChk" id="expiresChk">
 			<label for="expiresChk">3일 동안 이 창 열지 않기</label>
 			<button class="btnClose">닫기</button>
 		</p>
 	</div>	
	
</body>
</html>