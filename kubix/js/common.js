//滚动监听
$(function() {
	//设置标杆
	var _line = parseInt($(window).height() / 13);
	$(window).scroll(function() {
		//滚动730px，左侧导航固定定位
		//							if ($(window).scrollTop()>0) {
		//								$('.side-ul').css({'position':'fixed','top':100})
		//							}else{
		//								$('.side-ul').css({'position':'','top':''})
		//							};
		$('.side-ul li').eq(0).addClass('active');
		//滚动到标杆位置,左侧导航加active
		$('.pages .page-scroll').each(function() {
			var _target = parseInt($(this).offset().top - $(window).scrollTop() - _line);
			var _i = $(this).index();
			if(_target <= 0) {
				$('.side-ul li').removeClass('active');
				$('.side-ul li').eq(_i).addClass('active');
			}
			//如果到达页面底部，给左侧导航最后一个加active
			else if($(document).height() == $(window).scrollTop() + $(window).height()) {
				$('.side-ul li').removeClass('active');
				$('.side-ul li').eq($('.pages .page-scroll').length - 1).addClass('active');
			}
		});
	});
	$('.side-ul li').click(function() {
		$(this).addClass('active').siblings().removeClass('active');
		var _i = $(this).index();
		$('body, html').animate({
			scrollTop: $('.pages .page-scroll').eq(_i).offset().top - _line
		}, 800);
	});
});
//侧边栏
$(function() {
	$("#side-btn").click(function() {
		//$("#sidebar").css("display", "block"); //show的display属性设置为block（显示）
		$('#sidebar').css('right', 0);
		$('.laybg').css('display', 'block')
		$('html').css({
			"overflow-y": "hidden"
		});
	})
	$('.remove').click(function() {
		$("#sidebar").css({
			"right": "-30%",
			"transition": "ease .5s",
			"-webkit-transition": "ease .5s"
		});

		$(".laybg").css("display", "none");
		$('html').css({
			"overflow-y": "auto"
		});
	})

});
//			icon动画
$(function() {
	$('.page1 .page6-inner .page1-icons li').mouseenter(function() {
		$(this).find('img').addClass('rotate360');
	}).mouseleave(function() {
		$(this).find('img').removeClass('rotate360');
	});

	//第二個lunbo
	$(function() {
		$('#carousel').carousel({
			interval: 2000
		})
	})
	//视差滚动
	$(function() {
		$(window).bind("scroll", checkScroll);

		function checkScroll() {
			$(".page").each(function(index, elem) {
				var wh = $(window).height();
				var offh = $(this).offset().top;
				var h = $(this).height();
				var dis; //滚动的距离
				if(wh > offh) { //在第一屏
					dis = offh + h;
					sc = $(window).scrollTop();
					if(sc > dis) {
						return
					}
				} else { //不在第一屏
					dis = wh + h;
					sc = $(window).scrollTop() - offh + wh;
					if(sc < 0) {
						return
					}
				}
				var bfb = 1 - (sc / dis); //这一句是关键
				$(this).css("background-position", "0 " + bfb * 50 + "%");
			})
		}

	});
	//	无缝滚动
	$(function() {

		imgScroll.rolling({
			name: 'g2',
			width: '400px',
			height: '300px',
			direction: 'left',
			speed: 20,
			addcss: true
		});

	})
	

})