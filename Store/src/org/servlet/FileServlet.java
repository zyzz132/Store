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
import entity.Commodity;
import entity.CommodityImage;

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
                                System.out.println(uploadFilePath+"/"+fullName.getName());
                            }while (fullName.isFile());//判断文件是否存在，如果存在不保存
                            //写出文件

                            item.write(fullName);
	                          out.print("{\n" +
	                          "  \"code\": 0\n" +
	                          "  ,\"msg\": \"\"\n" +
	                          "  ,\"data\": {\n" +
	                          " \"name\": \""+fullName.getName()+"\"\n"+
	                          "  }\n" +
	                          "}       ");
	                          Commodity commd=(Commodity)request.getSession().getAttribute("comm");
	                          List<CommodityImage> list=commd.getImageList();
	                          CommodityImage commdimage=new CommodityImage();
	                          commdimage.setCommImage_Url(fullName.getName());
	                          list.add(commdimage);
	                          commd.setImageList(list);

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
