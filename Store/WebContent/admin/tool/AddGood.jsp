<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/21
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="sqlreq.*" %>
<%
    user userinfo=(user)session.getAttribute("Userinfo");
    if(userinfo!=null){
        if(userinfo instanceof admin){

        }else{
            %><script>alert("您不是管理员！");location.href="../login.sjp";</script><%
        }

    }else{
        %>
<script>location.href="../login.sjp"</script>
    <%
    }
    String type=request.getParameter("prol");
    
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../../js/jquery-1.12.2.js"></script>
    <script>
	var types='<%=type%>';
	</script>
</head>
<body style="padding: 20px">
<div class="box_A addclassbox">
    <div class="lc_c">
        <div class="lc_c_l"><div class="bz_x"><div class="bz" style="color: #000;border-color: #000">1</div><div class="bz_xian"></div></div><div class="bz_text" style="color: #000">填写商品信息</div></div>
        <div class="lc_c_l"><div class="bz_x"><div class="bz">2</div><div class="bz_xian"></div></div><div class="bz_text">填写商品属性</div></div>
        <div class="lc_c_l"><div class="bz_x"><div class="bz">3</div></div><div class="bz_text">完成添加</div></div>
    </div>
    <form action="../../topic?prol=AddCommodity" method="post" class="layui-form formPadden">
    	<input type="hidden" name="types" value="<%=type %>">
        <div class="layui-form-item">
        <label class="layui-form-label">商品分类 :</label>
        <div class="layui-input-inline">
            <select name="CommClass_id_1" lay-filter="aihao" id="commclassA">
                <option value="0">请选择</option>
                <%
                    out.print(((admin) userinfo).getFirstClass(0));
                %>
            </select>
        </div>
        <div class="layui-input-inline">
            <select name="CommClass_id_2" class="selectB" >
                <option value="0">请选择</option>
            </select>
        </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称 :</label>
            <div class="layui-input-block">
                <input type="text" name="Commodity_name" lay-verify="required" autocomplete="off" placeholder="请输入商品名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">副标题 :</label>
            <div class="layui-input-block">
                <input type="text" name="subname" lay-verify="required" autocomplete="off" placeholder="请输入副标题" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品品牌 :</label>
            <div class="layui-input-inline">
                <select name="brand_id"  >
                    <option value="0">请选择</option>
                    <%
                        out.print(((admin) userinfo).getFirstClass(0));
                    %>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">商品介绍</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" name="Commodity_introduce"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品货号 :</label>
            <div class="layui-input-block">
                <input type="text" name="Commodity_No" lay-verify="title" autocomplete="off" placeholder="请输入商品货号" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品售价 :</label>
            <div class="layui-input-block">
                <input type="text" name="selling_price" lay-verify="title" autocomplete="off" placeholder="请输入商品售价" value="0.0" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">市场价 :</label>
            <div class="layui-input-block">
                <input type="text" name="market_price" lay-verify="title" autocomplete="off" placeholder="" value="0.0" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">存货 :</label>
            <div class="layui-input-block">
                <input type="text" name="warehousing" lay-verify="number" autocomplete="off" placeholder="" value="0" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">计量单位 :</label>
            <div class="layui-input-block">
                <input type="text" name="unit" lay-verify="title" autocomplete="off" placeholder="" value="件" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序 :</label>
            <div class="layui-input-block">
                <input type="text" name="sort" lay-verify="number" autocomplete="off" placeholder="" value="0" class="layui-input">
            </div>
        </div>
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">下一步</button>
            <!-- <button type="button" class="layui-btn" id="submit_a">下一步</button> -->
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>

</body>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('form', function(){
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
        form.on('select(aihao)', function(data){
            if(data.value>0){
                $.ajax({
                    url:'../../topic',
                    type:'post',
                    data:{id:data.value,prol:'chx'},
                    dataType:'text',
                    success:function (rst) {
                        if(rst.indexOf(""))
                        $(".selectB").html(rst);
                        form.render('select'); //刷新select选择框渲染
                    },
                    error:function(xhr){alert('jsp页面有错误！'+xhr.responseText);}
                })
            }
        });
    });

</script>
<script src="../js/Good.js"></script>
</html>
