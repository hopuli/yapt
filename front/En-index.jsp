<%@page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<% String sysSrc=request.getContextPath();  %>
<html>
	<head>
		
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,user-scalable=yes" />
		<link rel="stylesheet" type="text/css" href="${sysSrc}/front/css/reset.css"/>
		<link href="${sysSrc}/front/css/flickerplate.css"  type="text/css" rel="stylesheet">
		<link rel="stylesheet" href="${sysSrc}/front/css/indexyw.css" />
		<link rel="stylesheet" type="text/css" href="${sysSrc}/front/css/zz.css"/>
		<link rel="stylesheet" href="${sysSrc}/front/css/banner.css" />
		<link rel="shortcut icon" type="image/x-icon" href="${sysSrc}/front/img/yw-logo.png" media="screen" />
		<title>China-flame</title>
	</head>
	<body class="no-cache">

			

			      
					   <video width="100%" poster="${sysSrc}/front/img/banner1.png" autoplay="autoplay"  muted="muted"
						preload="none" controls="controls" class="video">
							<source src="${sysSrc}${comInfo.videourl}"/>
						</video>
			       

<div class="header">

	<div class="header-title">
		<ul>
			<c:forEach items="${menus }" var="menu">
			<li><a href="${sysSrc}${menu.url}">
				<p>${menu.englishname }</p>
			</a></li>
			</c:forEach>
			<div class="clearfix">	
			</div>
		</ul>
	</div>
</div>

<!--about-->
<div class="about">
	<div class="about-content">
		<div class="about-title">
			<img src="${sysSrc}/front/img/about.png"><img src="${sysSrc}/front/img/about-.png">
		</div>
		<div class="about-left">
			
			<div class="logo"><img src="${sysSrc}${comInfo.logo}"></div>
			<div class="logo-left">
				<p>
				<strong>${comInfo.name }</strong>
				<span>${comInfo.fullname }</span> </i><br>
					${comInfo.introduction }<br>
				</p>
			</div>
			
			<div class="clearfix"></div>
		</div>
		<div class="about-right">
			<h2>Company Information</h2>
			<div class="ywewm"><img src="${sysSrc}${comInfo.qrcode}"/></div>
			<table>
				<tr>
					<td>ADD:</td><td>${comInfo.address }</td>
				</tr>
				<tr>
					<td>TEL:</td><td>${comInfo.telephone }</td>
				</tr>
				<tr>
					<td>WEB:</td><td>${comInfo.weburl }</td>
				</tr>
			</table>
		</div>
	</div>
			<div class="clearfix"></div>
</div>

<!--product line-->
<div class="product-line">
	<div class="product-content">
			<div class="product-title">
				<img src="${sysSrc}/front/img/ourbusiness.png"><span></span><img src="${sysSrc}/front/img/about-.png" width="650px">
			</div>
			<div class="product-li">
				<ul>
					<c:forEach items="${busInfo }" var="bus">
					<li><a href="${sysSrc}${bus.url}">
						<img src="${sysSrc}${bus.pimg}" class="product-left">
						<div class="product-right">
							<div class="product-right-top">
								<i><img src="${sysSrc}${bus.bimg}"></i> <span>${bus.title}</span>
							</div>
							<p>
								${bus.content}

							</p>
						</div>
					</a></li>
					</c:forEach>
				</ul>
			</div>
	</div>

</div>

<!--case-->
<div class="aboutthegroup">
	<div class="aboutthegroup-content">
		<div class="aboutthegroup-title">
			<img src="${sysSrc}/front/img/aboutthegroup.png"><span></span><img src="${sysSrc}/front/img/about-.png" width="525">
		</div>
		<div class="aboutthegroup-article">
			${groupInfo.content }
		</div>
		<div class="aboutthegroup-li">
			<ul>
				<c:forEach items="${groupInfo.gimgs }" var="gimg">
					<li><a href="javascript:void(0)">
						<img src="${sysSrc}${gimg.url}">
						<em>${gimg.module }</em>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	
	</div>
</div>

<!--history-->
<div class="tower">
	<div class="tower-content">
		<div class="tower-title">
			<img src="${sysSrc}/front/img/towethefuture.png"><span></span><img src="${sysSrc}/front/img/about-.png" width="480">
		</div>
		<div class="tower-main"> 
			<div class="tower-img">
				<img src="${sysSrc}${futureInfo.imgurl}">
			</div>
			<div class="tower-article">
				${futureInfo.content }
			</div>
			<div class="clearfix">
				
			</div>
		</div>
	</div>
</div>

<!--footer-->
<div class="footer">
	<div class="footer-content">
			${comInfo.copyright }
	</div>
</div>
	
	
<script type="text/javascript" src="${sysSrc}/front/js/jquery-1.11.1.min.js" ></script>
<script src="${sysSrc}/front/js/jquery-finger-v0.1.0.min.js" type="text/javascript"></script>
<script src="${sysSrc}/front/js/modernizr.custom.63321.js"></script>
<script type="text/javascript" src="${sysSrc}/front/js/unslider.min.js" ></script>
<script>
$(document).ready(function(){
$('.flicker-example').flicker();
 $(".aboutthegroup li").hover(function() {
  $(this).find("em").stop().animate({opacity: "show", top: "0"}, "fast");
 }, function() {
  $(this).find("em").stop().animate({opacity: "hide", top: "-240"}, "fast");
 });

});

</script>
<script>

$(document).ready(function(e) {

	  //é¡¶é¨è½®æ­å¾
    var unslider04 = $('#b04').unslider({
		speed:1000,
		delay:2000,
		dots: true,
		keys: false,
		fluid: true
	}),
	data04 = unslider04.data('unslider');
	$('.unslider-arrow04').click(function() {
        var fn = this.className.split(' ')[1];
        data04[fn]();
  });
});
</script>
<script>
	if (isSafari()) {
$(window).bind("pageshow", function (event) {
if (event.originalEvent.persisted && $('body').hasClass("no-cache")) {
document.body.style.display = "none";
window.location.reload();
}
});
}

function isSafari() {
if (navigator.userAgent.indexOf("Safari") > -1) {
return true;
}
return false;
}
</script>
	</body>
</html>
