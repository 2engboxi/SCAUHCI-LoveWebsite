<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="org.lxh.smart.*"%>
<%@ page import="cn.mldn.lxh.util.IPTimeStamp"%>
<html>
<head>
	<title>文件上传自动命名</title>
</head>
<body>
<% request.setCharacterEncoding("GBK") %>
<%
	SmartUpload smart = new SmartUpload();
	smart.initialize(pageContext);
	smart.upload();
	String name= smart.getRequest().getParameter("name");
	IPTimeStamp its =new IPTimeStamp(request.getRemoteAddr());
	String ext=smart.getFiles().getFile(0).getFileExt();
	String fileName=its.getIPTimeRand()+"."+ext;
	smart.getFiles().getFile(0).saveAs(getServletContext().getRealPath("/")+"upload"+java.io.File.separator+fileName);
%>
</body>
</html>