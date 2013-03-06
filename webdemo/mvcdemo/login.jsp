<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
<head>
	<title>第一个mvc小程序</title>
</head>
<body>
	<h2>用户登录程序</h2>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%
		List<String>info=(List<String>)request.getAttribute("info");
		if(info!=null){
		Iterator<String>iter=info.iterator();
		while(iter.hasNext()){
	%>
		<h4><%=iter.next()%></h4>
	<%
		}
		}
	%>
	<form action="LoginServlet" method="post">
		用户ID:<input type="text" name="userid"><br>
		密&nbsp;&nbsp;码:<input type="password" name="userpass"><br>
		<input type="submit" value="登录">
        <input type="reset" value="重置">
	</form>
</body>
</html>