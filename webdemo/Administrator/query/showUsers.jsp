<%@ page contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.scau.caterZhong.user.User"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<title>后台管理界面</title>
		<script language="javaScript">
			function returnBack(){
				window.location.href="users.jsp";
			}
		</script>
	</head>
	<body bottommargin="30" topmargin="30" leftmargin="0" rightmargin="0" marginheight="0" marginwidth="0" bgcolor="#808080" vlink="#000000" link="#000000" alink="#000000">
		<table align="center" cellspacing="0" cellspading="0" bgcolor="#D3D3D3" frame=vsides>
			<tbody>
				<tr>
					<td colspan="3"><center><img src="/webdemo/Administrator/photo/logo.jpg" /></center></td>
				</tr>
				
				<tr>
					<td colspan="2"><a href="/webdemo/Administrator/index.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;<a href="users.jsp">用户管理</a>&nbsp;&nbsp;&nbsp;<a href>信息管理</a>&nbsp;&nbsp;&nbsp;<a href>聊天管理</a>&nbsp;&nbsp;&nbsp;<a href>留言管理</a>&nbsp;&nbsp;&nbsp;<a href="/webdemo/sendE-mail/E-mailSurface.jsp">邮箱管理</a></td>
					<td><center><input type="text" name="search"><input type="button" value="搜索" name="searchButton"></center></td>
				</tr>
				
				<tr>
					<td colspan="3"><HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3></hr></td>
				</tr>
				
				<tr>
					<td width="20%"><font face="楷书"><u>当前位置：首页>用户管理>查看信息</u></font></td>
					
					
					<td rowspan="3" width="65%" height="500" valign="top">	
					
					<table width="100%" height="150">		
				<%
					//获取用户信息
					List<User> list = (List<User>)(request.getAttribute("list"));

					//判断list是否有效，list中是否存在数据
					if(list==null||list.size()<1){
						out.print("不存在用户信息");
					}else{
				%>
				<tr>
				<td align="left" colspan="6" valign="top">
					<h2>用户信息查询</h2>
				</td>
				<tr>
				<td colspan="6">
					<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#000000 SIZE=3></hr>
				</td>
				</tr>
			    </tr>			
			    <tr align="center">
				<td><b><h3>ID</h3></b></td>
				<td><b><h3>用户姓名</h3></b></td>
				<td><b><h3>密码</b></h3></td>
				<td><b><h3>邮箱</b></h3></td>
				<td><b><h3>性别</b></h3></td>
				<td><b><h3>权限</b></h3></td>
			    </tr>	
				<%
						
					//遍历用户信息集合
						for(User newUser : list){	
				%>
			<tr align="center">
				<td height="60"><%=newUser.getUserid()%></td>
				<td><%=newUser.getUsername()%></td>
				<td><%=newUser.getUserpass()%></td>
				<td><%=newUser.getEmail()%></td>
				<td><%=newUser.getSex()%></td>
				<td><%=newUser.getAuthority()%></td>
			</tr>	            
				<%
					}
				%>
			<tr>
				<td colspan="6">
					<HR style="FILTER: alpha(opacity=80,finishopacity=0,style=3)" width="100%" color=#000000 SIZE=3></hr>
				</td>
				</tr>
			<tr align="center">
				<td align="center" colspan="6">
					<input type="button" name="back"  value="返 回" onclick="returnBack()">
				</td>
			</tr>
				<%
					}
				%>		
		</table>	
					</td>
					
					
					
					<td width="15%">
						<h4>欢迎<font face="楷体">管理员</font>登录!<font face="楷体"></h4>
						<h4><font face="楷体">退出登录&nbsp;<input type="image" src="/webdemo/Administrator/photo/exit.png" style="height:30ps" width="30ps"></font></h4>	
					</td>
				</tr>
				
				<tr>
					<td>
						<input type="image" src="/webdemo/Administrator/photo/mm.png">&nbsp;&nbsp;<h5>用户信息模块</h5></center><br>
						<input type="image" src="/webdemo/Administrator/photo/mm.png">&nbsp;&nbsp;<h5>爱心信息模块</h5></center><br>
						<input type="image" src="/webdemo/Administrator/photo/mm.png">&nbsp;&nbsp;<h5>聊天信息模块</h5></center><br>
						<input type="image" src="/webdemo/Administrator/photo/mm.png">&nbsp;&nbsp;<h5>留言板模块</h5></center><br>
					</td>
					<td valign="bottom">
						<input type="image" src="/webdemo/Administrator/photo/server_2.png" style="height:150ps" width="150ps">	
					</td>
				</tr>
				<tr>
					<td>
						<input type="image" src="/webdemo/Administrator/photo/clock.png" style="height:100ps" width="100ps">					
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
					<td colspan="3" align="center">Copyright ? 2013   All Rights Reserved</td>
				</tr>
			</body>
		</table>
	</body>
</html>