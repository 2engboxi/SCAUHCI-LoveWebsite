<%@page contentType="text/html" pageEncoding="utf-8"%>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<%
			session.setAttribute("loginname","游客");
		%>
		<jsp:forward page="scaulove.jsp"/>
	</body>
</html>