<%@page pageEncoding="utf-8" %>
<!DOCTYPE html>
<% String sysSrc=request.getContextPath();  %>
<html>
<head>
<meta charset="utf-8">
<title>炎武官网后台</title>
<script type="text/javascript" 
    src="${sysSrc}/manager/scripts/jquery.min.js">
</script>
<script type="text/javascript" 
    src="${sysSrc}/manager/scripts/cookie_util.js">
</script>
<script type="text/javascript" 
    src="${sysSrc}/manager/scripts/login.js">
</script>
<script type="text/javascript" 
    src="${sysSrc}/manager/scripts/regist.js">
</script>
<link rel="stylesheet" href="${sysSrc}/manager/styles/login.css"/>
</head>
  <body background="<%=sysSrc  %>/manager/imgs/banner1.png" 
  	style=" background-repeat:no-repeat ;background-size:100% 100%;background-attachment: fixed;">
    <div class="global">
      <div class="log log_in" tabindex='-1' id='dl'>
        <dl>
          <dt>
            <div class='header'>
              <h3>登&nbsp;录</h3>
            </div>
          </dt>
          <dt></dt>
          <dt>
            <div class='letter'>
              用户名:&nbsp;<input type="text" name="username" id="count" tabindex='1'/>
                <span id="count_msg"></span>
                        </div>
          </dt>
          <dt>
            <div class='letter'>
              密&nbsp;&nbsp;&nbsp;码:&nbsp;<input type="password" name="password" id="password" tabindex='2'/>
                <span id="password_msg"></span>
                        </div>
          </dt>
          <dt style="text-align: center"><span style="color: red">${login_timeout}</span></dt>
          <dt>
            <div>
              <input type="button" name="" id="login" value='&nbsp登&nbsp录&nbsp' tabindex='3'/>
              <input type="button" name="" id="sig_in" value='&nbsp注&nbsp册&nbsp' tabindex='4'/>
            </div>
          </dt>
        </dl>
      </div>
      <div class="sig sig_out" tabindex='-1' id='zc' style='visibility:hidden;'>
        <dl>
          <dt>
            <div class='header'>
              <h3>注&nbsp;册</h3>
            </div>
          </dt>
          <dt></dt>
          <dt>
            <div class='letter'>
              用户名:&nbsp;<input type="text" name="" id="regist_username" tabindex='5'/>
              <div class='warning' id='warning_1'><span>该用户名不可用</span></div>
            </div>
          </dt>
          <dt>
            <div class='letter'>
              昵&nbsp;&nbsp;&nbsp;称:&nbsp;<input type="text" name="" id="nickname" tabindex='6'/>
            </div>
          </dt>
          <dt>
            <div class='letter'>
              密&nbsp;&nbsp;&nbsp;码:&nbsp;<input type="password" name="" id="regist_password" tabindex='7'/>
              <div class='warning' id='warning_2'><span>密码长度过短</span></div>
            </div>
          </dt>
          <dt>
            <div class='password'>
              &nbsp;&nbsp;&nbsp;确认密码:&nbsp;<input type="password" name="" id="final_password" tabindex='8'/>
              <div class='warning' id='warning_3'><span>密码输入不一致</span></div>
            </div>
          </dt>
          <dt>
            <div>
              <input type="button" name="" id="regist_button" value='&nbsp注&nbsp册&nbsp' tabindex='9'/>
              <input type="button" name="" id="back" value='&nbsp返&nbsp回&nbsp' tabindex='10'/>
              <script type="text/javascript">
              function get(e){
                return document.getElementById(e);
              }
              get('sig_in').onclick=function(){
                get('dl').className='log log_out';
                get('zc').className='sig sig_in';
              }
              get('back').onclick=function(){
                get('zc').className='sig sig_out';
                get('dl').className='log log_in';
              }
              window.onload=function(){
                var t =setTimeout("get('zc').style.visibility='visible'",800);
                get('final_password').onblur=function(){
                  var npassword=get('regist_password').value;
                  var fpassword=get('final_password').value;
                  if(npassword!=fpassword){
                    get('warning_3').style.display='block';
                  }
                }
                get('regist_password').onblur=function(){
                  var npassword=get('regist_password').value.length;
                  if(npassword<6&&npassword>0){
                    get('warning_2').style.display='block';
                  }
                }
                get('regist_password').onfocus=function(){
                  get('warning_2').style.display='none';
                }
                get('final_password').onfocus=function(){
                  get('warning_3').style.display='none';
                }
              }
              
             
              </script>
              <script type="text/javascript">
              	$("#login").click(function(){
				      //清除原有的提示信息
				      $("#count_msg").html("");
				      $("#password_msg").html("");
				      //获取请求数据
				      var name = $("#count").val().trim();
				      var password = $("#password").val().trim();
				      //检查数据格式
				      var ok = true;
				      if(name==""){
				    	  $("#count_msg").html("用户名不能为空");
				          ok = false;
				      }
				      if(password==""){
				    	  $("#password_msg").html("密码不能为空");
				          ok = false;
				      }
				      if(ok){
				        //发送Ajax请求
				        $.ajax({
				           url:"${sysSrc}/mng/checkLogin",
				           type:"post",
				           data:{"username":name,"password":password},
				           dataType:"json",
				           success:function(result){
				              //result是服务器返回的json结果
				              if(result.status==0){//成功
				                 //获取用户ID，写入Cookie
				                // var userId = result.data;
				                // addCookie("uid",userId,2);//存储2小时
				                 window.location.href="${sysSrc}/mng/home";
				              }else if(result.status==1){//用户名错
				                 $("#count_msg").html(result.msg);
				              }else if(result.status==2){//密码错
				                 $("#password_msg").html(result.msg);
				              }
				           }
				        });
				     }//end if
				  });
              	  
              	  
              </script>
            </div>
          </dt>
        </dl>
      </div>
    </div>
  </body>
</html>