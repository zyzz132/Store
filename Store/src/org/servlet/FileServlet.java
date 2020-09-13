package org.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import Dao.BaseDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class FileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out=resp.getWriter();
        boolean ism= ServletFileUpload.isMultipartContent(request);
        if(ism){
            FileItemFactory factory=new DiskFileItemFactory();
            ServletFileUpload upload=new ServletFileUpload(factory);
            try {
                List<FileItem> items =upload.parseRequest(request);
                Iterator<FileItem> iter=items.iterator();
                while(iter.hasNext()){
                    FileItem item=(FileItem)iter.next();
                    if(item.isFormField()){

                    }else{
                        String FileName=item.getName();
                        if(FileName!=null && !FileName.equals("")){
                            String uploadFilePath=request.getSession().getServletContext().getRealPath("upload/");

                            File fullName=null;
                            do{
                                fullName=new File(uploadFilePath,((int)(Math.random()*1000000000))+".png");
                                System.out.println(fullName.getName());
                            }while (fullName.isFile());//判断文件是否存在，如果存在不保存
                            //写出文件

                            item.write(fullName);
                            BaseDao bd=new BaseDao();
                            //判断上传类型
                            String brandType=request.getParameter("brand");
                            if(brandType!=null){
                                String sql="INSERT INTO brand_images(TYPE,image_path) VALUES(?,?)";
                                String sql2="";
                                int num=0;
                                if(brandType.equals("0")){
                                    num=bd.update(sql,0,fullName.getName());
                                    sql2="SELECT id FROM brand_images WHERE TYPE=0 AND image_path=?";
                                }else{
                                    num=bd.update(sql,1,fullName.getName());
                                    sql2="SELECT id FROM brand_images WHERE TYPE=1 AND image_path=?";
                                }
                                if(num>=1){
                                    if(!sql2.equals("")){
                                        Connection conn=bd.getConnection();
                                        PreparedStatement ps= null;
                                        ps = conn.prepareStatement(sql2);
                                        ps.setObject(1,fullName.getName());
                                        ResultSet rs=ps.executeQuery();
                                        if(rs!=null){
                                            while(rs.next()){
                                                out.print("{\n" +
                                                        "  \"code\": 0\n" +
                                                        "  ,\"msg\": \"\"\n" +
                                                        "  ,\"data\": {\n" +
                                                        " \"id\": "+rs.getInt("id")+"\n"+
                                                        "  }\n" +
                                                        "}       ");
                                            }
                                        }
                                    }
                                }
                            }

                        }
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
