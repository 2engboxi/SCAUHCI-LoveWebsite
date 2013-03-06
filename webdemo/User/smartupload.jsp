<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.File.*"%>
<html>
	<head><title>用户信息上传</title></head>
	<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%
		SmartUpload su=new SmartUpload();	//实例化SmartUpload上传组件
		su.initialize(pageContext);			//初始化上传操作
		su.upload();						//上传准备
		su.save("upload");					//将上传文件保存在upload文件夹中
		//String name=su.getRequest().getParameter("uname");
		String title=su.getRequest().getParameter("title");
		String text=su.getRequest().getParameter("textarea");
		String fileName=su.getFiles().getFile(0).getFileName();
		String userId=su.getRequest().getParameter("uId");
		String photoPath=request.getContextPath()+"/upload/"+fileName;
	%>
	<h1>上传成功!</h1>
	<h3>标题：<%=title%></h3>
	<h3>图片:<%=photoPath%></h3>
	<%
		String newtext = text.replaceAll("\r\n","<br>");
		String newnewtext = newtext.replaceAll(" ","&nbsp;&nbsp;");
	%>
	<h3><%=newnewtext%></h3>

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
	%>
	<%
	try{
	    Class.forName(DBDRIVER);
		conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
		String sql="insert into news_info(userId,newsNote,photoUrl,newsTitle) values(?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,userId);
		pstmt.setString(2,newnewtext);
		pstmt.setString(3,photoPath);
		pstmt.setString(4,title);
		pstmt.executeUpdate();
		}
	catch(Exception e){
	%>
	    出错了！
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
	<script language="JavaScript">
		alert("上传成功");
		window.location.href="/webdemo/proscenium/scaulove.jsp";
	</script>

	</body>
</html>

