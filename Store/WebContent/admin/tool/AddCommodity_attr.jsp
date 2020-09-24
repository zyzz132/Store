<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/31
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@page import="entity.Commodity"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% 
	String type=request.getParameter("types");
%>
<% String path=request.getScheme() + "://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/";
    pageContext.setAttribute("path",path);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <script src="../../js/jquery-1.12.2.js"></script>
    <script src="../js/AddCommodiy_attr.js"></script>
    <style>
    	.layui-upload-img{
    	width: 120;
    	height: 120;}
    </style>
</head>
<body style="padding: 20px">
<script>
	var types='<%=type%>';
</script>
<div class="box_A addclassbox">
    <div class="lc_c">
        <div class="lc_c_l lc_wc"><div class="bz_x"><div class="bz" >1</div><div class="bz_xian"></div></div><div class="bz_text" >填写商品信息</div></div>
        <div class="lc_c_l lc_che"><div class="bz_x"><div class="bz">2</div><div class="bz_xian"></div></div><div class="bz_text">填写商品属性</div></div>
        <div class="lc_c_l"><div class="bz_x"><div class="bz">3</div></div><div class="bz_text">完成添加</div></div>
    </div>
    <div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品规格 :</label>
            <div class="layui-input-block">
                <div class="addTypex">
                    <p >规格名称:  <input type="text" name="CommType_Name" required lay-verify="required" placeholder="请输入规格名称" autocomplete="off" class="layui-input"></p>
                    <p>价格:<input type="text" name="CommType_Price" lay-verify="title" autocomplete="off" placeholder="价格" class="layui-input"></p>
                    <p>存库:<input type="text" name="CommType_Count" lay-verify="title" autocomplete="off"  class="layui-input"></p>
                    <button type="button" class="layui-btn layui-btn-primary" id="addtype">添加</button>
                </div>
                <table id="talbe_a">
                    <thead>
                        <tr><th>规格名称</th><th>规格价格</th><th>规格存库</th><th>操作删除</th></tr>
                    </thead>
                    <tbody id="Commtype">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品相册 :</label>
            <div class="layui-input-block">
                <div class="layui-upload">
				  <button type="button" class="layui-btn" id="test2">多图片上传</button> 
				  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
				    预览图：
				    <div class="layui-upload-list" id="demo2"></div>
				 </blockquote>
				</div>
            </div>
        </div>
        <form action="${path}topic?prol=submitCommd" method="post" class="layui-form">
        	<div class="layui-form-item">
        		<label class="layui-form-label">商品上架 :</label>
        		<div class="layui-input-block">
                	<input type="checkbox" checked="" name="putaway" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
           	 	</div>
        	</div>
        	<div class="layui-form-item">
        		<label class="layui-form-label">商品推荐 :</label>
        		<div class="layui-input-block">
        			<input type="checkbox" checked="" name="new_recommend" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
                	<input type="checkbox" checked="" name="recommend" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
           	 	</div>
        	</div>
			<div class="layui-form-item">
        		<label class="layui-form-label">服务保证 :</label>
        		<div class="layui-input-block">
                	<input type="checkbox" name="guarantee" title="无忧退货" checked="">
      				<input type="checkbox" name="guarantee" title="快速退货" checked="">
      				<input type="checkbox" name="guarantee" title="免费包邮" checked="">
           	 	</div>
        	</div>
	        <div class="layui-input-block">
	        	<button type="submit" class="layui-btn" id="submit_a">提交</button>
	        </div>
        </form>
        
    </div>
</div>
</body>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script>
	
    layui.use('form', function() {
        var form = layui.form;
    });
    RefreshCommType();
	function isdel(e){
		layer.confirm('是否删除', {
		  btn: ['是','否'] //按钮
		}, function(){
			delCommType(e);
		  layer.msg('已删除', {icon: 1});
		}, function(){
		  
		});
	}
	
  layui.use('upload', function(){
	  var upload = layui.upload;
	   
	//多图片上传
	  upload.render({
	    elem: '#test2'
	    ,url: '../../File?filetype=commodit' //改成您自己的上传接口
	    ,multiple: true
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
	      });
	    }
	    ,done: function(res){
	      //上传完毕
	      console.log(res);
	    }
	  });
	});
  
</script>

</html>
