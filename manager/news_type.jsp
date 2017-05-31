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
		<h3>信息类型维护</h3>
		<div>
		<form action="/uowt/ctmenu/updateCtMenu.do" method="post" >
			<select id="typeOne" onchange="showTwoType()"">
				<c:forEach items="${newsTypes }" var="nt" varStatus="nt_index">
					<option value="${nt.id}" >${nt.typename }</option>
				</c:forEach>
			</select>
			<select id="typeTwo">
				
			</select>
		</form>
		</div>
		<div>
			<form action="">
				<table>
					<tr>
						<th></th>
					</tr>
				</table>
			</form>
		</div>
		
	</body>
<script type="text/javascript" src="/uowt/manager/scripts/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		showTwoType();
	});
	function showTwoType(){
		var pid = $("#typeOne").val();
		$.ajax({
			url:'/uowt/news/findTypeTwo.do',
			type:'post',
			dataType:'json',
			data:{'parentid':pid},
			success:function(result){
				var types = result.data;
				var ops = '';
				for(var i=0;i<types.length;i++){
					ops += '<option value="'+types[i].id+'">'+types[i].typename+'</option>';
				}
				$("#typeTwo").html(ops);
			}
		});
	}
</script>
</html>