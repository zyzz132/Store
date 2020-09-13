<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/22
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="sqlreq.*" %>
<html>
<head>
    <title>Title</title>
    <script src="../js/jquery-1.12.2.js"></script>
    <script src="js/commclass.js"></script>
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="tool box_B">
        <span>数据列表</span>
        <a href="tool/AddClass.jsp"  target="myiframe"  class="btn_B">添加</a>
    </div>


<table border="0" cellspacing="0"cellpadding="0" id="talbe_a">
    <thead>
    <tr>
        <th width="60px">编号</th>
        <th>分类名称</th>
        <th>分类描述</th>
        <th>商品数量</th>
        <th width="70">导航显示</th>
        <th width="70">是否显示</th>
        <th>排序</th>
        <th width="100">操作</th>
    </tr>
    </thead>
    <tbody>
        <%
            String Page=request.getParameter("Page");
            if(Page==null){
                Page="1";
            }
            user userinfo=(user)session.getAttribute("Userinfo");
            if(userinfo!=null){
                if(userinfo instanceof admin){
                    String date=((admin) userinfo).getCommClass(Page);
                    out.print(date);
                }

            }
        %>
    </tbody>
</table>
    <div class="page_ye">
        <%
            out.print("<div>上一页</div>"+"<div>下一页</div>");
        %>
    </div>

<script src="../layui/layui.js" charset="utf-8"></script>

    <script>
        layui.use('table', function(){
            var table = layui.table;
            //转换静态表格
            table.init('demo', {
                height: 315 //设置高度
                ,limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
                //支持所有基础参数
            });
        });


    </script>
</body>
</html>
