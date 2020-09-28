<%@ page language="java" contentType="text/html;charset=utf-8"  %>
    <link rel="stylesheet" href="css/logandreg.css">
<script src="js/jquery-1.12.2.js"></script>
    <script src="js/login.js"></script>
    <%@ include file="Header.jsp" %>
<section id="secBody">
    <div class="innerBody clear">
        <!--主页面图片-->
        <img class="fl" src="images/" alt=""/>
        <div class="tableWrap fr">
            <form action="#">
                <div class="tableTap clear">
                    <h3 class="fl">易购物用户登录</h3>
                    <a class="fr" href="Register.jsp">注册账号</a>
                </div>
                <div class="tableItem">
                    <i class="userHead"></i>
                    <input type="text" placeholder="邮箱/手机/用户名" name="userName" required />
                </div>
                <div class="tableItem">
                    <i class="userLock"></i>
                    <input type="password" placeholder="密码" name="pwd" required/>
                </div>
                <div class="tableAuto clear">
                    <a class="autoMatic fl" href="#">
                        <input class="loadGiet"  type="checkbox"/>自动登录</a>
                    <a class="fr" href="#">忘记密码？</a>
                </div>
                <input type="button" class="tableBtn" id="btnLogin" value="登录">
            </form>
            <h2 class="moreWeb">更多合作网站账号登录</h2>
            <div class="outType clear">
                <ul class="loadType clear">
                    <li class="fl"><a href="#"></a></li>
                    <li class="fl"><a href="#"></a></li>
                    <li class="fl"><a href="#"></a></li>
                    <li class="fl"><a href="#"></a></li>
                    <li class="loadMore fr">更多合作网站<i></i></li>
                </ul>

    </div>
</section>