<%@ page language="java" contentType="text/html;charset=utf-8"  import="java.sql.*" %>

	<%@ include file="Header.jsp" %>
	<%
	Connection conn=null;
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
		out.println("加载失败");
	}
	
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/store?serverTimezone=UTC","zyzz","1234");//?serverTimezone=UTC
		out.println("连接成功");
	}
	catch (SQLException e){
		out.println("连接失败");
		e.printStackTrace();
	}finally {
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	%>
</body>
</html>