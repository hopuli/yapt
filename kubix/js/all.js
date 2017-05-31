
//	侧边栏
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
			"right": "500px",
			"transition": "ease .5s",
			"-webkit-transition": "ease .5s"
		});

		$(".laybg").css("display", "none");
		$('html').css({
			"overflow-y": "auto"
		});
	});
})
//	无缝滚动
window.onload = function() {
	var odiv = document.getElementById('div1');
	var oul = odiv.getElementsByTagName('ul')[0];
	var ali = oul.getElementsByTagName('li');
	var spa = -2;
	oul.innerHTML = oul.innerHTML + oul.innerHTML;
	oul.style.width = ali[0].offsetWidth * ali.length + 'px';

	function move() {
		if(oul.offsetLeft < -oul.offsetWidth / 2) {
			oul.style.left = '0';
		}
		if(oul.offsetLeft > 0) {
			oul.style.left = -oul.offsetWidth / 2 + 'px'
		}
		oul.style.left = oul.offsetLeft + spa + 'px';
	}
	var timer = setInterval(move, 30)

	odiv.onmousemove = function() {
		clearInterval(timer);
	}
	odiv.onmouseout = function() {
		timer = setInterval(move, 30)
	};
	document.getElementsByTagName('a')[0].onclick = function() {
		spa = -2;
	}
	document.getElementsByTagName('a')[1].onclick = function() {
		spa = 2;
	}
}

})
})