<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@include file="Header.jsp"%>
<link rel="stylesheet" href="css/regist.css">
<%--<script src="js/jquery-1.12.2.js"></script>--%>
<script src="js/Register.js"></script>>
<div>
    <header id="headNav">
    <div class="innerNav clear">
        <a class="fl" href="header.html"><img src="" alt=""></a>

        <div class="headFont fr">
            <span>您好，欢迎来到京东商城<a href="login.html">请登录</a></span>
            <a class="helpLink" href="#"><i class="runbun"></i>帮助中心<i class="turnb"></i></a>
        </div>
    </div>
</header>
<section id="secTab">
    <div class="innerTab">
        <h2>京东商城注册</h2>
        <form action="#">
            <div class="tableItem">
                <span class="userPhone">账号</span>
                <input type="text" required placeholder="账号"/>
            </div>
            <div class="tableItem">
                <span class="setPass">设置密码</span>
                <input type="password" required placeholder="密码"/>
            </div>
            <div class="tableItem">
                <span class="turePass">确认密码</span>
                <input type="password" required placeholder="确认密码"/>
            </div>
            <p class="clickRegist">点击注册，表示您同意京东商城 <a href="#">《服务协议》</a></p>
            <button class="tableBtn">同意协议并注册</button>
        </form>
    </div>
</section>
</body>

</div>