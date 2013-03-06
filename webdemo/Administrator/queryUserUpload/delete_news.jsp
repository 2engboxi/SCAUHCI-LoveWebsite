<%@page contentType="text/html charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<title>删除用户信息</title>
	</head>
	<body>
		<%!
			public static final String DBDRIVER="com.mysql.jdbc.Driver";
			public static final String DBURL="jdbc:mysql://localhost:3306/mldn";
			public static final String DBUSER="root";
			public static final String DBPASS="root"
		%>
		<%
			request.setCharacterEncoding("utf-8");
			int newsId=Integer.parseInt(request.getParameter("id16"));
			Connection conn=null;
			PreparedStatement pstmt=null;
			String sql="delete from news_info where newsId=?";
		%>
		<%
			try{
				Class.forName(DBDRIVER);
				conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,newsId);
			}
			catch(Exception e){
				out.println(e);
			}
			finally{
				conn.close();
				pstmt.close();
			}
		%>
	</body>
</html>