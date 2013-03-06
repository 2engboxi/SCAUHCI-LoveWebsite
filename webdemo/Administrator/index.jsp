<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<html>
	<head>
		<title>后台管理界面</title>
	</head>
	<body bottommargin="30" topmargin="30" leftmargin="0" rightmargin="0" marginheight="0" marginwidth="0" bgcolor="#808080" vlink="#000000" link="#000000" alink="#000000">
		<table align="center" cellspacing="0" cellspading="0" bgcolor="#D3D3D3" frame=vsides>
			<tbody>
				<tr>
					<td colspan="3"><center><img src="/webdemo/Administrator/photo/logo.jpg" /></center></td>
				</tr>
				
				<tr>
					<td colspan="2"><a href="index.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;<a href=/webdemo/Administrator/query/users.jsp>用户管理</a>&nbsp;&nbsp;&nbsp;<a href=/webdemo/Administrator/msg/msgMn.jsp>信息管理</a>&nbsp;&nbsp;&nbsp;<a href>留言管理</a>&nbsp;&nbsp;&nbsp;<a href="/webdemo/sendE-mail/E-mailSurface.jsp">邮箱管理</a></td>
					<td><center><input type="text" name="search"><input type="button" value="搜索" name="searchButton"></center></td>
				</tr>
				
				<tr>
					<td colspan="3"><HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#000000 SIZE=3></hr></td>
				</tr>
				
				<tr>
					<td width="20%"><font face="楷书">当前位置：首页</font></td>
					
					<td rowspan="3" width="65%" height="500" valign="top">
					<table width="100%">
					    <tr>
							<td colspan="4" valign="left" height="25">
								<h1>首&nbsp;&nbsp;页</h1>
							</td>
						</tr>
						<tr>
							<td colspan="4" height="40" valign="bottom">
								<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="100%" color=#000000 SIZE=10>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="left">								
								<image src="/webdemo/Administrator/photo/management.png">
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<h1>欢迎来到SCAU扶贫网站后台界面</h1>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="right">								
								<image src="/webdemo/Administrator/photo/management.png">
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="100%" color=#000000 SIZE=10>
							</td>
						</tr>
					</table>
					</td>
		
					<td width="15%">
						<h4>欢迎<font face="楷体">管理员</font>登录!<font face="楷体"></h4>
						<h4><font face="楷体">退出登录&nbsp;<input type="image" value="退出登录" src="/webdemo/Administrator/photo/exit.png" style="height:30ps" width="30ps"></font></h4>	
					</td>
				</tr>
				
				<tr>
					<td>
						<input type="image" src="photo/mm.png">&nbsp;&nbsp;<h5>用户信息模块</h5></center><br>
						<input type="image" src="photo/mm.png">&nbsp;&nbsp;<h5>爱心信息模块</h5></center><br>
						<input type="image" src="photo/mm.png">&nbsp;&nbsp;<h5>留言信息模块</h5></center><br>
						<input type="image" src="photo/mm.png">&nbsp;&nbsp;<h5>邮件管理模块</h5></center><br>
					</td>
					<td valign="bottom">
						<input type="image" src="/webdemo/Administrator/photo/server_2.png" style="height:150ps" width="150ps">	
					</td>
				</tr>
				<tr>
					<td>
						<input type="image" src="photo/clock.png" style="height:100ps" width="100ps">					
						<div id="test">loading..............</div>
							<script >
								setInterval("test.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
							</script>
					</td>
					<td>
						<h3>鸣&nbsp;&nbsp;谢:^&@工作小组</h3><br>
						<h3>热线电话:o(≧v≦)o</h3>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3></td>
				</tr>
				<tr>
					<td colspan="3" align="center">Copyright © 2013   All Rights Reserved</td>
				</tr>
			</body>
		</table>
	</body>
</html>