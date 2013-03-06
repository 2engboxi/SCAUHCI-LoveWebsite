<%@ page contentType="text/html" pageEncoding="utf-8"%>  
<html> 
	<head>  
		<title>聊天程序用户登录</title> 
	</head> 
	<body> 
	<center>
		<h3>聊天室登录</h3>
		<%
			String contextPath=request.getContextPath();
		%>
		
		<form action="login_check.jsp" method="post"> 
		<table>
			<tr>
				<img src="<%=contextPath%>/images/b151f8198618367afd30ac0a2e738bd4b21ce5a8.png" width="230" height="150" />
			</tr>
			<tr>
				<td>
					帐号
				</td>
				<td>
					<input type="text" name="userId"/>
				</td>
			</tr>
			<tr>
				<td>
					口令
				</td>
				<td>
					<input type="password" name="passwd"/>
				</td>
			</tr>
			<tr>
				<td>
					验证码
				</td>
				<td>
					<input type="text" name="check_code"/>
				</td>		
			</tr>
			<tr>
				<td>
					<img border=0 src="code.jsp">
				</td>
				<td>
					<input type="submit" value="确认">
				</td>
			</tr>
		</table>
        </form>
    </center>
	</body> 
</html>
