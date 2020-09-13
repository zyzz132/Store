$(function(){
	$("input[type='button']").click(function(){
		var name=$("input[type='text']").val();
		var pwds=$("input[type='password']").val();
		var prols="login";
		$.ajax({
		        url:'../topic' //发送请求地址
		        ,type:'get' //方式
		        ,data:{userName:name,pwd:pwds,prol:prols} //发生的参数
		        ,dataType:'JSON'//返回类型
		        ,success:function(rst){
					console.log(rst);
					if(rst==false){
						alert("帐号或密码错误！")
					}else{
						location.href="admin.jsp";
					}
				}//发生请求成功 返回结果事件
		        ,error:function(xhr){alert('php页面有错误！'+xhr.responseText);}////发生请求失败 返回结果事件
		})
	})
})