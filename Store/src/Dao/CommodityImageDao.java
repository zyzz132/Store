package Dao;

import entity.CommodityImage;

public class CommodityImageDao extends BaseDao{
	//添加商品相册
	public int AddCommdoityImage(CommodityImage commdImage){
		String sql="INSERT INTO commodity_image VALUES(NULL,?,?)";
		int num=update(sql, commdImage.getCommodity_id(),commdImage.getCommImage_Url());
		return num;
	}
}
