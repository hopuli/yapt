<%@page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<style type="text/css">
			
		</style>
	</head>
	<body>
		<h3>官网后台系统用户管理</h3>
		
			<table id="company_table" style="width: 800px;text-align: center;">
				<tr><th colspan="5">用户信息修改</th></tr>
				<tr>
					<td>id</td><td>真实姓名</td><td>用户名</td><td>密码</td><td >操作</td>
				</tr>
				<c:forEach items="${mngUsers }" var="user">
					<tr>
						<td><input type="text" readOnly name="user_id" value="${user.user_id }"/></td>
						<td><input type="text" readOnly name="realname" value="${user.realname }"/></td>
						<td><input type="text" readOnly name="username" value="${user.username }"/></td>
						<td><input type="password" readOnly name="password" value="${user.password }" /></td>
						<td><a href="${sysSrc }/mng/user/showUser.do?user_id=${user.user_id}">修改</a></td>
					</tr>
				</c:forEach>
			</table>
		
		
	</body>
<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
<script type="text/javascript">
	
	
</script>
</html>