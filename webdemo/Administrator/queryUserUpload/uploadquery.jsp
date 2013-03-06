<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>查看用户上传信息</title>
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
		request.setCharacterEncoding("utf-8");
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rt=null;
		int	newsId=Integer.parseInt(request.getParameter("newsId"));	   //文章ID
		String userId="";		//用户ID
		String newsNote="";		//文章内容
		String photoUrl="";	    //图片地址
		String newsTitle="";	//文章标题
	%>
	<%
	try{
	    Class.forName(DBDRIVER);
		conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
		String sql="select userId,newsNote,photoUrl,newsTitle from news_info where newsId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,newsId);
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
				<td width="100"><h3>发布人ID：</h3></td>
				<td><font face="楷体"><%=userId%></font></td>
			</tr>
			<tr>
				<td><h3>文章标题：</h3> </td>
				<td><font face="楷体"><%=newsTitle%></font></td>
			</tr>
			<tr>
				<td><h3>图片：</td>
				<td><img src="<%=photoUrl%>" alt="<%=newsTitle%>" style="width:250"/></td>
			</tr>
			<tr>
			    <td><h3>正文：</td>
				<td><font face="楷体"><%=newsNote%></font></td>
			</tr>
		</table>
		<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3>
		<center>
			<input type="submit" value="通过审核" >
			<form action="delete_news.jsp">
				<input type="hidden" id="id6" name="id16" value="<%=newsId%>">
				<input type="submit" value="忽略删除">
			</form>
			<form action="/webdemo/Administrator/queryUserUpload/get_news_info.jsp">
				<input type="submit" value="返回上一层">
			</form>
		</center>
		
	</form>
				
	<%
		}
		else{
	%>
		没有数据耶！
	<%
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