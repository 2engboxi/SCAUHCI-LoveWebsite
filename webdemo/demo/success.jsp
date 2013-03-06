<%@page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<html>
<head>
</head>
<body>
<% request.setCharacterEncoding("GBK"); %>
<jsp:useBean id="reg" scope="request" class="cn.mldn.lxh.demo.Register"/>
<body>
	用户名:<jsp:getProperty name="reg" property="name"/><br>
	年&nbsp;&nbsp;龄:<jsp:getProperty name="reg" property="name"/><br>
	E-mail:<jsp:getProperty name="reg" property="email"/><br>
</body>
</body>
</html>