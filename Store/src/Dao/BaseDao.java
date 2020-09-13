package Dao;

import java.sql.*;

public class BaseDao {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url="jdbc:mysql://localhost:3306/store?serverTimezone=UTC";
    private String user="zyzz";
    private String password="1234";
    Connection conn=null;

    public Connection getConnection(){
        try{
            Class.forName(driver);
            conn= DriverManager.getConnection(url,user,password);

        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return conn;
    }
    public int update(String sql,Object ...objects){
        int num=0;
        if(conn==null){
            conn=getConnection();
        }
        try{
            PreparedStatement ps=conn.prepareStatement(sql);
            for (int i=0;i<objects.length;i++){
                ps.setObject(i+1,objects[i]);
            }
            num=ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }

        return num;
    }
    public void closeALL(Object ...objects){
        try{
            for (Object obj:objects ) {
                if(obj instanceof ResultSet){
                    ((ResultSet) obj).close();
                }else if (obj instanceof PreparedStatement){
                    ((PreparedStatement) obj).close();
                }else if(obj instanceof Statement){
                    ((Statement) obj).close();
                }else if(obj instanceof Connection){
                    ((Connection) obj).close();
                }

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}