<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/21
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="sqlreq.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body style="padding: 20px">
<div class="box_B">
    <span>数据列表</span>
    <a href="tool/AddGood.jsp?prol=add" class="btn_B">添加</a>
</div>

<table id="demo" lay-filter="test"></table>


<script src="../layui/layui.js" charset="utf-8"></script>

<style>
	td>.layui-table-cell{height: 130px;padding: 10px;}
	td>.layui-table-cell>p{padding: 5px;}
	th>.layui-table-cell{height: 41px;line-height: 41px;}
</style>

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#demo'
            ,url:'../topic?prol=getCommoditysinfo'    
            ,align:'center'		
            ,page: true 
            ,cols: [[
                {field:'Commodity_Id', width:80, title: 'ID', sort: true,align:'center'	}
				,{field:'CommImage_Url',width:120,title:'商品图片',style:"height:80px",templet:function(d){
					return "<img src='../upload/"+d.CommImage_Url+"' alt='' style='width:80px;height: 80px;'/>"},align:'center'	}
                ,{title: '商品名称',align:'center',templet:function(d){
                	return '<p>'+d.Commodity_Name+'</p>'+'<p>'+d.CommClass_Id+'</p>';
                }}
                ,{width:200, title: '副标题',align:'center',templet:function(d){
                	return '<p>价格：￥'+d.selling_price+'</p>'+'<p>货号：'+d.Commodity_No+'</p>';
                }}
				,{width:150, title: '标签',align:'center'	,templet:function(d){
					var putawayHtml='<p>上架：<input type="checkbox" name="putaway" lay-skin="switch" lay-filter="switchTest" ></p>';
					if(d.putaway==1){
						putawayHtml='<p>上架：<input type="checkbox" checked="" name="putaway" lay-skin="switch" lay-filter="switchTest" ></p>';
					}
					var new_recommendHtml='<p>新品：<input type="checkbox" name="new_recommend" lay-skin="switch" lay-filter="switchTest" ></p>';
					if(d.new_recommend==1){
						new_recommendHtml='<p>新品：<input type="checkbox" checked="" name="new_recommend" lay-skin="switch" lay-filter="switchTest" ></p>';
					}
					var recommendHtml='<p>推荐：<input type="checkbox" name="recommend" lay-skin="switch" lay-filter="switchTest" ></p>';
					if(d.recommend==1){
						recommendHtml='<p>推荐：<input type="checkbox" checked="" name="recommend" lay-skin="switch" lay-filter="switchTest" ></p>';
					}
					return putawayHtml+new_recommendHtml+recommendHtml;
				}}
                ,{field:'sort', width:120,title: '排序', minWidth: 150,sort: true,align:'center'	}
                ,{width:80, title: 'SKU库',align:'center',templet:function(){}}
                ,{field:'market_price', width:135, title: '财富',align:'center'	 }
				,{title:'是否显示', width:130, templet:function(){
					var btn1='<button type="button" class="layui-btn layui-btn-primary layui-btn-sm">编辑</button>';
					var btn2='<button type="button" class="layui-btn layui-btn-primary layui-btn-sm">删除</button>';
					return btn1+btn2;
				}}
            ]]
        	,limit:5
			,limits:[5,10,15,20]

        });
    });
  //页面层

    layer.open({
      type: 1,
      skin: 'layui-layer-rim', //加上边框
      //area: ['420px', '240px'], //宽高
      content: 'html内容'
    });
</script>

</body>
</html>