package sqlreq;

import Dao.BaseDao;

import java.sql.*;


public class mysqlConn {

    BaseDao bd=new BaseDao();
    public user login(String username,String password){
        Connection conn =bd.getConnection();
        try{
            String sql="SELECT * FROM users WHERE (Account_number=? OR phone=? OR Email=?  )AND  PASSWORD =?";
            //String sql2="UPDATE users SET newDateTime =NOW() WHERE (Account_number=? OR phone=? OR Email=?  )AND  PASSWORD =?";
            PreparedStatement pstam=conn.prepareStatement(sql);
            //PreparedStatement pstam2=conn.prepareStatement(slq2);
            pstam.setString(1,username);
            pstam.setString(2,username);
            pstam.setString(3,username);
            pstam.setString(4,password);

            ResultSet rs=pstam.executeQuery();
            while(((ResultSet) rs).next()){
                if(rs.getRow()==1){
                    //判断用户类型
                    if(rs.getInt("User_typeID")==3){
                        user userInfo=new admin(
                                rs.getString("User_Id"),
                                rs.getString("User_Name"),
                                rs.getString("phone"),
                                rs.getString("Email"),
                                rs.getInt("User_typeID"),
                                rs.getString("DateTime"));
                        return userInfo;
                    }else{
                        user userInfo=new UserInfo(
                                rs.getString("User_Id"),
                                rs.getString("User_Name"),
                                rs.getString("phone"),
                                rs.getString("Email"),
                                rs.getInt("User_typeID"),
                                rs.getString("DateTime"));
                        return userInfo;
                    }

                }

            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            if(conn!=null){

                try {
                    conn.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    public int AddUser(String User_Name,String password,String phone,String Email){
        Connection conn =bd.getConnection();
        PreparedStatement ps=null;
        int num=0;
        String sql="INSERT INTO users VALUES(NULL,?,?,?,?,1,NOW(),null,NOW(),?)";
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1,User_Name);
            ps.setObject(2,password);
            ps.setObject(3,phone);
            ps.setObject(4,Email);
            ps.setObject(5,User_Name);
            num=ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            bd.closeALL(ps,conn);
        }


        return num;
    }

    //获取用户列表
    public String loadUser(){
        Connection conn =null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e1) {
            e1.printStackTrace();
        }
        try{
            conn= bd.getConnection();
            Statement stam=conn.createStatement();
            //mysqlConn comm=new mysqlConn();
            String sql="SELECT User_Id,User_Name,phone,Email,typeName,DATETIME,newDateTime  FROM users u INNER JOIN user_type t ON u.User_typeID=t.User_typeID";
            ResultSet rs=stam.executeQuery(sql);
            StringBuffer sb=new StringBuffer();
            while(((ResultSet) rs).next()){
                    sb.append("<tr><td></td>");
                    sb.append("<td>"+rs.getString("User_Id")+"</td>");
                    sb.append("<td>"+rs.getString("User_Name")+"</td>");
                    sb.append("<td>"+rs.getString("Email")+"</td>");
                    sb.append("<td>"+rs.getString("typeName")+"</td>");
                    sb.append("<td>"+rs.getString("DateTime")+"</td>");
                    sb.append("<td>"+rs.getString("newDateTime")+"</td></tr>");

            }
            return sb.toString();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    //获取商品列表（后台）
    public String getGoodsList(){
        Connection conn=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        try{
            conn=bd.getConnection();
            Statement state =conn.createStatement();
            String sql="SELECT * FROM commodity";
            ResultSet rs=state.executeQuery(sql);
            StringBuffer sb=new StringBuffer();
            while(rs.next()){
                sb.append("<tr><td></td>");
                sb.append("<td>"+
                        rs.getString(1)+"</td><td>"+
                        rs.getString(2)+"</td><td>"+
                        rs.getString(3)+"</td><td>"+
                        rs.getString(4)+"</td><td>"+
                        rs.getString(5)+"</td></tr>");

            }
            return sb.toString();
        }catch (SQLException e){
            e.printStackTrace();
        }

        return null;
    }
}
