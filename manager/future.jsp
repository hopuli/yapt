<%@page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<html>
	<head>
		<style type="text/css">
			a {
				display:block;
				width:100px;
				height:22px;
				border:10px solid #CCC;
				background:#FFF;
			}
		</style>
	</head>
	<body>
		<h3>Future维护</h3>
		<div style="float:left;margin-right: 60px">
			<form action="${sysSrc}/mng/future/updateFuture.do" method="post" enctype="multipart/form-data" >
				<table id="future_table">
					<tr><td>图片：</td>
					<td><div id="show_img"><img style="width: 200;height: 200" src="${sysSrc}${futureInfo.imgurl }"/></div>
					<input id="btn_file" onclick="uploadImg()" name="imgFile" type="file"/>
					<input type="hidden" value="${futureInfo.imgurl }" name="imgurl"/>
					</td></tr>
					<tr><td>内容：</td>
					<td>
						<textarea name="content" rows="10" cols="80">${futureInfo.content }</textarea>
					</td></tr>
					<tr><td td colspan="4" style="text-align: center;"><span id="future_msg" style="color:red">&nbsp;${future_msg }&nbsp;</span> </td></tr>
					<tr style="cursor: pointer;height: 70"><td colspan="4" align="center" ><input style="clear: both;width: 70px;height: 30;font-size: 18px" type="submit" value="提交"/></td></tr>
				</table>
			</form>
		</div>
		
	</body>
<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#future_table").click(function(){
			$("#future_msg").html("&nbsp;&nbsp;");
		});
	});

	function uploadImg(img_index,id){
		document.getElementById("btn_file").addEventListener('change',function(e){		
		var files = document.getElementById("btn_file").files;
		var img = new Image();
		var reader = new FileReader();
		reader.readAsDataURL(files[0]);
			reader.onload = function(e){
				var mb = (e.total/1024)/1024;
				if(mb>= 2){
					alert('文件大小大于2M');
					return;
				}
				img.src = this.result;
				img.style.width = "100%";
				img.style.height = "100%";
				document.getElementById("show_img").style.width="200px";
				document.getElementById("show_img").style.height="200px";
				document.getElementById("show_img").innerHTML = '';
				document.getElementById("show_img").appendChild(img);
			}
		});
	}
	
</script>
</html>