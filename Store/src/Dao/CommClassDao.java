package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.CommClass;

public class CommClassDao extends BaseDao{
	//获取分类列表
    public List<CommClass> getCommClass(int page, int limit){
    	String sql="SELECT cl.CommClass_Id,cl.parentClass,cl.CommClass_Name,COUNT(cd.CommClass_Id) commodiyCount,cl.isShow,cl.isNavShow,cl.keyWord,cl.ClassDescribe,cl.sort FROM commclass cl LEFT  JOIN commodity cd ON cl.CommClass_Id=cd.CommClass_Id GROUP BY cl.CommClass_Id LIMIT ?,?";
        List<CommClass> list=new ArrayList<CommClass>();
        Connection conn =getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
			ps=conn.prepareStatement(sql);
			if(page==1){
				ps.setInt(1, page-1);
				System.out.println(page-1);
			}else{
				ps.setInt(1, (page-1)*limit);
				System.out.println((page-1)*limit);
			}
			ps.setInt(2, limit);
			rs=ps.executeQuery();
			while(rs.next()){
				CommClass commcalss=new CommClass(rs.getInt("CommClass_Id"),rs.getInt("parentClass"), 
						rs.getString("CommClass_Name"), 
						rs.getInt("isShow"), 
						rs.getInt("isNavShow"), 
						rs.getString("keyWord"), 
						rs.getString("ClassDescribe"), 
						rs.getInt("sort"),
						rs.getInt("commodiyCount"));
				list.add(commcalss);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return list;
    }
    public int getcount(){
    	String sql="SELECT COUNT(*) FROM commclass cl";
    	Connection conn=getConnection();
    	PreparedStatement ps=null;
    	ResultSet rs=null;
    	int num=0;
    	try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				num=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeALL(rs,ps,conn);
		}
    	
    	return num;
    }
}
