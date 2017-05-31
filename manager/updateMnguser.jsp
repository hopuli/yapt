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
		<h3>用户信息修改</h3>
		<div style="float:left;margin-right: 60px">
			<form id="userForm" action="" method="post" >
				<table>
					<tr>
						<td>id：</td><td><input name="user_id" readOnly type="text" value="${user.user_id }" /></td>
					</tr>
					<tr>
						<td>用户名：</td><td><input name="username" type="text" value="${user.username }" /></td>
					</tr>
					<tr>
						<td>真实姓名：</td><td><input name="realname" type="text" value="${user.realname }" /></td>
					</tr>
					<tr>
						<td>密码：</td><td><input type="password" name="password" value="${user.password }" /></td>
					</tr>
					<tr id="qrpwd" hidden>
						<td>确认新密码：</td><td><input type="password" value="" name="pwd2" /></td>
					</tr>
					<tr><td colspan="4" align="center"><span id="personal_msg" style="color:red"></span></td></tr>
					<tr style="height: 70"><td colspan="4" align="right" >
					<input style="cursor: pointer;clear: both;width: 70px;height: 30;font-size: 18px" id="userSub" type="button" value="提交"/>
					<input style="cursor: pointer;clear: both;width: 70px;height: 30;font-size: 18px" id="backSub" type="button" value="返回"/></td></tr>
				</table>
			</form>
		</div>
		
	</body>
<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#userForm").click(function(){
			$("#personal_msg").html("");
		
		});
	});
	$("#backSub").click(function(){
		location.href='${sysSrc}/mng/user/showUsers.do';
	});

	$("input[name='password']").on('change',function(){
		$("#qrpwd").show();
		
	});
	$("#userSub").click(function(){
		
		var pwd1 = $("input[name='password']").val();
		var pwd2 = $("input[name='pwd2']").val();
		if(pwd1.trim()==""){
			alert("密码不能为空");
			return;
		}
		if($("#qrpwd").is(":visible")){
			if(pwd1!=pwd2){
				alert("两次密码输入不正确！");
				return;
			}
		}
		
		$.ajax({
			url:'${sysSrc}/mng/user/updateUser.do',
			type:'post',
			data:$("#userForm").serialize(),
			dataType:'json',
			success:function(result){
				$("#personal_msg").html("修改成功！");
				setTimeout(function(){
					$("#personal_msg").html("");
				},"10000");
			}
		});
	});
	
</script>
</html>