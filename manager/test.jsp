<%@page pageEncoding="utf-8" %>
<% String sysSrc=request.getContextPath();  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<html>
	<head>
		<style type="text/css">
		</style>
	</head>
	
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