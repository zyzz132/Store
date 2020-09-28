<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/25
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="sqlreq.*" %>
<%
    user userinfo=(user)session.getAttribute("Userinfo");
    if(userinfo instanceof admin){

        String prol=request.getParameter("prol");
        if(prol.equals("del")){
            String id=request.getParameter("ClassID");
            int bood=((admin)userinfo).delCommClass(id);
            out.print(bood);
        }else if(prol.equals("chx")){
            int id=Integer.parseInt(request.getParameter("id"));
            StringBuffer sb=new StringBuffer();
            sb.append("<option value=\"0\">请选择</option>");
            sb.append(((admin)userinfo).getFirstClass(id));
            out.print(sb.toString());
        }else{
            out.print(prol);
        }

    }

%>

