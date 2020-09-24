package Dao;

import java.sql.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.naming.Context;


public class BaseDao {
    


    public Connection getConnection(){
    	Connection conn=null;
    	try {
			Context ctx=new InitialContext();
			DataSource dataSource = (DataSource)ctx.lookup("java:comp/env/jdbc/store");
			conn=dataSource.getConnection();
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return conn;
    }
    public int update(String sql,Object ...objects){
    	Connection conn=null;
        int num=0;
        if(conn==null){
            conn=getConnection();
        }
        PreparedStatement ps =null;
        try{
            ps=conn.prepareStatement(sql);
            for (int i=0;i<objects.length;i++){
                ps.setObject(i+1,objects[i]);
            }
            num=ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
        	closeALL(ps,conn);
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
    protected ResultSet executeQuery(String sql, Object... params) {
    	Connection conn=null;
        conn = this.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}
