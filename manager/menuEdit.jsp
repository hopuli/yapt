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
		<h3>功能菜单维护</h3>
		<form action="${sysSrc}/mng/ctmenu/updateCtMenu.do" method="post" >
		
			<table id="menu_table">
				<tr><th colspan="4">主菜单</th></tr>
				<tr style="text-align: center;"><td>id</td><td>名字</td><td>链接</td><td>排序</td></tr>
				<c:forEach items="${ct_menus }" var="menu"  varStatus="menu_index">
				<tr>
					<td ><input readOnly  style="text-align: center;"  name="menus[${menu_index.index}].id" value=${menu.id } /></td>
					<td><input style="width: 200px" name="menus[${menu_index.index }].englishname" value="${menu.englishname}"/></td>
					<td><input readOnly style="width: 200px" name="menus[${menu_index.index }].url" value="${menu.url}"/></td>
					<td><input style="width: 200px" name="menus[${menu_index.index }].rank" value="${menu.rank}"/></td>
				</tr>
				</c:forEach>
				<tr><td colspan="4" align="center"><span id="menu_msg" style="color:red">${menu_msg }</span></td></tr>
				<tr style="height: 70"><td colspan="4" align="center" ><input style="cursor: pointer;clear: both;width: 70px;height: 30;font-size: 18px"  type="submit" value="提交"/></td></tr>
			</table>
		</form>
		
		
	</body>
<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#menu_table").click(function(){
			$("#menu_msg").html("");
		});
	});
	
	
</script>
</html>