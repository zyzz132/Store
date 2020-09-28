<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/9/4
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="File" method="post" enctype="multipart/form-data">
    用户名:<input type="text" name="username"><br>
    密码:<input type="text" name="pwd"><br>
    <input type="file" name="file">
    <input type="submit" value="提交">
</form>
</body>
</html>
