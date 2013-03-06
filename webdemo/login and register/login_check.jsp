<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>用户身份检测</title>
	</head>
	<body>
		<%
			final String DBDRIVER = "com.mysql.jdbc.Driver";
			final String DBURL = "jdbc:mysql://localhost:3306/mldn";
			final String DBUSER = "root";
			final String DBPASS = "root";
		%>
		<%
			Connection conn = null;
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			boolean aflag = false;
			boolean uflag = false;
			String realName = null;
			String sql = null;
			request.setCharacterEncoding("utf-8");
			String userid = request.getParameter("name");
			String password = request.getParameter("password");
		%>
		<%
			try{
				Class.forName(DBDRIVER);
				conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
				sql = "select username from user_info where userid = ? and userpass = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,userid);
				pstmt.setString(2,password);
				rs = pstmt.executeQuery();
				if(rs.next()){
					realName = rs.getString(1);
					if(userid.equals("201031000627")||userid.equals("201031000631"))
						aflag = true;
					else
						uflag = true;
				}
				}
			catch(Exception e){
			}
			finally{
				rs.close();
				pstmt.close();
				conn.close();
			}
		%>
		<%
			if(aflag){
		%>
			<script language="JavaScript">
				alert("登录成功！");
				window.location.href="/webdemo/Administrator/index.jsp"
			</script>
		<%
			}else if(uflag){
			session.setAttribute("loginname",realName);
		%>
			<script language="JavaScript">
				window.location.href="/webdemo/proscenium/scaulove.jsp"
			</script>
		<%
			}else{
		%>
			<script language="JavaScript">
				alert("账号或密码错误！");
				window.location.href="/webdemo/proscenium/scaulove.html"
			</script>
		<%
			}
		%>
		
	</body>
</html>