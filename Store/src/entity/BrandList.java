package entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.BaseDao;


public class BrandList extends BaseDao{
	private int currPageNo; 
	private int numsPerPage; 
	private int maxPageNo; 
	private int totalNums; 
	private List<Brand> list;
	public List<Brand> getList() {
		return list;
	}

	public void setList(List<Brand> list) {
		this.list = list;
	}

	private String sql;
	

	public List<Brand> getBrandInfo(int currPageNo, int numsPerPage) {
		List<Brand> brands = new ArrayList<Brand>();
		sql = "SELECT id,brand_name,brand_manufacturer,COUNT(id)"
				+"FROM brand,commodity"
				+"WHERE brand.id = commodity.brand_id"
				+"GROUP BY brand.id"
				+"ORDER BY brand.id"
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

	public void setTotalNums(int totalNums) {
		if (totalNums > 0) {
			this.totalNums = totalNums;
			maxPageNo = this.totalNums%this.numsPerPage==0?
						(this.totalNums/this.numsPerPage):(this.totalNums/this.numsPerPage+1);
		}
	}
	public int getTotalNums() {
		return totalNums;
	}

	public int getCurrPageNo() {
		return currPageNo;
	}

	public void setCurrPageNo(int currPageNo) {
		this.currPageNo = currPageNo;
	}

	public int getNumPerPage() {
		return numsPerPage;
	}

	public void setNumPerPage(int numsPerPage) {
		this.numsPerPage = numsPerPage;
	}

	public int getMaxPageNo() {
		return maxPageNo;
	}

	public void setMaxPageNo(int maxPageNo) {
		this.maxPageNo = maxPageNo;
	}

	public int getNumsPerPage() {
		return numsPerPage;
	}

	public void setNumsPerPage(int numsPerPage) {
		this.numsPerPage = numsPerPage;
	}

}
