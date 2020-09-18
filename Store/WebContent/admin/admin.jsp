<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/19
  Time: 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="sqlreq.*" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>易购物</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../js/jquery-1.12.2.js" type="text/javascript"></script>
    <script src="js/admin.js" type="text/javascript"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">商品后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li> -->
        </ul>
        <% 	user userinfo=(user)session.getAttribute("Userinfo");
            if(userinfo!=null){
                if(userinfo.get_type()==3){
                %>
                    <ul class="layui-nav layui-layout-right">
                        <li class="layui-nav-item">
                            <a href="javascript:;">
                                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                                <span id="user_name"><%=userinfo.get_name()%></span>
                            </a>
                            <dl class="layui-nav-child">
                                <dd><a href="">基本资料</a></dd>
                                <dd><a href="">安全设置</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item"><a href="../index.jsp">网站首页</a></li>
                        <li class="layui-nav-item"><a href="../topic?prol=exit" id="ExitLogin">退出</a></li>
                    </ul>
            <%  }else { %>
                    <script>
                        alert("您不是管理人员，不能登录后台系统！");
                        location.href="login.jsp";
                    </script>
            <%}%>
        <% }else{%>
        <script>
            location.href="login.jsp";
        </script>
        <% }%>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="commclass.jsp"  target="myiframe">商品分类</a></dd>
                        <dd><a href="GoodsList.jsp" target="myiframe">商品管理</a></dd>
                        <dd><a href="BrandList.jsp" target="myiframe">品牌管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单记录</a>
                    <dl class="layui-nav-child">
                        <dd><a href="Bill.jsp"  target="myiframe">订单记录</a></dd>
                        <dd><a href="javascript:;">订单设置</a></dd>
                        <dd><a href="">退货处理</a></dd>
                        <dd><a href="">退货处理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">营销</a>
                    <dl class="layui-nav-child">
                        <dd><a href=""  target="myiframe">秒杀活动列表</a></dd>
                        <dd><a href=""  target="myiframe">优惠券列表</a></dd>
                        <dd><a href=""  target="myiframe">品牌推荐</a></dd>
                        <dd><a href=""  target="myiframe">新品推荐</a></dd>
                        <dd><a href=""  target="myiframe">人气推荐</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="UserList.jsp" target="myiframe">用户信息</a></dd>
                        <dd><a href="javascript:;">用户订单</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <iframe src="" frameborder="0" name="myiframe" width="100%" height="100%"></iframe>
    </div>
</div>
<script src="../layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
