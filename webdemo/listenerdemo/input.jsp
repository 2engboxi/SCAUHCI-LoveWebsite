<%@ page contentType="text/html;charset=GBK" import="java.util.*"%>
<html>
<head>监听器例子</head>
<body>
	<h2>用户登录程序</h2>
	<%
		String userid=request.getParameter("userid");
		if(!(userid==null||"".equals(userid))){
			session.setAttribute("userid",userid);
			response.sendRedirect("list.jsp");
		}
	%>
	<form action="input.jsp" method="post">
	用户ID:<input type="text" name="userid">
		   <input type="submit" value="登录">
	</form>
</body>
</html>