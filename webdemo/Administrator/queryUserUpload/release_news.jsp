<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>审核发布信息</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%!
		//定义数据库驱动程序
		public static final String DBDRIVER="com.mysql.jdbc.Driver";
		public static final String DBURL="jdbc:mysql://localhost:3306/mldn";
		public static final String DBUSER="root";
		public static final String DBPASS="root";
	%>
	<%
		Connection conn=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		//int newsId=request.getParameter("id11");
		int newsId=Integer.parseInt(request.getParameter("id11"));
		String userId=request.getParameter("id12");
		String newsNote=request.getParameter("id13");
		String photoUrl=request.getParameter("id14");
		String newsTitle=request.getParameter("id15");
	%>
	

	<%
		try{
			Class.forName(DBDRIVER);
			conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
			String sql="insert into news_info_sl(userId,newsNote,photoUrl,newsTitle) values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setString(2,newsNote);
			pstmt.setString(3,photoUrl);
			pstmt.setString(4,newsTitle);
			pstmt.executeUpdate();
			String sql2="delete from news_info where newsId=?";
			pstmt2=conn.prepareStatement(sql2);
			pstmt2.setInt(1,newsId);
			pstmt2.executeUpdate();
			}
		catch(Exception e){
			out.println(e);
			}
		finally{
			try{
				pstmt.close();
				pstmt2.close();
				conn.close();
			}
			catch(Exception e){
			}
		}
	%>
	<script language="JavaScript">
		alert("发布成功");
		window.location.href="/webdemo/Administrator/msg/msgMn.jsp";
	</script>
	
	
	</body>
</html>