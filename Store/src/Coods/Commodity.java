package Coods;

public class Commodity {
    private int Commodity_Id;//商品ID
    private String Commodity_Name;//商品名称
    private int CommClass_Id;//商品分类ID
    private String subname;//副标题
    private int brand_id;//商品品牌
    private String Commodity_introduce;//商品介绍
    private String Commodity_No;//商品货号
    private double selling_price;//商品售价
    private double market_price;//市场价
    private int warehousing;//存库
    private String unit;//计量单位；
    private String weight;//重量;
    private int sort;//排序
    private String Time;//商品日期

    public Commodity() {
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String time) {
        Time = time;
    }

    public Commodity(String commodity_Name, int commClass_Id, String subname, int brand_id, String commodity_introduce, String commodity_No, double selling_price, double market_price, int warehousing, String unit, String weight, int sort, String time) {
        Commodity_Name = commodity_Name;
        CommClass_Id = commClass_Id;
        this.subname = subname;
        this.brand_id = brand_id;
        Commodity_introduce = commodity_introduce;
        Commodity_No = commodity_No;
        this.selling_price = selling_price;
        this.market_price = market_price;
        this.warehousing = warehousing;
        this.unit = unit;
        this.weight = weight;
        this.sort = sort;
        Time = time;
    }

    public Commodity(int commodity_Id, String commodity_Name, int commClass_Id, String subname, int brand_id, String commodity_introduce, String commodity_No, double selling_price, double market_price, int warehousing, String unit, String weight, int sort, String time) {
        Commodity_Id = commodity_Id;
        Commodity_Name = commodity_Name;
        CommClass_Id = commClass_Id;
        this.subname = subname;
        this.brand_id = brand_id;
        Commodity_introduce = commodity_introduce;
        Commodity_No = commodity_No;
        this.selling_price = selling_price;
        this.market_price = market_price;
        this.warehousing = warehousing;
        this.unit = unit;
        this.weight = weight;
        this.sort = sort;
        Time = time;
    }

    public int getCommodity_Id() {
        return Commodity_Id;
    }

    public void setCommodity_Id(int commodity_Id) {
        Commodity_Id = commodity_Id;
    }

    public String getCommodity_Name() {
        return Commodity_Name;
    }

    public void setCommodity_Name(String commodity_Name) {
        Commodity_Name = commodity_Name;
    }

    public int getCommClass_Id() {
        return CommClass_Id;
    }

    public void setCommClass_Id(int commClass_Id) {
        CommClass_Id = commClass_Id;
    }

    public String getSubname() {
        return subname;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }

    public String getCommodity_introduce() {
        return Commodity_introduce;
    }

    public void setCommodity_introduce(String commodity_introduce) {
        Commodity_introduce = commodity_introduce;
    }

    public String getCommodity_No() {
        return Commodity_No;
    }

    public void setCommodity_No(String commodity_No) {
        Commodity_No = commodity_No;
    }

    public double getSelling_price() {
        return selling_price;
    }

    public void setSelling_price(double selling_price) {
        this.selling_price = selling_price;
    }

    public double getMarket_price() {
        return market_price;
    }

    public void setMarket_price(double market_price) {
        this.market_price = market_price;
    }

    public int getWarehousing() {
        return warehousing;
    }

    public void setWarehousing(int warehousing) {
        this.warehousing = warehousing;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }
}
