<%@page pageEncoding="utf-8" %>
<% String sysSrc=request.getContextPath();  %>
<style>

</style>
<html>
	<body style="background-color: ADD8E6 ;">
		<div>
			<div align="left" style="float:left;margin-left: 20px">
				<a href="${sysSrc}/manager/center.jsp" target="mainFrame">
					<img alt="" style="width:270px;height: 40px" src="${sysSrc}/manager/imgs/logo.png">
				</a>
			</div>
			<div style="float:right;">
				${mngUser.realname }<span style="color: blue;">,欢迎您！</span><br>
				<a target="mainFrame" href="${sysSrc}/mng/personal/toPersonal.do">个人信息修改</a>
				&nbsp;&nbsp;<input type="button" value="退出登录" onclick="javascript:window.open('${sysSrc}/mng/userout.do','_top')"/>
				
			</div>
			<div align="center"  >
				<span style="font-size: 35px;">青&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;公&nbsp;&nbsp;&nbsp;寓&nbsp;&nbsp;&nbsp;后&nbsp;&nbsp;&nbsp;台&nbsp;&nbsp;&nbsp;管&nbsp;&nbsp;&nbsp;理&nbsp;&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;统</span>
			</div>
		</div>
	</body>
</html>