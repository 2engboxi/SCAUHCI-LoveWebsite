<%@page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<html>
<head>
</head>
<body>
<% request.setCharacterEncoding("GBK"); %>
<jsp:useBean id="reg" scope="request" class="cn.mldn.lxh.demo.Register"/>
<body>
	�û���:<jsp:getProperty name="reg" property="name"/><br>
	��&nbsp;&nbsp;��:<jsp:getProperty name="reg" property="name"/><br>
	E-mail:<jsp:getProperty name="reg" property="email"/><br>
</body>
</body>
</html>