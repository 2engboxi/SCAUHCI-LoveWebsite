<%@ page contentType="text/html; charset=gbk" language="java" import="java.util.*"%>
<% request.setCharacterEncoding("gbk");
session.invalidate();                            //����Session
response.sendRedirect("index.jsp");             //�ض���ҳ�浽��¼ҳ��
%>