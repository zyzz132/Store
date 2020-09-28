<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2020/9/3
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String fileName="";
    String name="";
    boolean ism= ServletFileUpload.isMultipartContent(request);
    String uploadFilePath=request.getSession().getServletContext().getRealPath("upload/");
//    File tempPatchFile=new File("D:\\Store\\web\\data\\images");
//    if(!tempPatchFile.exists())//判断文件或目录是否存在
//        tempPatchFile.mkdirs();//创建指定的目录
    if(ism){
        FileItemFactory factory=new DiskFileItemFactory();

        //DiskFileItemFactory factory=new DiskFileItemFactory();
        //factory.setSizeThreshold(4096);//设置缓冲区4k
        //factory.setRepository(tempPatchFile);//设置上传文件用到临时文件存放路径
        ServletFileUpload upload =new ServletFileUpload(factory);
        //upload.setSizeMax(1024*30);//设置一个完整请求的最大允许大小
        try {
            List<FileItem> items =upload.parseRequest(request);
            Iterator<FileItem> iter =items.iterator();
            while(iter.hasNext()){
                FileItem item=(FileItem)iter.next();
                if(item.isFormField()){
                    //普通表单
                    name=item.getFieldName();
                    out.print(name+"="+item.getString("UtF-8")+"<br>");

                }else{

                    //文件字段
                    String FileName=item.getName();
                    if(FileName !=null &&!FileName.equals("")){
                        File fullFile=new File("123.png");
                        File saveFile=new File(uploadFilePath,fullFile.getName());
                        item.write(saveFile);
                        fileName=fullFile.getName();
                        out.print("上传成功后的文件名称是："+fileName);
                    }
                    out.print(FileName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
%>
</body>
</html>
