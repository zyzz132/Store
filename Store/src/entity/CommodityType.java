package entity;

public class CommodityType {
	private int CommType_Id;
	private int Commodity_Id;
	private String CommType_Name;
	private double CommType_Price;
	private int CommType_Count;
	public CommodityType(int commType_Id, int commodity_Id, String commType_Name, double commType_Price,
			int commType_Count) {
		super();
		CommType_Id = commType_Id;
		Commodity_Id = commodity_Id;
		CommType_Name = commType_Name;
		CommType_Price = commType_Price;
		CommType_Count = commType_Count;
	}
	public CommodityType(int commodity_Id, String commType_Name, double commType_Price, int commType_Count) {
		super();
		Commodity_Id = commodity_Id;
		CommType_Name = commType_Name;
		CommType_Price = commType_Price;
		CommType_Count = commType_Count;
	}
	public CommodityType() {
		super();
	}
	public int getCommType_Id() {
		return CommType_Id;
	}
	public void setCommType_Id(int commType_Id) {
		CommType_Id = commType_Id;
	}
	public int getCommodity_Id() {
		return Commodity_Id;
	}
	public void setCommodity_Id(int commodity_Id) {
		Commodity_Id = commodity_Id;
	}
	public String getCommType_Name() {
		return CommType_Name;
	}
	public void setCommType_Name(String commType_Name) {
		CommType_Name = commType_Name;
	}
	public double getCommType_Price() {
		return CommType_Price;
	}
	public void setCommType_Price(double commType_Price) {
		CommType_Price = commType_Price;
	}
	public int getCommType_Count() {
		return CommType_Count;
	}
	public void setCommType_Count(int commType_Count) {
		CommType_Count = commType_Count;
	}
	
}
