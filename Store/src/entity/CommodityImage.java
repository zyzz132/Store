package entity;
/**
 * 商品相册实体类
 * @author zyzz
 *
 */
public class CommodityImage {
	private int CommImage_Id;
	private int Commodity_id;
	private String CommImage_Url;
	public int getCommImage_Id() {
		return CommImage_Id;
	}
	public int getCommodity_id() {
		return Commodity_id;
	}
	public void setCommodity_id(int commodity_id) {
		Commodity_id = commodity_id;
	}
	public void setCommImage_Id(int commImage_Id) {
		CommImage_Id = commImage_Id;
	}
	public String getCommImage_Url() {
		return CommImage_Url;
	}
	public void setCommImage_Url(String commImage_Url) {
		CommImage_Url = commImage_Url;
	}
	public CommodityImage(int commImage_Id, String commImage_Url) {
		super();
		CommImage_Id = commImage_Id;
		CommImage_Url = commImage_Url;
	}
	public CommodityImage() {
		super();
	}
	
}
