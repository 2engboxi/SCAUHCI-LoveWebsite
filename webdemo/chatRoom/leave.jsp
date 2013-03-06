<%@ page contentType="text/html; charset=gbk" language="java" import="java.util.*"%>
<% request.setCharacterEncoding("gbk");
session.invalidate();                            //销毁Session
response.sendRedirect("index.jsp");             //重定向页面到登录页面
%>