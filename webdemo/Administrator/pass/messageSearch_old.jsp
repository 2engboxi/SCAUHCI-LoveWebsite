<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>查看用户上传信息</title>
		<script language="JavaScript">
			function dele(){
				window.location.href="delete_news.jsp"
			}
		</script>
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
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rt=null;
		String newsId="00001";	//文章ID	
		String userId="";		//用户ID
		String newsNote="";		//文章内容
		String photoUrl="";	    //图片地址
		String newsTitle="";	//文章标题
		session.setAttribute("newsId","00001");
	%>
	<%
	try{
	    Class.forName(DBDRIVER);
		conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
		String sql="select userId,newsNote,photoUrl,newsTitle from news_info where newsId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,"00001");
		rt=pstmt.executeQuery();
		if(rt.next()){
			userId=rt.getString(1);
			newsNote=rt.getString(2);
			photoUrl=rt.getString(3);
			newsTitle=rt.getString(4);
	%>	
		<form action="release_news.jsp" method="post">
		<input type="hidden" id="id1" name="id11" value="<%=newsId%>">
		<input type="hidden" id="id2" name="id12" value="<%=userId%>">
		<input type="hidden" id="id3" name="id13" value="<%=newsNote%>">
		<input type="hidden" id="id4" name="id14" value="<%=photoUrl%>">
		<input type="hidden" id="id5" name="id15" value="<%=newsTitle%>">
		<center><font face="楷体"><h2><%=userId%>上传的信息</h2></font></center>
		<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3>
		<table>
			<tr>
				<td><h3>发布人ID：</h3></td>
				<td><font face="楷体"><%=userId%></font></td>
			</tr>
			<tr>
				<td><h3>文章标题：</h3> </td>
				<td><font face="楷体"><%=newsTitle%></font></td>
			</tr>
			<tr>
				<td><h3>图片：</td>
				<td><img src="<%=photoUrl%>"></td>
			</tr>
			<tr>
			    <td><h3>正文：</td>
				<td><font face="楷体"><%=newsNote%></font></td>
			</tr>
		</table>
		<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3>
		<center>
			<input type="submit" value="通过审核" >
			<input type="button" value="忽略删除" onclick="dele()" >
		</center>
		
	</form>
				
	<%
		}
		else{
			
		}}
	catch(Exception e){
	%>
	    查询出错
	<%
		}
		finally{
			try{
				pstmt.close();
				conn.close();
				rt.close();
			}
			catch(Exception e){
			}
		}
	%>
	
	
	</body>
</html>