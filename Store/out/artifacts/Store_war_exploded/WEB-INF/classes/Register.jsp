<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@include file="Header.jsp"%>
<%--<script src="js/jquery-1.12.2.js"></script>--%>
<script src="js/Register.js"></script>>
<div>
    <form action="topic" method="post">
        <p>用户名：<input type="text" name="User_Name"></p>
        <p>手机号：<input type="text" name="phone"></p>
        <p>邮箱：<input type="email" name="Email"></p>
        <p>密码：<input type="password" name="password"></p>
        <p>确认密码：<input type="password" name="re_password"></p>
        <input type="hidden" name="prol" value="register">
        <input type="submit" name="btn" value="注册">
        <div id="cons"></div>
    </form>

</div>