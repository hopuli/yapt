<%@page pageEncoding="utf-8" %>
<% String sysSrc=request.getContextPath();  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<html>
	<head>
		<style type="text/css">
			
		</style>
	</head>
	<body>
		<h3>Group内容：</h3>
		<div>
			
				<textarea id="content" name="content" title="内容：" style="height: 120px;width: 1200">${groupInfo.content }</textarea>
				<br><span  id="content_msg" style="color:red;margin-left: 500"></span><br>
				<input id="content_sub"  style="margin-left:500;margin-top:10;clear: both;width: 70px;height: 30;font-size: 18px" type="button" value="保存"/>
				<h4>图片：</h4>
				<form action="${sysSrc}/mng/group/updateGroup.do" method="post" enctype="multipart/form-data">
					<table id="gimg_table" style="width: 100%;">
						<tr>
							<td id="listimg">
									<c:forEach items="${groupInfo.gimgs}" var="gimg" varStatus="img_index">
										<div style="float: left;" align="center" >
											<input name="gimgs[${img_index.index }].imgFile" type="file" id="btn_file${img_index.index }" style="display: none" >
											<div id="show_img${img_index.index }" onclick="uploadImg(${img_index.index },${gimg.id})">
												<img height="143" width="143" alt="" src="${sysSrc}${gimg.url }" >
											</div>
											<input name="gimgs[${img_index.index }].module" type="text" value="${gimg.module }" style="text-align: center"/>
											<input hidden="hidden" name="gimgs[${img_index.index }].id" value="${gimg.id }"/>
											<input hidden="hidden" name="gimgs[${img_index.index }].url" value="${gimg.url }"/>
										</div>
									</c:forEach>
									<div style="margin-top: 55;"><input type="button" onclick="addImg()" value="添加" /><br><input type="button" value="删除" onclick="deleteImg()" /></div>
							</td>
						</tr>
						
					</table>
					<span id="result_msg" style="color:red;margin-left:500;">${result_msg }</span><br>
					<input  style="cursor: pointer;margin-left:500;margin-top:30;clear: both;width: 70px;height: 30;font-size: 18px" type="submit" value="提交"/>
				</form>
			
		</div>
		
	</body>
<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
<script type="text/javascript">
	function addImg(){
		$.ajax({
			url:'${sysSrc}/mng/group/addGroupImg.do',
			type:'get',                
			dataType:'json',
			success:function(result){
				location.href="${sysSrc}/mng/group/toGroup.do"
			},
			error:function(){
			}
		});
	}
	function deleteImg(id){
		$.ajax({
			url:'${sysSrc}/mng/group/deleteGroupImg.do',
			type:'get',  
			dataType:'json',
			success:function(result){
				location.href="${sysSrc}/mng/group/toGroup.do"
			},
			error:function(){
			}
		});
	}
	
	
	function uploadImg(img_index,id){
		$("#btn_file"+img_index).click();
		document.getElementById("btn_file"+img_index).addEventListener('change',function(e){		
		var files = document.getElementById("btn_file"+img_index).files;
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
				document.getElementById("show_img"+img_index).style.width="143px";
				document.getElementById("show_img"+img_index).style.height="143px";
				document.getElementById("show_img"+img_index).innerHTML = '';
				document.getElementById("show_img"+img_index).appendChild(img);
			}
		});
	}
	
	$("#content_sub").click(function(){
		
		$.ajax({
			url:'${sysSrc}/mng/group/updateContent.do',
			type:'post',
			dataType:'json',
			data:{"content":$("#content").val()},
			success:function(result){
				$("#content_msg").html("修改成功！");
			}
		});
		
	});
	$(function(){
		$("#content").click(function(){
			$("#content_msg").html("");
		});
		
		$("#gimg_table").click(function(){
			$("#result_msg").html("");
		});
	});
</script>
</html>