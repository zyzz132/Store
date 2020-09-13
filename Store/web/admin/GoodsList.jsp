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
    <a href="tool/AddGood.jsp" class="btn_B">添加</a>
</div>

<table id="demo" lay-filter="test"></table>


<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#demo'
            ,height: 312
            ,url:'../topic?prol=getCommoditysinfo'
            ,page: true //开启分页
            ,cols: [[
                {field:'Commodity_Id', width:80, title: 'ID', sort: true}
                ,{field:'Commodity_Name', width:200, title: '商品名称'}
                ,{field:'Commodity_No', width:120, title: '商品货号', sort: true}
                ,{field:'subname', width:80, title: '城市'}
                ,{field:'brand_id', title: '签名', minWidth: 150}
                ,{field:'Commodity_introduce', width:80, title: '积分', sort: true}
                ,{field:'Commodity_No', width:80, title: '评分', sort: true}
                ,{field:'selling_price', width:80, title: '职业'}
                ,{field:'market_price', width:135, title: '财富', sort: true}
            ]]

        });
    });
</script>

</body>
</html>