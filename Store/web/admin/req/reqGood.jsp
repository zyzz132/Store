<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/8/29
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="sqlreq.*" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Commodity" %>
<%
    user userinfo=(user)session.getAttribute("Userinfo");
    if(userinfo instanceof admin){
        List<Commodity> list=((admin) userinfo).getCommoditys();
        //out.print(list.get(0).getSelling_price()+",\"market_price\":"+list.get(0).getMarket_price()+",\"warehousing\":"+list.get(0).getWarehousing()+",\"unit\":\"");
        StringBuffer json=new StringBuffer("{\"code\":0,\"msg\":\"\",\"count\":"+list.size()+",\"data\":[");
        for(int i=0;i<list.size();i++){
            String node="{\"Commodity_Id\":"+list.get(i).getCommodity_Id()+",\"Commodity_Name\":\""+list.get(i).getCommodity_Name()+
                    "\",\"CommClass_Id\":"+list.get(i).getCommClass_Id()+",\"subname\":\""+list.get(i).getSubname()+"\",\"brand_id\":"+list.get(i).getBrand_id()+
                    ",\"Commodity_introduce\":\""+list.get(i).getCommodity_introduce()+"\",\"Commodity_No\":\""+list.get(i).getCommodity_No()+"\",\"selling_price\":"+
                    list.get(i).getSelling_price()+",\"market_price\":"+list.get(i).getMarket_price()+",\"warehousing\":"+list.get(i).getWarehousing()+",\"unit\":\""+
                    list.get(i).getUnit()+"\",\"weight\":\""+list.get(i).getWeight()+"\",\"sort\":"+list.get(i).getSort()+",\"Time\":\""+list.get(i).getTime()+"\"}";
            json.append(node);
            if(i<list.size()-1){
                json.append(",");
            }
        }
        json.append("]}");
        out.print(json.toString());
    }
%>
