<%@ page language="java" contentType="text/html;charset=utf-8" import="sqlreq.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
	<script src="js/jquery-1.12.2.js"></script>
	<script src="js/head.js"></script>
	<link rel="stylesheet" href="layui/css/layui.css">
	<script src="layui/layui.js"></script>
</head>
<body>
<div class="head">
	<div class="top_1">
		<div class="nav_top">
			<ul class="kjsc">
				<li><a href="index.jsp">首页</a></li>
				<li><a href="">武汉</a></li>
			</ul>
			<ul class="loginInfo">
				<% 	user userinfo=(user)session.getAttribute("Userinfo");
					if(userinfo!=null){%>
					<li><a href="" id="user_info"><%=userinfo.get_name()%></a></li>
					<li><a href="">我的订单</a></li>
				<% 	}else{%>
					<li><a href="login.jsp" id="login_a">登录</a></li>
					<li><a href="admin/admin.jsp" >后台</a></li>
					<li><a href="Register.jsp" id="reg_a">注册</a></li>
				<%	}%>

			</ul>
		</div>
	</div>
	<div class="top_2">
		<div class="logo"><img src="images/logo.png" width=100%></div>
		
		<%@ include file="tool/searc.jsp" %>
		<%@ include file="tool/Shopping.jsp" %>
	</div>
	
</div>