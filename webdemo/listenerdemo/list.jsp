<%@page contentType="text/html;charset=GBK" import="java.util.*"%>
<html>
<head>
</head>
<body>
	<h2>在线用户列表</h2>
	<%
		//从application中取出所有的用户的保存列表
		Set all=(Set)this.getServletContext().getAttribute("online");
		Iterator iter=all.iterator();
		while(iter.hasNext()){
	%>
		<%=iter.next()%>、
	<%
		}
	%>
</body>
</html>