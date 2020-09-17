package org.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.brand.Brand;
import entity.CommodityType;
import entity.CommClass;
import entity.Commodity;
import sqlreq.*;

public class TopicServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
        resp.setContentType("");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        user userinfo=(user)request.getSession().getAttribute("Userinfo");
        String prol=request.getParameter("prol");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        switch(prol){
            case "login":
                this.login(request,response,out,session);
                break;
            case "exit":
                this.exit(response,out,session);
                break;
            case "regiser":
                register(request,response,out,userinfo);
                break;
            case "AddClass":
                this.AddCommClass(request,response,out,userinfo);
                break;
            case "delCommClass":
                this.DelCommClass(request,response,out,userinfo);
                break;
            case "getCommoditysinfo":
                this.getCommoditys(out,userinfo);
                break;
            case "AddCommodity":
                this.AddCommodity(request,response,out,userinfo);
                break;
            case "AddBran":
                this.AddBrand(request,response,out,userinfo);
                break;
            case "AddCommodiyType":
            	
            	break;
                default:
                    out.println("url错误！");
        }
    }
    public void login(HttpServletRequest request, HttpServletResponse response,PrintWriter out,HttpSession session){
        String Uname=request.getParameter("userName");
        String Pwd=request.getParameter("pwd");
        mysqlConn comm=new mysqlConn();
        user userInfo= comm.login(Uname,Pwd);
        if(userInfo!=null){
            session.setAttribute("Userinfo",userInfo);
            out.print(true);
        }else{
            out.print(false);
            
        }
    }
    //退出登录
    public void exit( HttpServletResponse response,PrintWriter out,HttpSession session){
        session.removeAttribute("userName");
        session.invalidate();
        try {
            response.sendRedirect("login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //注册用户
    public void register(HttpServletRequest request, HttpServletResponse response,PrintWriter out,user userinfo){
        String User_Name=request.getParameter("User_Name");
        String PassWord=request.getParameter("password");
        String Phone=request.getParameter("phone");
        String Email=request.getParameter("Email");
        mysqlConn conn=new mysqlConn();
        System.out.println(User_Name);
        int ss=conn.AddUser(User_Name,PassWord,Phone,Email);
        if(ss>=1){
            out.print("注册成功");
        }else{
            out.print("注册失败");
        }
    }
    //添加商品分类
    public void AddCommClass(HttpServletRequest request, HttpServletResponse response,PrintWriter out,user userinfo){

        String ClassName=request.getParameter("ClassName");
        int parentClass=Integer.parseInt(request.getParameter("parentClass"));
        int sort=Integer.parseInt(request.getParameter("sort"));
        int isShow=0;
        if(request.getParameter("isShow")!=null){
            isShow=1;
        }
        int isNavShow=0;
        if(request.getParameter("isNavShow")!=null){
            isNavShow=1;
        }
        String keyWord=request.getParameter("keyWord");
        String ClassDescribe=request.getParameter("ClassDescribe");
        if(userinfo instanceof admin){
            CommClass commClass=new CommClass(parentClass,ClassName,isShow,isNavShow,keyWord,ClassDescribe,sort);
            int isAdd=((admin) userinfo).AddClass(commClass);
            if(isAdd>=1){
                out.print("添加成功");
            }else{
                out.print("添加失败"+ClassName+","+parentClass+","+isShow+","+isNavShow+","+keyWord+","+ClassDescribe+","+sort);
            }
        }
    }
    //删除商品分类
    public void DelCommClass(HttpServletRequest request, HttpServletResponse response,PrintWriter out,user userinfo){
        String id=request.getParameter("ClassID");
        int bood=((admin)userinfo).delCommClass(id);
        out.print(bood);
    }
    //获取商品信息表
    public void getCommoditys(PrintWriter out,user userinfo){
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
    //添加商品
    public void AddCommodity(HttpServletRequest request, HttpServletResponse response,PrintWriter out,user userinfo){
        int CommClass_id_1=Integer.parseInt(request.getParameter("CommClass_id_1"));
        int CommClass_id_2=Integer.parseInt(request.getParameter("CommClass_id_2"));
        int CommClass_id=0;
        if(CommClass_id_2>0){
            CommClass_id=CommClass_id_2;
        }else{
            CommClass_id=CommClass_id_1;
        }
        Commodity commd=new Commodity();
        commd.setCommodity_Name(request.getParameter("Commodity_name"));
        commd.setSubname(request.getParameter("subname"));
        commd.setCommClass_Id(CommClass_id);
        commd.setBrand_id(Integer.parseInt(request.getParameter("brand_id")));
        commd.setCommodity_No(request.getParameter("Commodity_No"));
        commd.setSelling_price(Double.parseDouble(request.getParameter("selling_price")));
        commd.setMarket_price(Double.parseDouble(request.getParameter("market_price")));
        commd.setUnit(request.getParameter("unit"));
        commd.setSort(Integer.parseInt(request.getParameter("sort")));
        commd.setCommodity_introduce(request.getParameter("Commodity_introduce"));
        commd.setWarehousing(Integer.parseInt(request.getParameter("warehousing")));

        int num=((admin)userinfo).AddCommodity(commd);
        if(num>=1){
            out.println("{\"code\":1}");
        }else{
            out.println("{\"code\":0}");
        }

    }
    //添加品牌
    public void AddBrand(HttpServletRequest request, HttpServletResponse response,PrintWriter out,user userinfo){
        Brand brand=new Brand();
        brand.setBrand_name(request.getParameter("brand_name"));
        brand.setBrand_letter(request.getParameter("brand_letter"));
        brand.setBrand_loginID(Integer.parseInt(request.getParameter("brand_logoID")));
        brand.setBrand_bigImageID(Integer.parseInt(request.getParameter("brand_bigImageID")));
        brand.setBrand_story(request.getParameter("brand_story"));
        brand.setSort(Integer.parseInt(request.getParameter("sort")));
        int isShwo=0;
        if(request.getParameter("isShow")!=null){
            isShwo=1;
        }
        brand.setIsShow(isShwo);
        int brand_manufacturer=0;
        if(request.getParameter("brand_manufacturer")!=null){
            brand_manufacturer=1;
        }
        brand.setBrand_manufacturer(brand_manufacturer);
        if(userinfo instanceof admin){
            int num=((admin) userinfo).AddBrand(brand);
            out.println("{\"code\":"+num+"}");
        }
        System.out.println(request.getParameter("brand_name")+","+
                request.getParameter("brand_letter")+","+
                request.getParameter("brand_logoID")+","+
                request.getParameter("brand_bigImageID")+","+
                request.getParameter("brand_story")+","+
                request.getParameter("sort")+","+
                request.getParameter("isShow")+","+
                request.getParameter("brand_manufacturer"));
    }
    //添加商品属性
    public void AddCommodiyType(HttpServletRequest request ,HttpServletResponse response,PrintWriter out,user userinfo){
    	CommodityType CommType=new CommodityType();
    	String CommType_Name=request.getParameter("CommType_Name");
    	String CommType_PriceS=request.getParameter("CommType_Price");
    	int Commodity_Id=Integer.parseInt(request.getParameter("Commodity_Id"));
    	double CommType_Price=0;
    	int CommType_Count=0;
    	if(CommType_PriceS!=null){
    		CommType_Price =Double.parseDouble(CommType_PriceS);
    	}
    	String CommType_CountS=request.getParameter("CommType_Count");
    	if(CommType_CountS!=null){
    		CommType_Count=Integer.parseInt(CommType_CountS);
    	}
    	CommType.setCommType_Name(CommType_Name);
    	CommType.setCommType_Price(CommType_Price);
    	CommType.setCommType_Name(CommType_Name);
    	CommType.setCommodity_Id(Commodity_Id);
    	
    }
}
