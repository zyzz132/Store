var Udata;

$(function(){
	$.ajax({
		url:'req/getUserList.jsp' //发送请求地址
		,type:'post' //方式
		,data:{} //发生的参数
		,dataType:'JSON'//返回类型
		,success:function(rst){
			console.log(rst);
		}
		,error:function(xhr){alert('php页面有错误！'+xhr.responseText);}
	})
})