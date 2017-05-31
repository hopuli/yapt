<%@page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>后台管理</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="x-pjax-version" content="v173">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/uowt/manager/ico/favico-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/uowt/manager/ico/favico-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/uowt/manager/ico/favico-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/uowt/manager/ico/favico-57-precomposed.png">
        <link rel="shortcut icon" href="/uowt/manager/ico/favico.png">
        <link rel="shortcut icon" href="/uowt/manager/ico/favico.ico">
        <link rel="stylesheet" href="/uowt/manager/styles/icon.css"/>
        <link rel="stylesheet" href="/uowt/manager/styles/main.css"/>
		<!-- Google-Code代码高亮CSS -->
        <link rel="stylesheet" href="/uowt/manager/styles/prettify.css"/>
		<!-- Ueditor编辑器CSS -->
		<link href="/uowt/manager/styles/umeditor.min.css" type="text/css" rel="stylesheet">
    </head>
    <body class="animated fadeIn">
        <header class="header">
            <div class="header-brand">
                <a data-pjax=".content-body" href="edit.html">
                    <img class="brand-logo" src="images/dummy/8986f28e.stilearn-logo.png" alt="Stilearn Admin Sample Logo">
                </a>
            </div>
            <div class="header-profile">
                <div class="profile-nav">
                    <span class="profile-username"></span>
                    <a  class="dropdown-toggle" data-toggle="dropdown">
                        <span class="fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu animated flipInX pull-right" role="menu">
                        <li><a href="Change_password.html"><i class="fa fa-user"></i> 修改密码</a></li>
                        <li class="divider"></li>
                        <li><a id="logout" href="#" ><i class="fa fa-sign-out"></i> 退出登录</a></li>
                    </ul>
                </div>
            </div>
            <form class="form-inline" onsubmit="return false;">
                <button type="button" class="btn btn-default btn-expand-search"><i class="fa fa-search"></i></button>
                <div class="toggle-search">
                    <input type="text" class="form-control" placeholder="搜索" id='search_note'>
                    <button type="button" class="btn btn-default btn-collapse-search"><i class="fa fa-times"></i></button>
                </div>
            </form>
            <ul class="hidden-xs header-menu pull-right">
                <li>
                    <a href="activity.html" target='_blank' title="活动">活动</a>
                </li>
            </ul>
        </header>
		<div class="row" style='padding:0;' id='center'>
			<!-- alert_background-->
			<div class="opacity_bg" style='display:none'></div>
			<!-- alert_notebook -->
			<div id="can"></div>
			<div class="col-xs-2" style='padding:0;' id='pc_part_1'>
				<!-- side-right -->
				<div class="pc_top_first">
					<h3>全部功能</h3>
					<button type="button" class="btn btn-default btn-xs btn_plus" id='add_notebook'><i class="fa fa-plus"></i></button>
				</div>
				<aside class="side-right" id='first_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul id="mngMenu-list" class="contacts-list">
									
								</ul>
							</div>
						</div>
					</div>
				</aside>
				<div class="row clear_margin">
					<div class="col-xs-4 click" id='rollback_button' title='回收站'><i class='fa fa-trash-o' style='font-size:20px;line-height:31px;'></i></div>
					<div class="col-xs-4 click" id='like_button' title='收藏功能'><i class='fa fa-star' style='font-size:20px;line-height:31px;'></i></div>
					<div class="col-xs-4 click" id='action_button' title='参加活动'><i class='fa fa-users' style='font-size:20px;line-height:30px;'></i></div>
				</div>
			</div>
			<!-- 全部功能 -->
			<!-- 全部 -->
			<div class="col-xs-3" style='padding:0;' id='pc_part_2'>
				<div class="pc_top_second" id='notebookId'>
					<h3>全部</h3>
					<button type="button" class="btn btn-default btn-xs btn_plus" id='add_note'><i class="fa fa-plus"></i></button>
				</div>
				<aside class="side-right" id='second_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
									<li class="online">
										<a  class='checked'>
											<i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> 操作界面<button type="button" class="btn btn-default btn-xs btn_position btn_slide_down"><i class="fa fa-chevron-down"></i></button>
										</a>
										<div id="work_space" tabindex='-1'>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 全部 -->
			<!-- 回收站 -->
			<div class="col-xs-3" style='padding:0;display:none;' id='pc_part_4'>
				<div class="pc_top_second">
					<h3>回收站</h3>
				</div>
				<aside class="side-right" id='four_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
									<li class="disable"><a ><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> 虚假回收站<button type="button" class="btn btn-default btn-xs btn_position btn_delete"><i class="fa fa-times"></i></button><button type="button" class="btn btn-default btn-xs btn_position_2 btn_replay"><i class="fa fa-reply"></i></button></a></li>
								</ul>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 回收站 -->
			<!-- 搜索列表 -->
			<div class="col-xs-3" style='padding:0;display:none;' id='pc_part_6'>
				<div class="pc_top_second">
					<h3>搜索结果</h3>
				</div>
				<aside class="side-right" id='sixth_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
								</ul>
							</div>
						</div>
						<div id='more_note'>更多...</div>
					</div>
				</aside>
			</div>
			<!-- 搜索列表 -->
			<!-- 收藏列表 -->
			<div class="col-xs-3" style='padding:0;display:none;' id='pc_part_7'>
				<div class="pc_top_second">
					<h3>已收藏</h3>
				</div>
				<aside class="side-right" id='seventh_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
									<!--li class="idle"><a ><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> switch多分支结构<button type="button" class="btn btn-default btn-xs btn_position btn_delete"><i class="fa fa-times"></i></button></a></li-->
								</ul>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 收藏列表 -->
			<!-- 参加活动的列表 -->
			<div class="col-xs-3" style='padding:0;display:none;' id='pc_part_8'>
				<div class="pc_top_second">
					<h3>参加活动的</h3>
				</div>
				<aside class="side-right" id='eighth_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
									<!--li class="offline"><a ><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> 样式用例（点击无效）</a></li-->
								</ul>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 参加活动的列表 -->
			<!-- 编辑 -->
			<div class="col-sm-7" id='pc_part_3'>
				<!-- side-right -->
				<div class="pc_top_third">
					<div class="row">
						<div class="col-xs-9">
							<h3>编辑</h3>
						</div>
						<div class="col-xs-3">
							<button type="button" class="btn btn-block btn-sm btn-primary" id='save_note'>保存</button>
						</div>
					</div>
				</div>
				<aside class="side-right" id='third_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body clear_margin">
								<!--- 标题 --->
								<div class="row" >
									<div class="col-xs-8">
										<input type="text" class="form-control" id="input_note_title" placeholder='标题...'>
									</div>
								</div>
								<!--- 标题 --->
								<div class="row">
									<div class="col-sm-12">
										<!--- 输入框 --->
										<script type="text/plain" id="myEditor" style="width:100%;height:400px;">
										</script>
										<!--- 输入框 --->
									</div>
								</div>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 编辑 -->
			<!-- 预览 -->
			<div class="col-sm-7" id='pc_part_5' style='display:none;' >
				<div class="pc_top_third">
					<div class="row">
						<div class="col-xs-9">
							<h3>预览</h3>
						</div>
					</div>
				</div>
				<aside class="side-right" id='fifth_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body clear_margin">
								<h4 id="noput_note_title"></h4>
								<p>
								</p>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 预览 -->
		</div>
        <footer>
            <p>&copy; 2014 Stilearning</p>
			<div style='position:absolute;top:5PX;height:30px;right:20px;line-height:26px;border:1px solid #0E7D76;display:none;background:#fff'>
				<strong style='color:#0E7D76;margin:0 10px;'></strong>
			</div>
        </footer>
        
        
        
        
		<script type="text/javascript">
			//加载DOM之后处理页面高度
			function get_dom(e){
				return document.getElementById(e);
			}
			function set_height(){
				var pc_height=window.innerHeight;
				pc_height=pc_height-132;
				get_dom('first_side_right').style.height=(pc_height-31)+'px';
				get_dom('second_side_right').style.height=pc_height+'px';
				get_dom('four_side_right').style.height=pc_height+'px';
				get_dom('sixth_side_right').style.height=pc_height+'px';
				get_dom('seventh_side_right').style.height=pc_height+'px';
				get_dom('eighth_side_right').style.height=pc_height+'px';
				get_dom('third_side_right').style.height=(pc_height-15)+'px';
				get_dom('fifth_side_right').style.height=(pc_height-15)+'px';
			}
			function myEditorWidth(){
				var dom=get_dom('third_side_right');
				var style=dom.currentStyle||window.getComputedStyle(dom, null);
				get_dom('myEditor').style.width=style.width;
			}
			set_height();
			//改变窗口大小时调整页面尺寸
			window.onresize=function(){
				set_height();
				var width=$('#third_side_right').width()-35;
				$('.edui-container,.edui-editor-body').width(width);
				$('#myEditor').width(width-20);
			};
		</script>
        <script type="text/javascript" src="/uowt/manager/scripts/jquery.min.js"></script>
		
		<script>
			
			$(function(){
				$.ajax({
					url:'/uowt/mngindex/listMenu.do',
					type:'post',
					//async:false,
					dataType:'json',
					success:function(result){
						var size = result.data.length;
						for(var i=0;i<size;i++){
							var menu = result.data[i];
							var menuLevel = menu.level;
							var menuId = menu.menu_id;
							var menuName = menu.name;
							var list_ul = $("#mngMenu-list");
						 	var list_li = '<li class="online"><a >';
			                list_li += '<i class="fa fa-book" title="online" rel="tooltip-bottom">';
			                list_li += '</i>'+menuName+'</a> </li>';
			                var $li = $(list_li);
			                $li.data("menuId",menuId)
			                $("#mngMenu-list").append($li);
						}
					},
					error:function(){
						alert("出错！");
					}
				});
				
				/*
				$("#mngMenu-list li a").on('click',function(){
					$(this).parent().parent().find('a').removeClass("checked");
					var menuId = $(this).parent().data("menuId");
					$(this).addClass("checked");
					var p_li = $(this).parent();
					if(p_li.find('ul').length!=0){
						p_li.find('ul').remove();
						return;
					}
					$.ajax({
						url:'/uowt/mngIndex/listTwoMenu.do',
						type:'post',
						dataType:'json',
						data:{'parentId':menuId},
						success:function(result){
							var size = result.data.length;
							var t_ul = '<ul>';
							for(var i=0;i<size;i++){
								var menu = result.data[i];
								var menuName = menu.name;
								var menuId = menu.menu_id;
								t_ul += '<li>'+menuName+'</li>';
							}
							t_ul += '</ul>';
							p_li.append(t_ul);
						},
						error:function(){
							alert("发生错误！");
						}
					});
				});
				*/
				
				$("#mngMenu-list").on('click','li a',function(){
					$(this).parent().parent().find('a').removeClass("checked");
					var menuId = $(this).parent().data("menuId");
					$(this).addClass("checked");
					var p_li = $(this).parent();
					if(p_li.find('ul').length!=0){
						p_li.find('ul').remove();
						return;
					}
					$.ajax({
						url:'/uowt/mngindex/listTwoMenu.do',
						type:'post',
						dataType:'json',
						data:{'parentId':menuId},
						success:function(result){
							var size = result.data.length;
							var t_ul = '<ul>';
							for(var i=0;i<size;i++){
								var menu = result.data[i];
								var menuName = menu.name;
								var menuId = menu.menu_id;
								var menuurl = menu.url;
								t_ul += '<li><a  href="/uowt'+menuurl+'">'+menuName+'</a></li>';
							}
							t_ul += '</ul>';
							p_li.append(t_ul);
						},
						error:function(){
							alert("发生错误！");
						}
					});
				});
			});
		</script>
		
		
		
		</body>		
</html>