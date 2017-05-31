<%@page pageEncoding="utf-8" %>
<% String sysSrc=request.getContextPath();  %>
<style type="text/css">
	a{
		text-decoration: none;
	}		
</style>
<html>
	<body style="background-color: ADD8E6">
		<h3 style="font-weight: bold;">功能菜单</h3>
		<div id="mngMenu-list">
		
		</div>
	</body>
	
</html>


<script type="text/javascript" src="${sysSrc}/manager/scripts/jquery.min.js"></script>
		
		<script>
			
			$(function(){
				$.ajax({
					url:'${sysSrc}/mng/listMenu.do',
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
						 	var list_li = '<li ><a href="#">';
			                list_li += '<i  title="online" rel="tooltip-bottom">';
			                list_li += '</i>'+menuName+'</a> </li>';
			                var $li = $(list_li);
			                $li.data("menuId",menuId)
			                $("#mngMenu-list").append($li);
						}
					},
					error:function(){
					}
				});
				
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
						url:'${sysSrc}/mng/listTwoMenu.do',
						type:'post',
						//async:false,
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
								t_ul += '<li><a target="mainFrame" href="${sysSrc}'+menuurl+'">'+menuName+'</a></li>';
							}
							t_ul += '</ul>';
							p_li.append(t_ul);
						},
					});
				});
			});
		</script>
		