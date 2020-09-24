
var page=0;
$(function(){
	$("#addtype").click(function(){
		var CommType_Name=$("input[name='CommType_Name']").val();
		var CommType_Price=$("input[name='CommType_Price']").val();
		var CommType_Count=$("input[name='CommType_Count']").val();
		if(CommType_Name!="" && CommType_Price!=""&& CommType_Count!=""){
			$.ajax({
				url:'../../topic',
				type:'post',
				data:{prol:'AddCommodiyType',Commodity_Id:3,CommType_Name:CommType_Name,CommType_Price:CommType_Price,CommType_Count:CommType_Count},
				dataType:'json',
				success:function(rst){
					console.log(rst);
					if(rst.code==1){
						$("input[name='CommType_Name']").val("");
						$("input[name='CommType_Price']").val("");
						$("input[name='CommType_Count']").val("");
						RefreshCommType();
					}else{
							alert("删除失败");
					}
				},error:function(rst){alert("出错");}
			})
		}else{
			alert("请填写规格信息");
		}
		
	});

})
function RefreshCommType(){
	$.ajax({
		url:'../../topic',
		type:'post',
		data:{prol:'SelectCommType',loadtypeT:types},
		dataType:'json',
		success:function(rst){
			console.log(rst);
			if(rst.code==1){
				$("#Commtype").html("");
				for(var i=(page*5);i<page*5+5;i++){
					var $tr =$("<tr></tr>");
					var $td1=$("<td>"+rst.data[i].CommType_Name+"</td>");
					var $td2=$("<td>"+rst.data[i].CommType_Price+"</td>");
					var $td3=$("<td>"+rst.data[i].CommType_Count+"</td>");
					var $td4=$("<td><a href='javascript:isdel("+rst.data[i].no+")' id="+rst.data[i].no+">删除</a></td>");
					$tr.append($td1);
					$tr.append($td2);
					$tr.append($td3);
					$tr.append($td4);
					$("#Commtype").append($tr);
				}
			}
		},error:function(rst){alert("出错");}
	})
}
function delCommType(e){
	$.ajax({
		url:'../../topic',
		type:'post',
		data:{prol:'delCommodiyType',no:e},
		dataType:'json',
		success:function(rst){
			console.log(rst);
			if(rst.code==1){
				RefreshCommType();
			}else{
				alert("添加失败");
			}
		},error:function(rst){alert("出错");}
	})
}
