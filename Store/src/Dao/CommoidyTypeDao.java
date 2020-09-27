package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import entity.CommodityType;

public class CommoidyTypeDao extends BaseDao{
	public int AddCommType(CommodityType commType){
		//StringBuffer sb=new StringBuffer("INSERT INTO commodity_type VALUES");
		String sql="INSERT INTO commodity_type VALUES(NULL,?,?,?,?)";
//		for(int i=0;i<commTypeList.size();i++){
//			sb.append("(NULL,?,?,?,?)");
//			if(i!=commTypeList.size()-1){
//				sb.append(",");
//			}
//		}
		int num=update(sql, 
				commType.getCommodity_Id(),
				commType.getCommType_Name(),
				commType.getCommType_Price(),
				commType.getCommType_Count());
		
		return num;
	}
	//获取所有商品规格
	public List<CommodityType> getCommTypes(){
		String sql="SELECT * FROM commodity_type";
		List<CommodityType> list =new ArrayList<CommodityType>();
		Connection conn=getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs!=null){
				while(rs.next()){
					CommodityType commtype=new CommodityType();
					commtype.setCommType_Id(rs.getInt("CommType_Id"));
					commtype.setCommodity_Id(rs.getInt("Commodity_Id"));
					commtype.setCommType_Name(rs.getString("CommType_Name"));
					commtype.setCommType_Price(rs.getDouble("CommType_Price"));
					commtype.setCommType_Count(rs.getInt("CommType_Count"));
					list.add(commtype);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeALL(rs,ps,conn);
		}
		return list;
	}
	//根据商品id获取商品规格
	public List<CommodityType> getCommID_Types(int Commodity_id){
		String sql="SELECT * FROM commodity_type WHERE Commodity_Id=?";
		List<CommodityType> list =new ArrayList<CommodityType>();
		Connection conn=getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setObject(1, Commodity_id);
			rs=ps.executeQuery();
			if(rs!=null){
				while(rs.next()){
					CommodityType commtype=new CommodityType();
					commtype.setCommType_Id(rs.getInt("CommType_Id"));
					commtype.setCommodity_Id(rs.getInt("Commodity_Id"));
					commtype.setCommType_Name(rs.getString("CommType_Name"));
					commtype.setCommType_Price(rs.getDouble("CommType_Price"));
					commtype.setCommType_Count(rs.getInt("CommType_Count"));
					list.add(commtype);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeALL(rs,ps,conn);
		}
		return list;
	}
	//通过CommodityType实体类删除
	public int DelCommType(int id){
		String sql="DELETE FROM commodity_type WHERE CommType_Id=?";
		Connection conn=getConnection();
		PreparedStatement ps=null;
		int num=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setObject(1, id);
			num=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
	//通过id查询
	public CommodityType getCommTypesID(int id){
		String sql="SELECT * FROM commodity_type where CommType_Id=?";
		CommodityType commtype =null;
		Connection conn=getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setObject(1, id);
			rs=ps.executeQuery();
			while(rs.next()){
				commtype=new CommodityType();
				commtype.setCommType_Id(rs.getInt("CommType_Id"));
				commtype.setCommodity_Id(rs.getInt("Commodity_Id"));
				commtype.setCommType_Name(rs.getString("CommType_Name"));
				commtype.setCommType_Price(rs.getDouble("CommType_Price"));
				commtype.setCommType_Count(rs.getInt("CommType_Count"));
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeALL(rs,ps,conn);
		}
		return commtype;
	}
}
