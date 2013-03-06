<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ taglib uri="core" prefix="c"%>
<html>
	<head>
		<title>TagDemo</title>
	</head>
	<body>
		<%
			pageContext.setAttribute("info","<www.baidu.com>");
		%>
		<h3><c:out value="${ref}">УЛгаФкШнро</c:out></h3>
	</body>
</html>