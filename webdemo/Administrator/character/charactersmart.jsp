<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.File.*"%>
<html>
	<head><title>爱心人物上传</title></head>
	<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%
		SmartUpload su=new SmartUpload();	//实例化SmartUpload上传组件
		su.initialize(pageContext);			//初始化上传操作
		su.upload();						//上传准备
		su.save("upload");					//将上传文件保存在upload文件夹中
		String fileName=su.getFiles().getFile(0).getFileName();
		String name=su.getRequest().getParameter("cName");
		String story=su.getRequest().getParameter("story");
		String photoPath=request.getContextPath()+"/upload/"+fileName;
	%>
	<h1>上传成功!</h1>
	<h3>姓名：<%=name%></h3>
	<%
		String newtext = story.replaceAll("\r\n","<br>");
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
		String sql="insert into characte(characName,story,photoUrl) values(?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,newnewtext);
		pstmt.setString(3,photoPath);
		pstmt.executeUpdate();
		}
	catch(Exception e){
	%>
	    上传错误！
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
		window.location.href="characterUpload1.jsp";
	</script>

	</body>
</html>

