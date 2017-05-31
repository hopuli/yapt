$(function() { /* 文档加载，执行一个函数*/
	$('#defaultForm').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: { /*input状态样式图片*/
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: { /*验证：规则*/
			name: { //验证input项：验证规则
				message: 'The name is not valid',

				validators: {
					notEmpty: { //非空验证：提示消息
						message: '姓名不能为空'
					},
					regexp: {
						regexp: /^[\u4E00-\u9FA5A-Za-z]+$/,
						message: '请输入正确姓名'
					}
				}
			},
			mail: {
				validators: {
					notEmpty: {
						message: '邮件不能为空'
					},
					emailAddress: {
						message: '请输入正确的邮件地址如：123@qq.com'
					}
				}
			},
			phone: {
				message: 'The phone is not valid',
				validators: {
					notEmpty: {
						message: '手机号码不能为空'
					},
					stringLength: {
						min: 11,
						max: 11,
						message: '请输入11位手机号码'
					},
					regexp: {
						regexp: /^1[34578]\d{9}$/,
						message: '请输入正确的手机号码'
					}
				}
			},

		}
	})

	$(".submit").on("click", function() {

		var bootstrapValidator = $("#defaultForm").data('bootstrapValidator');
		bootstrapValidator.validate();
		if(bootstrapValidator.isValid())
			$("#defaultForm").submit();
		else return;
		//		性别判断
		var a;
		if($('#ridio1').is(':checked')) {
			a = 1;
		} else if($('#ridio2').is(':checked')) {
			a = 2
		}
		$.ajax({
			type: "post",
			url: " http://58.246.52.102:3551/yapt/mng/people/addPeople",
			data: {
				name: $('#name').val(),
				mail: $('#email').val(),
				phone: $('#phone').val(),
				sex: a
			},
			success: function(result) {
				console.log(result);

				dialog({
					layerType: 'alert', //alert、loading、confirm
					isloading: false,
					contentHtml: '提交成功',
					autoClose: 2000
				})

				$('#defaultForm').data('bootstrapValidator').resetForm(true);

			}
		});

	});
	//	var bootstrapValidator = $("#defaultForm").data('bootstrapValidator');
	//	bootstrapValidator.validate();
	//	if(bootstrapValidator.isValid()) {
	//		$('.submit').click(function() {
	//			var a;
	//			if($('#ridio1').is(':checked')) {
	//				a = 1;
	//			} else if($('#ridio2').is(':checked')) {
	//				a = 2
	//			}
	//			$.ajax({
	//				type: "post",
	//				url: " http://58.246.52.102:3551/yapt/mng/people/addPeople",
	//				data: {
	//					name: $('#name').val(),
	//					mail: $('#email').val(),
	//					phone: $('#phone').val(),
	//					sex: a
	//
	//				},
	//				success: function(result) {
	//					console.log(result);
	//					console.log(a);
	//					$('#defaultForm').data('bootstrapValidator').resetForm(true);
	//
	//				}
	//			});
	//		})
	//	} else return;
});