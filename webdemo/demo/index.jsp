<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<html>
<head><title>register demo</title></head>
<% request.setCharacterEncoding("GBK"); %>
<jsp:useBean id="reg" scope="request" class="cn.mldn.lxh.demo.Register"/>
<body>
<form action="check.jsp" method="post">
	�û���:<input type="text" name="name" value="<jsp:getProperty name="reg" property="name"/>">
		   <%=reg.getErrorMsg("errname")%><br>
	��&nbsp;&nbsp;��:<input type="text" name="age" value="<jsp:getProperty name="reg" property="age"/>">
		   <%=reg.getErrorMsg("errage")%><br>
	E-mail:<input type="text" name="emial" value="<jsp:getProperty name="reg" property="email"/>">
		   <%=reg.getErrorMsg("erremail")%><br>
	<input type="submit" value="ע��"><input type="reset" value="����">
</form>
</body>
</html>