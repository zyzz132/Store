$(function () {
    $("input[name='btn']").click(function () {
        var name=$("input[name='User_Name']").val();
		var pwd=$("input[name='password']").val();
		var repwd=$("input[name='re_password']").val();
		var phone=$("input[name='phone']").val();
		var email=$("input[name='Email']").val();
		if(pwd != repwd){
            alert("两次密码不一致！");
            return;
		}
		$.ajax({
			url:'topic' //发送请求地址
			,type:'post' //方式
			,data:{UserName:name,password:pwd,Phone:phone,Email:email} //发生的参数
			,dataType:'text'//返回类型
			,success:function(rst){
				rst=rst.replace(" ","");

				if(rst.indexOf("ID")>0){
					var xxs=rst.split(";");
					for(var i=0;i<xxs.length;i++){
						xxs[i]=xxs[i].substring(xxs[i].indexOf(":")+1,xxs[i].length);
					}
					console.log(xxs);
				}
			}
			,error:function(xhr){console.log('jsp页面有错误！'+xhr.responseText);
				$("#cons").html(xhr.responseText);
			}
		})
        
    })
})