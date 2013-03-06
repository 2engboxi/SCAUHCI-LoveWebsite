<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<html>
	<head>
		<title>邮件发送功能</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	</head>
	<body>
		<%
			out.println("上传成功");
			response.sendRedirect("SendSimpleMail.jsp");
		%>
	</body>
</html>