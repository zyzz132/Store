<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@include file="Header.jsp"%>
<link rel="stylesheet"href="css/logandreg.css">
<%--<script src="js/jquery-1.12.2.js"></script>--%>
<script src="js/Register.js"></script>>
<div>
   <section id="secBody">
    <div class="innerBody clear">
        <!--主页面图片-->
        <img class="fl" src="images/" alt=""/>
        <div class="tableWrap fr">
            <form action="#">
                <div class="tableTap clear">
                    <h3 class="fl">易购物商城用户注册</h3>
                </div>
                <div class="tableItem">
                    <i class="userHead"></i>
                    <input type="text" placeholder="邮箱/手机/用户名" required />
                </div>
                <div class="tableItem">
                    <i class="userLock"></i>
                    <input type="password" placeholder="设置密码" required/>
                </div>
                <div class="tableItem">
                    <i class="userLock"></i>
                    <input type="password" placeholder="确认密码" required/>
                </div>
                <p class="clickRegist">点击注册，表示您同意易购物商城 <a href="#">《服务协议》</a></p>
                <button class="tableBtn">同意协议并注册</button>
            </form>
</section>
</body>

</div>