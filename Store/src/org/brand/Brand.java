package org.brand;

public class Brand {
    private int id;
    private String brand_name;
    private String brand_letter;
    private int brand_loginID;
    private int brand_bigImageID;
    private String brand_story;
    private int sort;
    private int isShow;
    private int brand_manufacturer;

    public Brand(String brand_name, String brand_letter, int brand_loginID, int brand_bigImageID, String brand_story, int sort, int isShow, int brand_manufacturer) {
        this.brand_name = brand_name;
        this.brand_letter = brand_letter;
        this.brand_loginID = brand_loginID;
        this.brand_bigImageID = brand_bigImageID;
        this.brand_story = brand_story;
        this.sort = sort;
        this.isShow = isShow;
        this.brand_manufacturer = brand_manufacturer;
    }

    public Brand() {
    }

    public Brand(int id, String brand_name, String brand_letter, int brand_loginID, int brand_bigImageID, String brand_story, int sort, int isShow, int brand_manufacturer) {
        this.id = id;
        this.brand_name = brand_name;
        this.brand_letter = brand_letter;
        this.brand_loginID = brand_loginID;
        this.brand_bigImageID = brand_bigImageID;
        this.brand_story = brand_story;
        this.sort = sort;
        this.isShow = isShow;
        this.brand_manufacturer = brand_manufacturer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand_name() {
        return brand_name;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public String getBrand_letter() {
        return brand_letter;
    }

    public void setBrand_letter(String brand_letter) {
        this.brand_letter = brand_letter;
    }

    public int getBrand_loginID() {
        return brand_loginID;
    }

    public void setBrand_loginID(int brand_loginID) {
        this.brand_loginID = brand_loginID;
    }

    public int getBrand_bigImageID() {
        return brand_bigImageID;
    }

    public void setBrand_bigImageID(int brand_bigImageID) {
        this.brand_bigImageID = brand_bigImageID;
    }

    public String getBrand_story() {
        return brand_story;
    }

    public void setBrand_story(String brand_story) {
        this.brand_story = brand_story;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int getIsShow() {
        return isShow;
    }

    public void setIsShow(int isShow) {
        this.isShow = isShow;
    }

    public int getBrand_manufacturer() {
        return brand_manufacturer;
    }

    public void setBrand_manufacturer(int brand_manufacturer) {
        this.brand_manufacturer = brand_manufacturer;
    }
}
