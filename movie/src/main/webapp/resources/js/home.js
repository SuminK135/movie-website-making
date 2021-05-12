$(function() {

	$(".slide_gallery").bxSlider({
		auto: true,
		autoControls: false,
		stopAutoOnClick: false,
		pager: false,
		pause: 2000,
		//slideWidth: 350
		//adaptiveHeight: 350
		//slideMargin: 80
		//slideHeight: 250
	});
	
	
	if($.cookie("popup") == "none") {
		return;
	} else {
		window.open("/popup", "popup", "width=300, height=377, left=300, top=50, scrollbars=no");
	}
	

});