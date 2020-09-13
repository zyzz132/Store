$(function(){
	$("#btnLogin").click(function(){
		var texta=$("input[name='userName']").val();
		var pwdt=$("input[name='pwd']").val();
		var prols="login";
		$.ajax({
		        url:'topic' //发送请求地址
		        ,type:'post' //方式
		        ,data:{userName:texta,pwd:pwdt,prol:prols} //发生的参数
		        ,dataType:'JSON'//返回类型
		        ,success:function(rst){
		        	console.log(rst);
		        	if(rst==false){
						alert("帐号或密码错误！")
					}else{
							alert("登录成功");
							location.href="index.jsp";
							//设置Cookie

							document.cookie="userName="+texta+";";
							document.cookie="pwd="+pwdt;
					}
				}//发生请求成功 返回结果事件
		        ,error:function(xhr){alert('php页面有错误！'+xhr.responseText);}////发生请求失败 返回结果事件
		})
	})
})

