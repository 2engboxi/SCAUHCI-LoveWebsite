<%@page contentType="text/html;charset=GBK" import="java.util.*"%>
<html>
<head>
</head>
<body>
	<h2>�����û��б�</h2>
	<%
		//��application��ȡ�����е��û��ı����б�
		Set all=(Set)this.getServletContext().getAttribute("online");
		Iterator iter=all.iterator();
		while(iter.hasNext()){
	%>
		<%=iter.next()%>��
	<%
		}
	%>
</body>
</html>