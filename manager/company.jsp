<%@page pageEncoding="utf-8" %>
<% String sysSrc=request.getContextPath();  %>
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
		<h3>公司信息维护</h3>
		<form id="updateForm" action="" method="post" enctype="multipart/form-data">
		
			<table id="company_table">
				<tr><th colspan="2">公司信息修改</th></tr>
				<tr>
					<td>公司名称：</td><td><input style="width: 500" name="fullname" value="${companyInfo.fullname }"/></td>
				</tr>
				<tr>
					<td>公司地址：</td><td><input style="width: 500" name="address" value="${companyInfo.address }"/></td>
				</tr>
				<tr>
					<td>公司电话：</td><td><input style="width: 500" name="telephone" value="${companyInfo.telephone }"/></td>
				</tr>
				<tr>
					<td>公司官网：</td><td><input style="width: 500" name="weburl" value="${companyInfo.weburl }"/></td>
				</tr>
				
				<tr>
					<td>公司简称：</td><td><input style="width: 500" name="name" value="${companyInfo.name }"/></td>
				</tr>
				<tr>
					<td>公司logo：</td>
					<td>
						<div id="logoimg">
							<img  style="width: 60;height: 60" src="${sysSrc}${companyInfo.logo }">
						</div>
						<input id="logofile" type="file" name ="logofile"/>
					</td>
				</tr>
				<tr>
					<td>公司二维码：</td>
					<td>
						<div id="qrimg">
						<img style="width: 60;height: 60" src="${sysSrc}${companyInfo.qrcode }">
						</div>
						<input id="qrfile" type="file" name ="qrfile"/>
					</td>
				</tr>
				<tr>
					<td>公司简介：</td><td><textarea rows="6" cols="70" name="introduction">${companyInfo.introduction }</textarea> </td>
				</tr>
				<tr>
					<td>版权：</td><td><input style="width: 500" name="copyright" value="${companyInfo.copyright }"/></td>
				</tr>
				<tr><td colspan="2" align="center" ><span id="update_msg" style="color: red">&nbsp;${updateComInfo_msg }&nbsp;</span></td></tr>
				<tr style="height: 70"><td colspan="2" align="center" ><input style="cursor: pointer;clear: both;width: 70px;height: 30;font-size: 18px" id="sub" type="submit" value="提交"/></td></tr>
			</table>
		</form>
		
		
	</body>
<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var introduction = $("textarea[name='introduction']").val();
		introduction=introduction.replace(/<br>/g,"");  
		$("textarea[name='introduction']").val(introduction);
		
		$("#company_table").click(function(){
			$("#update_msg").html("&nbsp;&nbsp;");
		});
	});
	/* $("#sub").on('mouseout',function(){
		$("#update_msg").html("&nbsp;&nbsp;");
	}); */
	
	$("#sub").click(function(){
		var logofile = $("input[name='logofile']").val();
		var qrfile = $("input[name='qrfile']").val();
		 if(logofile !=""){
			checkImg(logofile);
		}
		if(qrfile !=""){
			checkImg(qrfile);
		}
		var introduction = $("textarea[name='introduction']").val();
		introduction=introduction.replace(/[\n]/g,"<br>\n");  
		$("textarea[name='introduction']").val(introduction);
		$("#updateForm").attr("action","${sysSrc}/mng/company/updateCompanyInfo.do").submit();
	});
	
	function checkImg(imgname){
		var ext = imgname.substring(imgname.lastIndexOf(".")).toUpperCase();
		if(ext!=".BMP" && ext!=".PNG" && ext!=".GIF" && ext!=".JPG" && ext!=".JPEG"){
			alert("图片限于png,gif,jpeg,jpg格式");
			return;
		}
	}
	
	$(function(){
		document.getElementById("logofile").addEventListener('change',function(e){		
			var files = document.getElementById("logofile").files;
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
				document.getElementById("logoimg").style.width="60px";
				document.getElementById("logoimg").style.height="60px";
				document.getElementById("logoimg").innerHTML = '';
				document.getElementById("logoimg").appendChild(img);
			}
		});
		
		document.getElementById("qrfile").addEventListener('change',function(e){		
			var files = document.getElementById("qrfile").files;
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
				document.getElementById("qrimg").style.width="60px";
				document.getElementById("qrimg").style.height="60px";
				document.getElementById("qrimg").innerHTML = '';
				document.getElementById("qrimg").appendChild(img);
			}
		});
	});
	
</script>
</html>