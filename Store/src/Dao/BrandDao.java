package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Brand;

public class BrandDao extends BaseDao{
	public int getBrandCount(){
		ResultSet rs=null;
		String sql="SELECT COUNT(*) FROM brand b LEFT JOIN commodity c ON b.id = c.brand_id";
		int count= -1;
		
		try {
			rs=this.executeQuery(sql, null);
			rs.next();
			count=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeALL(rs);
		}
		
		return count;
	}
	public List<Brand> getBrandInfo(int currPageNo, int numsPerPage) {
		List<Brand> brands = new ArrayList<Brand>();
		String sql = "SELECT b.id,b.brand_name,b.brand_letter,b.sort,b.isShow,COUNT(c.Commodity_Id) "+
					"FROM brand b LEFT JOIN commodity c ON b.id = c.brand_id "+
					"GROUP BY b.id"
				+"LIMIT ?,?";
		ResultSet rs = this.executeQuery(sql, (currPageNo-1)*numsPerPage,numsPerPage);
		try {
			while(rs.next()){
				Brand brand = new Brand();
				brand.setId(rs.getInt("id"));
				brand.setBrand_name(rs.getString("brand_name"));
				brand.setBrand_manufacturer(rs.getString("brand_manufacturer"));
				brand.setCommodityNums(rs.getInt(4));
				brands.add(brand);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return brands;
	}
}
