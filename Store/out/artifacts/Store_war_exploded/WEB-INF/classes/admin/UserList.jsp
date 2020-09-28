<%@ page import="sqlreq.UserInfo" %><%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/19
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="sqlreq.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
	<script src="../js/jquery-1.12.2.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body style="padding: 20px">

<table lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox', width:50}"></th>
        <th lay-data="{field:'id', width:100}">ID</th>
        <th lay-data="{field:'name', width:200}">用户名</th>
        <th lay-data="{field:'email'}">邮箱</th>
        <th lay-data="{field:'type'}">会员类型</th>
        <th lay-data="{field:'time'}">注册时间</th>
        <th lay-data="{field:'newtime'}">最后登录时间</th>
    </tr>
    </thead>
    <tbody>
    <%--<tr>--%>
        <%--<td>贤心1</td>--%>
        <%--<td>66</td>--%>
        <%--<td>人生就像是一场修行a</td>--%>
        <%--<td>12321</td>--%>
        <%--<td>1253153</td>--%>
    <%--</tr>--%>
    <%

        mysqlConn comm=new mysqlConn();
        String data=comm.loadUser();
        if(data!=null){
            out.print(data);
        }

    %>
    </tbody>
</table>



<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table;
        //转换静态表格
        table.init('demo', {
            height: 315 //设置高度
            ,limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            //支持所有基础参数
        });
    });
</script>
<%--<script src="js/userlist.js"></script>--%>
</body>
</html>
