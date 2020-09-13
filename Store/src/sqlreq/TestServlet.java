package sqlreq;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class TestServlet  extends HttpServlet {
    public TestServlet() {
        System.out.println(">>>>>>>>>>>>>>>>>实例化");
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        super.service(req, res);
        System.out.println(">>>>>>>>>>>>>>>>>处理Servlet"+this);
    }

    @Override
    public void destroy() {
        super.destroy();
        System.out.println(">>>>>>>>>>>>>>>>>删除Servlet示例");
    }

    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println(">>>>>>>>>>>>>>>>>初始化Servlet示例");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
        PrintWriter writer=resp.getWriter();
        writer.println("你好123");
        writer.close();
    }
}
