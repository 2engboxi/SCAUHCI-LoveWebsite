<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>删除用户上传信息</title>
	</head>
	<body>
	<%!
		//定义数据库驱动程序
		public static final String DBDRIVER="com.mysql.jdbc.Driver";
		public static final String DBURL="jdbc:mysql://localhost:3306/mldn";
		public static final String DBUSER="root";
		public static final String DBPASS="root";
	%>
	<%
		String newsId=(String)session.getAttribute("newsId");
		Connection conn=null;
		PreparedStatement pstmt=null;
	try{
	    Class.forName(DBDRIVER);
		conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
		String sql="delete from news_info where newsId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,newsId);
		pstmt.executeUpdate();
		}
	catch(Exception e){
	%>
	    删除出错
	<%
		}
		finally{
			try{
				pstmt.close();
				conn.close();
			}
			catch(Exception e){
			}
		}
	%>
	
	
	</body>
</html>