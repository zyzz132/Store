<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/9/1
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path=request.getScheme() + "://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/";
    pageContext.setAttribute("path",path);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../../js/jquery-1.12.2.js"></script>
</head>
<body style="padding: 20px">

<div class="box_A addclassbox">
    <form action="${path}topic" method="post" class="layui-form">
        <input type="hidden" name="prol" value="AddBran">
        <div class="layui-form-item">
            <label class="layui-form-label">品牌名称 :</label>
            <div class="layui-input-block">
                <input type="text" name="brand_name" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">品牌首字母 :</label>
            <div class="layui-input-block">
                <input type="text" name="brand_letter" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        <!--品牌logo-->
        <div class="layui-form-item">
            <label class="layui-form-label">品牌Logo :</label>
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test1">上传图片</button>
                <div class="layui-upload-list brand_logo">
                    <img class="layui-upload-img" id="brand_logo">
                    <p id="demoText1"></p>
                </div>
                <input type="hidden" name="brand_logoID" value="" id="file1">
            </div>
        </div>
        <!--品牌专区大图-->
        <div class="layui-form-item">
            <label class="layui-form-label">专区大图 :</label>
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test2">上传图片</button>
                <div class="layui-upload-list brand_logo">
                    <img class="layui-upload-img" id="brand_bigImage">
                    <p id="demoText2"></p>
                </div>
                <input type="hidden" name="brand_bigImageID" value="" id="file2">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">品牌故事 :</label>
            <div class="layui-input-block">
                <input type="text" name="brand_story" lay-verify="title" autocomplete="off"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序 :</label>
            <div class="layui-input-block">
                <input type="text" name="sort" lay-verify="title" autocomplete="off" value="0"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否显示 :</label>
            <div class="layui-input-block">
                <input type="checkbox" checked="" name="isShow" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">品牌制造商 :</label>
            <div class="layui-input-block">
                <input type="checkbox" checked="" name="brand_manufacturer" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
            </div>
        </div>
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>
</body>
<script src="../../layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

    });
    layui.use('upload', function() {
        var upload = layui.upload;

        //logo图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '${path}/File?brand=0' //改成您自己的上传接口
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#brand_logo').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                console.log(res.data);
                $('#file1').attr('value', res.data.id);
                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
        //品牌专区图片上传
        var uploadInst = upload.render({
            elem: '#test2'
            ,url: '${path}/File?brand=1' //改成您自己的上传接口
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#brand_bigImage').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                console.log( res.data);
                $('#file2').attr('value', res.data.id);
                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
    });


</script>
</html>
