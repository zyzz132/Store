<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/22
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="sqlreq.*" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../../layui/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="box_A addclassbox">
    <form action="../../topic" method="post" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">分类名称 :</label>
            <div class="layui-input-block">
                <input type="text" name="ClassName"  lay-verify="required" autocomplete="off" placeholder="请输入商品分类" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上级分类 :</label>
            <div class="layui-input-inline">
                <select name="parentClass">
                    <option value="0">请选择上级分类</option>
                    <%
                        user userinfo=(user)session.getAttribute("Userinfo");
                        if(userinfo!=null){
                            if(userinfo instanceof admin){
                                String date=((admin) userinfo).getFirstClass(0);
                                out.print(date);
                            }

                        }
                    %>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序 :</label>
            <div class="layui-input-block">
                <input type="text" name="sort" lay-verify="number" value="0" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否显示</label>
            <div class="layui-input-block">
                <input type="checkbox" checked="" name="isShow" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">导航显示</label>
            <div class="layui-input-block">
                <input type="checkbox" name="isNavShow" lay-skin="switch" lay-text="ON|OFF">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">关键词 :</label>
            <div class="layui-input-block">
                <input type="text" name="keyWord" lay-verify="title" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">分类描述 :</label>
            <div class="layui-input-block">
                <input type="text" name="ClassDescribe" lay-verify="title" autocomplete="off"class="layui-input">
            </div>
        </div>
        <input type="hidden" name="prol" value="AddClass">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

    });

    
</script>
</body>
</html>
