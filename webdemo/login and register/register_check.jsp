<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<html>
	<head>
	</head>
	<body>
		<%@ page import="java.sql.*"%>
		<%
			final String DBDRIVER = "com.mysql.jdbc.Driver";
			final String DBURL = "jdbc:mysql://localhost:3306/mldn";
			final String DBUSER = "root";
			final String DBPASS = "root";
		%>
		<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 1;
		%>
		<%
			try{
			String sql = "insert into user_info values(?,?,?,?,?,?)";
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
			pstmt = conn.prepareStatement(sql);
			request.setCharacterEncoding("utf-8");
			pstmt.setString(1,request.getParameter("id"));
			pstmt.setString(2,request.getParameter("uname"));
			pstmt.setString(3,request.getParameter("password"));
			pstmt.setString(4,request.getParameter("email"));
			pstmt.setString(5,request.getParameter("sex"));
			pstmt.setString(6,"0");
			flag = pstmt.executeUpdate();
			}
			catch(Exception e){
			}
			finally{
				pstmt.close();
				conn.close();
			}
			
		%>
		<%
			if(flag==1){
		%>
			<script language="JavaScript">
				alert("注册成功！");
				window.location.href="/webdemo/proscenium/scaulove.html"
			</script>
		<%
			}
			else{
		%>
			<script language="JavaScript">
				alert("注册失败！");
				window.location.href="/webdemo/proscenium/scaulove.html"
			</script>
		<%
			}
		%>
	</body>
</html>