package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.CommodityImage;
/**
 * 商品相册Dao层
 * @author Hasee
 *
 */
public class CommodityImageDao extends BaseDao{
	//添加商品相册
	public int AddCommdoityImage(CommodityImage commdImage){
		String sql="INSERT INTO commodity_image VALUES(NULL,?,?)";
		int num=update(sql, commdImage.getCommodity_id(),commdImage.getCommImage_Url());
		return num;
	}
	//根据id查询商品相册
	public List<CommodityImage> getCommodityImage(int Commodity_Id){

		String sql="SELECT * FROM commodity_image WHERE Commodity_Id=?";
		List<CommodityImage> list=new ArrayList<CommodityImage>();
		CommoidyTypeDao ctdao=new CommoidyTypeDao();
        Connection conn =getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, Commodity_Id);
			rs=ps.executeQuery();
			while(rs.next()){
				CommodityImage commimage=new CommodityImage();
				commimage.setCommImage_Id(rs.getInt("CommImage_Id"));
				commimage.setCommodity_id(rs.getInt("Commodity_Id"));
				commimage.setCommImage_Url(rs.getString("CommImage_Url"));
				list.add(commimage);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeALL(rs,ps,conn);
		}
		
		return list;
	}
}
