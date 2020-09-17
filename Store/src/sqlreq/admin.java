package sqlreq;

import Dao.BaseDao;
import entity.CommClass;
import entity.Commodity;
import entity.CommodityTool;

import org.brand.Brand;
import org.brand.brandDao;

import java.sql.DriverManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class admin  extends user implements CommodityTool, brandDao {
    BaseDao bd=new BaseDao();
    public admin(String id,String name,String phone,String Email,int type,String time){
        super(id,name,phone,Email,type,time);

    }
    Connection conn=null;
    //添加商品分类
    public int AddClass(CommClass commClass){
        String sql="INSERT INTO commclass(CommClass_Name,parentClass,isShow,isNavShow,keyWord,ClassDescribe,sort) VALUES(?,?,?,?,?,?,?)";
        int num=0;
        num=bd.update(sql,commClass.getCommClass_Name(),
                commClass.getParentClass(),
                commClass.getIsShow(),
                commClass.getIsNavShow(),
                commClass.getKeyWrod(),
                commClass.getClassDescribe(),
                commClass.getSort());

        return num;
    }
    //获取一级分类
    public String getFirstClass(int id){
        String str="";
        Connection conn=bd.getConnection();
        Statement s=null;
        ResultSet st=null;
        try {
            s=conn.createStatement();
            st= s.executeQuery("SELECT * FROM commclass WHERE parentClass="+id);
            StringBuffer sb=new StringBuffer();
            while(st.next()){
                sb.append("<option value=\""+st.getInt("CommClass_Id")+"\">"+st.getString("CommClass_Name")+"</option>");
            }
            str=sb.toString();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            bd.closeALL(st,s,this.conn);
        }
        return str;
    }


    //获取分类列表
    public String getCommClass(String Page){
        int pages=Integer.parseInt(Page)-1;
        if(Integer.parseInt(Page)>=2){
            pages=(Integer.parseInt(Page)*10)-1;
        }
        String str="";
        Connection conn=bd.getConnection();
        Statement s=null;
        ResultSet st=null;
        try {
            s=conn.createStatement();
            st= s.executeQuery("SELECT * FROM commclass LIMIT "+pages+",10");
            StringBuffer sb=new StringBuffer();
            while(st.next()){
                sb.append("<tr>");
                sb.append("<td>"+st.getString("CommClass_Id")+"</td>");
                sb.append("<td>"+st.getString("CommClass_Name")+"</td>");

                sb.append("<td>"+st.getString("ClassDescribe")+"</td>");
                sb.append("<td>"+st.getString("CommClass_Id")+"</td>");
                if(st.getInt("isShow")==1){
                    sb.append("<td class=\"layui-form\"><input type=\"checkbox\" name=\"isShow\" lay-skin=\"switch\" checked></td>");
                }else{
                    sb.append("<td class=\"layui-form\"><input type=\"checkbox\" name=\"isShow\" lay-skin=\"switch\"></td>");
                }
                if(st.getInt("isNavShow")==1){
                    sb.append("<td class=\"layui-form\"><input type=\"checkbox\" name=\"isShow\" lay-skin=\"switch\" checked></td>");
                }else{
                    sb.append("<td class=\"layui-form\"><input type=\"checkbox\" name=\"isShow\" lay-skin=\"switch\"></td>");
                }
                sb.append("<td>"+st.getString("sort")+"</td>");
                sb.append("<td><button type=\"button\" class=\"layui-btn layui-btn-primary layui-btn-xs upbtn\">编辑</button>" +
                        "<button type=\"button\" class=\"layui-btn layui-btn-primary layui-btn-xs delbtn\" >删除</button></td>");
                sb.append("</tr>");
            }
            str=sb.toString();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            bd.closeALL(st,s,this.conn);
        }
        return str;
    }
    //删除指定分类
    public int delCommClass(String id){
        String sql="DELETE  FROM commclass WHERE CommClass_Id=?";
        int num=bd.update(sql,id);
        return num;
    }

    //获取商品列表
    public List<Commodity> getCommoditys(){
        List<Commodity> list= new ArrayList<Commodity>();
        Connection conn=bd.getConnection();
        String sql="SELECT * FROM commodity";
        try {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs!=null){
                while(rs.next()){
                    Commodity commd=new Commodity();
                    commd.setCommodity_Id(rs.getInt("Commodity_Id"));
                    commd.setCommodity_Name(rs.getString("Commodity_name"));
                    commd.setCommClass_Id(rs.getInt("CommClass_Id"));
                    commd.setSubname(rs.getString("subname"));
                    commd.setUnit(rs.getString("unit"));
                    commd.setBrand_id(rs.getInt("brand_id"));
                    commd.setCommodity_No(rs.getString("Commodity_No"));
                    commd.setWarehousing(rs.getInt("warehousing"));
                    commd.setSort(rs.getInt("sort"));
                    commd.setSelling_price(rs.getDouble("selling_price"));
                    commd.setMarket_price(rs.getDouble("market_price"));
                    commd.setWeight(rs.getString("weight"));
                    commd.setTime(rs.getString("Time"));
                    list.add(commd);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            bd.closeALL();
        }
        return list;
    }
    //添加品牌
    public int AddBrand(Brand brand) {
        String sql="INSERT INTO brand VALUES(NULL,?,?,?,?,?,?,?,?)";
        int num=bd.update(sql,
                brand.getBrand_name(),
                brand.getBrand_letter(),
                brand.getBrand_loginID(),
                brand.getBrand_bigImageID(),
                brand.getBrand_story(),
                brand.getSort(),
                brand.getIsShow(),
                brand.getBrand_manufacturer());

        return num;
    }
    //添加商品
    public int AddCommodity(Commodity commodity){
        String sql="INSERT INTO commodity VALUES(NULL,?,?,NOW(),?,?,?,?,?,?,?,?,null,?)";
        //INSERT INTO commodity VALUES(NULL,'苹果5s',1,NOW(),'ipaid','件',0,'xx0516512',100,0,2500,3000,'10.3g','苹果5s介绍')

        int num=bd.update(sql,commodity.getCommodity_Name(),
                commodity.getCommClass_Id(),
                commodity.getSubname(),
                commodity.getUnit(),
                commodity.getBrand_id(),
                commodity.getCommodity_No(),
                commodity.getWarehousing(),
                commodity.getSort(),
                commodity.getSelling_price(),
                commodity.getMarket_price(),
                commodity.getCommodity_introduce());
        return num;
    }
}
