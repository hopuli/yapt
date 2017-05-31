<%@page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<html>
	<head>
		<style type="text/css">
		</style>
	</head>
	<body>
		<h3>视频维护</h3>
		<form id="updateVideo" action="" method="post" enctype="multipart/form-data">
			<table >
				
				<tr><td>视频上传<span style="font-size:10px;color: red"></span>：
				</td><td colspan="2"><input style="cursor: pointer;" id="upfile" type="file" name="upfile" />
				</td>
				</tr>
				<tr style="height: 80;">
					<td></td>
					<td style="width: 100"><input style="cursor: pointer;width: 80px" id="sbm" type="button" value="开始上传" /></td>
					<td>
						<div id="progress1" hidden style="width: 100;height: 18;border:dotted;">
							<div id="progress" style="width:0;background-color: blue;height: 18;text-align: center">
							</div>
						</div>
					</td>
					<td><span style="color: red" id="msg"></span></td>
				</tr>
				<tr style="height: 100">
				<td colspan="1" align="center">
					<a style="cursor: pointer;" href="${sysSrc}/front/video/enyw.mp4" download="enyw.mp4">视频文件下载</a>
					
				</td>
				
				</tr>
				<tr><td>
					<a style="cursor: pointer;" href="${sysSrc}/front/video/enyw.mp4" >视频文件预览</a>
				</td></tr>
			</table> 
		</form>
	</body>
<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${sysSrc}/manager/scripts/shuibi.js"></script>
<script type="text/javascript">
	$("#sbm").on('click',function(){
		$("#msg").html("");
		var formData = new FormData($("#updateVideo")[0]);
		if($("#upfile").val()==""){
			alert("您未选择文件！");
			return;
		}
		var filename = $("#upfile").val();
		var suffix = filename.substring(filename.lastIndexOf("."));
		
		if(suffix!=".mp4"){
			alert("请选择mp4格式的视频文件");
			return;
		}
		
		$("#progress1").show();
		sbUtils.fileUpload({
			url:'${sysSrc}/mng/video/uploadVideo.do',
			data:{upfile:document.getElementById("upfile").files[0]},
			onprogress:function(percent){
				//改变进度条宽度
				if(!isNaN(percent)){
					$("#progress").css("width",percent).html(percent+"%");
				}
			},
			success:function(){
				$("#msg").html("上传成功");
			},
			error:function(){
				alert("上传失败");
			}
		}); 
		
		
		
		 /* $.ajax({
			url:'${sysSrc}/mng/video/uploadVideo.do',
			type:'post',
			dataType:'json',
			data:formData,
			// 告诉jQuery不要去处理发送的数据
			processData : false, 
			// 告诉jQuery不要去设置Content-Type请求头
			contentType : false,
			beforeSend:function(){
				$("#msg").html("");
				console.log("正在进行，请稍候");
				$("#msg").html("正在进行，请稍候......");
			},
			success:function(result){
				if(result.status==0){
					$("#msg").html("");
					console.log("上传成功！");
					$("#msg").html("上传成功！");
				}else{
					$("#msg").html("");
					console.log("上传失败！");
					$("#msg").html("上传失败！");
				}
			},
			error:function(){
				$("#msg").html("");
				console.log("上传失败！");
				$("#msg").html("上传失败！");
			}
		});  */
	});
	
	
</script>
</html>