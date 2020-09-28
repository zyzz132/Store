<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/22
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@page import="Dao.CommClassDao"%>
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
        	CommClassDao ccd=new CommClassDao();
            String p=request.getParameter("page");
            String limi=request.getParameter("limit");
        	int pages=1;
        	int limit=10;
            if(p!=null){
            	pages =Integer.parseInt(p);
            }else{
            	pages=1;
            }
            if(limi!=null){
            	limit=Integer.parseInt(limi);
            }
            user userinfo=(user)session.getAttribute("Userinfo");
            if(userinfo!=null){
                if(userinfo instanceof admin){
                    String date=((admin) userinfo).getCommClass(pages,limit);
                    out.print(date);
                }

            }
        %>
    </tbody>
    <script>
    	var Count=<%=ccd.getcount()%>;
    </script>
</table>

	<div id="test1"></div>

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
		layui.use('laypage', function(){
		  var laypage = layui.laypage;
		  
		  //执行一个laypage实例
		  laypage.render({
		    elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
		    ,count: Count //数据总数，从服务端得到
		    ,curr:2
			,hash: 'fenye' //自定义hash值
				,jump: function(obj, first){
			        
			        //首次不执行
			        if(!first){
			          //obj包含了当前分页的所有参数，比如：
			          console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
			          console.log(obj.limit); //得到每页显示的条数
			          location.href="commclass.jsp?page="+obj.curr+"&limit="+obj.limit;
			        }
			      }
		  });

		});

    </script>
</body>
</html>
