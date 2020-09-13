<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/19
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="sqlreq.mysqlConn" %>
<html>
<head>
    <head>
        <title></title>
        <script src="../js/jquery-1.12.2.js" type="text/javascript"></script>
        <script src="js/login.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/style.css">
    </head>
<body style="background-color: #2E2D3C">
    <div class="admin_login_box">
        <form action="" method="post">
            <div class="rlogo">商品后台登录</div>
            <div class="line"><input type="text" id="name" placeholder="用户名" class="inputtext"></div>
            <div class="line"><input type="password" id="pwd" placeholder="密码" class="inputtext"></div>
            <div class="login_btn"><input type="button" value="登录"></div>
        </form>
    </div>
</body>
</html>
