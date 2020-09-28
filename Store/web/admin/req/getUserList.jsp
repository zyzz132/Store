
<%@ page contentType="text/html;charset=UTF-8" language="java" import="sqlreq.*" %>

<%
    mysqlConn comm=new mysqlConn();
    out.print(comm.loadUser());

%>

