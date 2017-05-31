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
		<h3>Business维护</h3>
		<div style="float:left;margin-right: 60px">
			<form id="updateBuses" action="" method="post" >
				<table>
					<tr><th colspan="4">Business列表</th></tr>
					<tr style="text-align: center;"><td>id</td><td>排序</td><td>business类型</td></tr>
					<c:forEach items="${busInfo }" var="businessInfo"  varStatus="bus_index">
					<tr>
						<td ><input readOnly  style="text-align: center;width: 50px"  name="buses[${bus_index.index}].id" value=${businessInfo.id } /></td>
						<td ><input readOnly  style="text-align: center;width: 50px"  name="buses[${bus_index.index}].rank" value=${businessInfo.rank } /></td>
						<td><input style="width: 200px" name="buses[${bus_index.index }].title" value="${businessInfo.title}"/></td>
						<td><a href="#"><img onclick="editBus(${businessInfo.id})" style="width:20px;height:20px;cursor: pointer;" src="${sysSrc}/manager/imgs/edit.jpg" /></a></td>
					</tr>
					</c:forEach>
					<tr><td colspan="4" align="center" ><span id="buses_msg" style="color:red"></span></td></tr>
					<tr style="height: 70"><td colspan="4" align="center" ><input style="cursor: pointer;clear: both;width: 70px;height: 30;font-size: 18px" id="busesSub"  type="button" value="提交"/></td></tr>
				</table>
			</form>
		</div>
		<div id="editBus" hidden="hidden">
			<form action="" id="updateBus" method="post">
				<table>
					<tr>
						<td>id:</td><td><input readOnly style="width: 300px;" name="id"/></td>
					</tr>
					<tr>
						<td>排序：</td><td><input readOnly style="width: 300px;" name="rank"/></td>
					</tr>
					<tr>
						<td>类型：</td><td><input style="width: 300px;" name="title"/></td>
					</tr>
					<tr>
						<td>pimg：</td><td><input readOnly style="width: 300px;" name="pimg"/></td>
					</tr>
					<tr>
						<td>bimg：</td><td><input readOnly style="width: 300px;" name="bimg"/></td>
					</tr>
					<tr>
						<td>链接：</td><td><input style="width: 300px;" name="url"/></td>
					</tr>
					<tr>
						<td>内容：</td><td><textarea style="width: 700px;height: 200px;" name="content"></textarea></td>
					</tr>
					<tr><td colspan="4" align="center"><span id="saveSub_msg" style="color:red;"></span></td></tr>
					<tr style="height: 70"><td colspan="4" align="center" >
					<input style="cursor: pointer;clear: both;width: 70px;height: 30;font-size: 18px" id="saveSub" type="button"  value="保存"/></td></tr>
				</table>
			</form>
		</div>
	</body>
<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#updateBuses").click(function(){
			$("#buses_msg").html("");
		});
		
		$("#updateBus").click(function(){
			$("#saveSub_msg").html("");
		});
	});
	
	$("#busesSub").click(function(){
	 	$.ajax({
			url:'${sysSrc}/mng/business/updateBuses.do',
			type:'post',
			dataType:'json',
			data:$("#updateBuses").serialize(),
			success:function(result){
				$("#buses_msg").html("修改成功！");
			}
		});
	});
	function editBus(id){
		$("#saveSub_msg").html("");
		$("#editBus").show();
		$.ajax({
			url:'${sysSrc}/mng/business/findBusById.do',
			type:'post',
			dataType:'json',
			data:{"id":id},
			success:function(result){
				$("#editBus input[name='id']").val(result.data.id);
				$("#editBus input[name='rank']").val(result.data.rank);
				$("#editBus input[name='title']").val(result.data.title);
				$("#editBus input[name='pimg']").val(result.data.pimg);
				$("#editBus input[name='bimg']").val(result.data.bimg);
				$("#editBus input[name='url']").val(result.data.url);
				$("#editBus textarea[name='content']").val(result.data.content);
				
			}
		});
	}
	$("#saveSub").click(function(){
		$("#saveSub_msg").html("");
		var id = $("#editBus input[name='id']").val();
		$.ajax({
			url:'${sysSrc}/mng/business/updateBus.do',
			type:'post',
			dataType:'json',
			data:$("#updateBus").serialize(),							
			success:function(result){
				$("#saveSub_msg").html("保存成功！");
			},
			error:function(){
				alert("出错！");
			}
		});
	});
	
	
</script>
</html>