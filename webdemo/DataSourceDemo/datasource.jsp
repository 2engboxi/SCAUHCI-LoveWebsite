<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.naming.Context"%>			<!--���Ʋ��ҿ�����-->
<%@ page import="javax.naming.InitialContext"%>		<!--���Ʋ��ҿ�����-->
<%@ page import="javax.sql.DataSource"%>			<!--DataSource���ڵİ�-->
<html>
<head><title>DataSourceʾ��</title></head>
<body>
<%
	String DSNAME="java:comp/env/jdbc/mldn";
	Context ctx=new InitialContext();
	DataSource ds=(DataSource)ctx.lookup(DSNAME);
	Connection conn=ds.getConnection();
%>
<%=conn%>
<%
	conn.close();
%>
</body>