<%@page pageEncoding="utf-8" %>
<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
<script>
	$(function(){
		var mnguser = "<%=session.getAttribute("mngUser")%>";
		if(mnguser=="null"){
			alert("用户未登录或登录失效！");
			location.href="${sysSrc}/mng/login.do";
		}
	});
</script>
<frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="${sysSrc}/manager/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frameset cols="150,*" frameborder="no" border="0" framespacing="0">
    <frame src="${sysSrc}/manager/left.jsp" name="leftFrame" scrolling="No" style="padding-top: 2;padding-right: 2 " noresize="noresize" id="leftFrame" />
    <frame src="${sysSrc}/manager/center.jsp" style="padding-top: 2;" name="mainFrame" id="mainFrame" />
  </frameset>
</frameset>
