$(function(){
	$("#addtype").click(function(){
		var CommType_Name=$("input[name='CommType_Name']").val();
		var CommType_Price=$("input[name='CommType_Price']").val();
		var CommType_Count=$("input[name='CommType_Count']").val();
		$.ajax({
			url:'../../TopicServlet',
			type:'post',
			data:{prol:'AddCommodiyType',Commodity_Id:3,CommType_Name:CommType_Name,CommType_Price:CommType_Price,CommType_Count},
			dataType:'json',
			success:function(rst){
				
			},error:function(rst){}
		})
	})
})