<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/21
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
</head>
<body>
<table class="layui-table" lay-data="{height:315, url:'/demo/table/user/', page:true, id:'test'}" lay-filter="test">
    <thead>
    <tr>
        <th lay-data="{field:'id', width:80, sort: true}">ID</th>
        <th lay-data="{field:'username', width:80}">用户名</th>
        <th lay-data="{field:'sex', width:80, sort: true}">性别</th>
        <th lay-data="{field:'city'}">城市</th>
        <th lay-data="{field:'sign'}">签名</th>
        <th lay-data="{field:'experience', sort: true}">积分</th>
        <th lay-data="{field:'score', sort: true}">评分</th>
        <th lay-data="{field:'classify'}">职业</th>
        <th lay-data="{field:'wealth', sort: true}">财富</th>
    </tr>
    </thead>
</table>
</body>
</html>
