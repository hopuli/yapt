$(function() {
	//公共空间
	$.ajax({
		url: "http://58.246.52.102:3551/yapt/mng/imagetext/show",
		data: {
			table: '1'
		},
		dataType: "json",
		success: function(result) {
			var len = result.data;
			var path = "http://58.246.52.102:3551/yapt";
			var url = path + len[0].url;
			var page1Texts = $('#page1-ul');
			var html = "";
			var text = len[0].text;
			var text2 = len[0].text2;
			var text3 = len[0].text3;
			var text4 = len[0].text4;
			$('#page1').css("background-image", "url(" + url + ")");;
			html += "<li class='page1-txt-li1'>" + text + "</li><li class='page1-txt-f page1-text-mar'>" + text2 + "</li><li>" + text3 + "</li><li class='page1-txt-f'>​" + text4 + "</li>"
			page1Texts.html(html);
		}
	});
	// page2
	$.ajax({

		url: "http://58.246.52.102:3551/yapt/mng/imagetext/show",
		data: {
			table: '2'
		},
		dataType: "json",
		success: function(result) {
			var path = "http://58.246.52.102:3551/yapt";
			var len = result.data;
			var url = path + len[0].url;
			var page2Texts = $('#page2-ul');
			var html = "";
			var text = len[0].text;
			var text2 = len[0].text2;
			var text3 = len[0].text3;

			$('#page2').css("background-image", "url(" + url + ")");
			html += "<li class ='page2-we'> " + text + " </li><li> " + text2 + "</li> <li class = 'page2-small'> " + text3 + " </li>";

			page2Texts.html(html);

		}
	});
	//居住空间
	$.ajax({
		url: "http://58.246.52.102:3551/yapt/mng/imagetext/show",
		data: {
			table: '3'
		},
		dataType: "json",
		success: function(result) {
			var path = "http://58.246.52.102:3551/yapt";
			var len = result.data;

			var html = "";
			var page3Img = $(".page3-ul")
			var url1 = path + len[0].url;
			var url2 = path + len[1].url;
			var url3 = path + len[2].url;;
			html += "<li class='item active'><h1 class='text-center  common-font'>居住空间</h1>" + "<img src='" + url1 + "'/></li><li class='item'><h1 class='text-center  common-font'>居住空间</h1>" + "<img src='" + url2 + "'/></li><li class='item'><h1 class='text-center  common-font'>居住空间</h1>" + "<img src='" + url3 + "'/></li>"
			page3Img.html(html);

		}
	});
	//公共空间
	$.ajax({
		url: "http://58.246.52.102:3551/yapt/mng/imagetext/show",
		data: {
			table: '4'
		},
		dataType: "json",
		success: function(result) {
			var path = "http://58.246.52.102:3551/yapt";
			var len = result.data;
			var readRest = $(".read-rest");
			var html = "";
			for(var i = 0; i < 2; i++) {
				var url = path + len[i].url;
				var text1 = len[i].text;
				var text2 = len[i].text2;
				html += "<li class='col-lg-6 common-h col-md-6'><div class='boost-ac'><img class='boost' src='" + url + "' /></div><p>" + text1 + "</p><p class='color-3'>​" + text2 + "</p></li>";
			}

			readRest.html(html);

		}
	});
	$.ajax({
		url: "http://58.246.52.102:3551/yapt/mng/imagetext/show",
		data: {
			table: '4'
		},
		dataType: "json",
		success: function(result) {
			var path = "http://58.246.52.102:3551/yapt";
			var len = result.data;
			var enjoy = $(".enjoy");
			var html = "";
			for(var i = 2; i < len.length; i++) {
				var url = path + len[i].url;
				var text1 = len[i].text;
				var text2 = len[i].text2;
				html += "<li class='col-lg-4 common-h col-md-4'><div class='boost-ac1'><img class='boost' src='" + url + "' /></div><p>" + text1 + "</p><p class='color-3'>" + text2 + "</p></li>";
			}
			enjoy.html(html);
		}
	})

});
//brand
$.ajax({
	url: "http://58.246.52.102:3551/yapt/mng/imagetext/show",
	data: {
		table: '5'
	},
	dataType: "json",
	success: function(result) {
		var path = "http://58.246.52.102:3551/yapt";
		var len = result.data;
		var page4Foot = $(".page4-foot-inner");
		var html = "";
		for(var i = 0; i < len.length; i++) {
			var url = path + len[i].url;
			html += "<li class='col-lg-4 col-md-4'><img src='" + url + "'/></li>";
		}
		page4Foot.html(html);

	}
});
//第二个轮播
$.ajax({
	url: "http://58.246.52.102:3551/yapt/mng/imagetext/show",
	data: {
		table: '6'
	},
	dataType: "json",
	success: function(result) {
		var path = "http://58.246.52.102:3551/yapt";
		var len = result.data;

		var html = "";
		var page5Ul = $(".page5-ul")
		var url1 = path + len[0].url;
		var url2 = path + len[1].url;
		html += "<li class='item active'><img src='" + url1 + "' /></li><li class='item'><img src='" + url2 + "'  /></li>"
		page5Ul.html(html);
	}

});
//弄巢活动page6
$.ajax({

	url: "http://58.246.52.102:3551/yapt/mng/imagetext/show",
	data: {
		table: '7'
	},
	dataType: "json",
	success: function(result) {
		var path = "http://58.246.52.102:3551/yapt";
		var len = result.data;
		var url = path + len[0].url;
		var page6Texts = $('.page6-ul');
		var html = "";
		var text = len[0].text;
		var text2 = len[0].text2;
		var text3 = len[0].text3;
		$('#page6').css("background-image", "url(" + url + ")");
		html += "<li class='page6-fl'>" + text + "</li><li  class='page6-fs'>" + text2 + "</li><li  class='page6-fs       '>" + text3 + "</li>";
		page6Texts.html(html);

	}
});
//弄巢活动无缝滚动
$.ajax({
	url: "http://58.246.52.102:3551/yapt/mng/imagetext/show",
	data: {
		table: '8'
	},
	dataType: "json",
	success: function(result) {
		var path = "http://58.246.52.102:3551/yapt";
		var len = result.data;
		var html = "";
		var div1Ul = $(".div1-ul")
		for(var i = 0; i < len.length; i++) {
			var url = path + len[i].url;
			html += "<li><img src='" + url + "'/></li>"
		}
		div1Ul.html(html);
	}
});

