<%@ page contentType="text/html;charset=GBK" import="java.util.*"%>
<html>
<head>����������</head>
<body>
	<h2>�û���¼����</h2>
	<%
		String userid=request.getParameter("userid");
		if(!(userid==null||"".equals(userid))){
			session.setAttribute("userid",userid);
			response.sendRedirect("list.jsp");
		}
	%>
	<form action="input.jsp" method="post">
	�û�ID:<input type="text" name="userid">
		   <input type="submit" value="��¼">
	</form>
</body>
</html>