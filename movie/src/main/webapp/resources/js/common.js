(function(win, $) {

	var $html = $("html");
	
	var deviceSize = {
		pc: 1009,
		tablet: 801,
		mobile: 800
	};
	
	function scrollShowHide(status) {
		$html.css({"overflow-y":status});
		return $html.width();
	}
	
	var sc_w1 = scrollShowHide("hidden"),
		sc_w2 = scrollShowHide("scroll"),
		sc_w3 = sc_w1 - sc_w2;
		
	if(sc_w3 > 0) {
		deviceSize.pc = deviceSize.pc - sc_w3;
		deviceSize.tablet = deviceSize.tablet - sc_w3;
		deviceSize.mobile = deviceSize.mobile - sc_w3;
	}
	
	$(win).on("resize", function() {
	
		var w_size = $(win).width();

		if(w_size >= deviceSize.pc && !$("html").hasClass("pc")) {

			$html.removeClass("mobile tablet").addClass("pc");
			scrollShowHide("scroll");

		} else if(w_size < deviceSize.pc && w_size >= deviceSize.tablet && !$("html").hasClass("tablet")) {

			$html.removeClass("mobile pc").addClass("tablet");
			scrollShowHide("scroll");

		} else if(w_size <= deviceSize.mobile && !$html.hasClass("mobile")) {

			$html.removeClass("pc tablet").addClass("mobile");
			var menu_pos = parseInt($(".mobile-menu-wrap").css("left"));
				if(menu_pos >= 0) {
					scrollShowHide("hidden");
				}

		}
	});
	
	
	$(function() {
	
		$(win).trigger("resize");
		
		$(document).on("mouseover", ".pc .main-nav li:not(:last), .tablet .main-nav li:not(:last)", menuSlide);

		function menuSlide() {
			$("#slide-menu").show();
		}
		
		$(document).on("mouseleave", ".pc .nav-menu, .tablet .nav-menu", slideLeave);
		
		function slideLeave() {
			$("#slide-menu").hide();
		}
		
		$(".mobile-menu-open button").on("click", function() {
			$(".mobile-menu-wrap").animate({"left":0}, 200);
			scrollShowHide("hidden");
		});
		
		$(".mobile-menu-close button").on("click", function() {
			$(".mobile-menu-wrap").animate({"left":"-1000px"}, 200);
			scrollShowHide("scroll");
		});

	});


	$(function() {
		$(".sub-menu span").on({
			"mouseover" : function( ) {
				$(this).css({"color": "#04d"}).css({"text-decoration":"underline"});
			},
			"mouseout" : function( ) {
				$(this).css({"color":"black"}).css({"text-decoration":"none"});
			}
		});
	});
	
}(window, jQuery));