<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/31
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../../layui/css/layui.css">
</head>
<body style="padding: 20px">
<div class="box_A addclassbox">
    <div class="lc_c">
        <div class="lc_c_l lc_wc"><div class="bz_x"><div class="bz" >1</div><div class="bz_xian"></div></div><div class="bz_text" >填写商品信息</div></div>
        <div class="lc_c_l lc_che"><div class="bz_x"><div class="bz">2</div><div class="bz_xian"></div></div><div class="bz_text">填写商品属性</div></div>
        <div class="lc_c_l"><div class="bz_x"><div class="bz">3</div></div><div class="bz_text">完成添加</div></div>
    </div>
    <div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品货号 :</label>
            <div class="layui-input-block">
                <div class="addTypex">

                    <p >规格名称:  <input type="text" name="" required lay-verify="required" placeholder="请输入规格名称" autocomplete="off" class="layui-input"></p>
                    <p>价格:<input type="text" name="" lay-verify="title" autocomplete="off" placeholder="价格" class="layui-input"></p>
                    <p>存库:<input type="text" name="" lay-verify="title" autocomplete="off"  class="layui-input"></p>
                    <button type="button" class="layui-btn layui-btn-primary">添加</button>
                </div>
                <table>

                </table>
            </div>
        </div>
    </div>
</div>
</body>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('form', function() {
        var form = layui.form;
    });
</script>
</html>
