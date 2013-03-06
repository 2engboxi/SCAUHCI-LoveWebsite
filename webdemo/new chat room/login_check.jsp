<%@page contentType="text/html" pageEncoding="utf-8"%>  
<%@page import="java.sql.*"%>
<html> 
	<head>  
		<title>登陆测试</title> 
	</head>
		<%!
			public static final String DBDRIVER="com.mysql.jdbc.Driver";
			public static final String DBURL="jdbc:mysql://localhost:3306/mldn";
			public static final String DBUSER="root";
			public static final String DBPASS="root";
			
		%>
		<%
			request.setCharacterEncoding("utf-8");
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String userId=request.getParameter("userId");
			String userpass=request.getParameter("passwd");
			Boolean flag=false;
		%>
		<%
			try{
				Class.forName(DBDRIVER);
				conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
				String sql="select username from user_info where userid = ? and userpass = ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,userId);
				pstmt.setString(2,userpass);
				rs=pstmt.executeQuery();
				if(rs.next()){
					String username=rs.getString(1);
					flag=true;
					}
				}
				catch(Exception e){
					System.out.println(e);
				}	
			finally{
				try{
					rs.close();
					pstmt.close();
					conn.close();
					}
			catch(Exception e){
				System.out.println(e);
			}
			}
		%>
		<%
			if(flag){
		%>
			<h1>登录成功！！</h1>
		<%
			}
			else{
		%>
			<h1>登录失败！!</h1>
		<%
			}
		%>
	<body> 
	</body> 
</html>
