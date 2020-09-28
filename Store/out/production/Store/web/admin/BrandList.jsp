<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/9/2
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%@page import="Dao.BrandDao"%>
<%@page import="entity.BrandList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="padding: 20px">
    <div class="box_B">
        <span>数据列表</span>
        <a href="tool/AddBrand.jsp" class="btn_B">添加</a>
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
        	String pages=request.getParameter("page");
        	int CurrPageNo=1;
        	if(pages!=null){
        		if(Integer.parseInt(pages)!=0){
        			CurrPageNo=(Integer.parseInt(pages)-1)*10;
        		}
        		
        		
        	}
        	//BrandList brand=new BrandList();
        	//BrandDao bDao=new BrandDao();
        	//int count=bDao.getBrandCount();
        	//brand.setTotalNums(count);
        	//bDao.getBrandInfo(CurrPageNo, 10);
        	
        	
        %>
    </tbody>
</body>
</html>
