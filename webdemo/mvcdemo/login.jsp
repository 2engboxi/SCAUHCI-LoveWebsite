<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
<head>
	<title>��һ��mvcС����</title>
</head>
<body>
	<h2>�û���¼����</h2>
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
		�û�ID:<input type="text" name="userid"><br>
		��&nbsp;&nbsp;��:<input type="password" name="userpass"><br>
		<input type="submit" value="��¼">
        <input type="reset" value="����">
	</form>
</body>
</html>