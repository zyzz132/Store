package Coods;

public class CommClass {
    private int CommClass_ID;
    private int parentClass;
    private String CommClass_Name;
    private int isShow;
    private int isNavShow;
    private String keyWrod;
    private String ClassDescribe;
    private int sort;

    public int getCommClass_ID() {
        return CommClass_ID;
    }

    public void setCommClass_ID(int commClass_ID) {
        CommClass_ID = commClass_ID;
    }

    public int getParentClass() {
        return parentClass;
    }

    public void setParentClass(int parentClass) {
        this.parentClass = parentClass;
    }

    public String getCommClass_Name() {
        return CommClass_Name;
    }

    public void setCommClass_Name(String commClass_Name) {
        CommClass_Name = commClass_Name;
    }

    public int getIsShow() {
        return isShow;
    }

    public void setIsShow(int isShow) {
        this.isShow = isShow;
    }

    public int getIsNavShow() {
        return isNavShow;
    }

    public void setIsNavShow(int isNavShow) {
        this.isNavShow = isNavShow;
    }

    public String getKeyWrod() {
        return keyWrod;
    }

    public void setKeyWrod(String keyWrod) {
        this.keyWrod = keyWrod;
    }

    public String getClassDescribe() {
        return ClassDescribe;
    }

    public void setClassDescribe(String classDescribe) {
        ClassDescribe = classDescribe;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public CommClass(int commClass_ID, int parentClass, String commClass_Name, int isShow, int isNavShow, String keyWrod, String classDescribe, int sort) {
        CommClass_ID = commClass_ID;
        this.parentClass = parentClass;
        CommClass_Name = commClass_Name;
        this.isShow = isShow;
        this.isNavShow = isNavShow;
        this.keyWrod = keyWrod;
        ClassDescribe = classDescribe;
        this.sort = sort;
    }

    public CommClass(int parentClass, String commClass_Name, int isShow, int isNavShow, String keyWrod, String classDescribe, int sort) {
        this.parentClass = parentClass;
        CommClass_Name = commClass_Name;
        this.isShow = isShow;
        this.isNavShow = isNavShow;
        this.keyWrod = keyWrod;
        ClassDescribe = classDescribe;
        this.sort = sort;
    }
}
