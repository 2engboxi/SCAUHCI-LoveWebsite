<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.naming.Context"%>			<!--名称查找开发包-->
<%@ page import="javax.naming.InitialContext"%>		<!--名称查找开发包-->
<%@ page import="javax.sql.DataSource"%>			<!--DataSource所在的包-->
<html>
<head><title>DataSource示例</title></head>
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