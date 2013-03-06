<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="com.scau.zengboxi.Characters,java.util.*"%>
<html>
	<head>
		<title>查看用户上传信息</title>
		<script language="JavaScript">
			function dele(){
				window.location.href="delete_news.jsp"
			}
			function news_upload(){
				window.location.href="newsupload.jsp"
			}
			function upload_query(){
				window.location.href="newsupload.jsp"
			}
			function returnBack(){
				window.location.href="/webdemo/Administrator/character/charac.jsp";
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
					<td colspan="2">
						<a href="/webdemo/Administrator/index.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;<a href=/webdemo/Administrator/query/users.jsp>用户管理</a>&nbsp;&nbsp;&nbsp;<a href=/webdemo/Administrator/msg/msgMn.jsp>信息管理</a>&nbsp;&nbsp;&nbsp;<a href>聊天管理</a>&nbsp;&nbsp;&nbsp;<a href>留言管理</a>&nbsp;&nbsp;&nbsp;<a href="/webdemo/sendE-mail/E-mailSurface.jsp">邮箱管理</a>
					</td>
					
					<td>
					
						<input type="text" name="search"> <input type="button" value="搜索" name="searchButton">
					
					</td>
				</tr>
				
				<tr>
					<td colspan="3"><HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#000000 SIZE=3></hr></td>
				</tr>
				
				<tr>
					<td width="20%"><font face="楷书"><u>当前位置：首页>爱心人物>人物查看</u></font></td>
					
					<td rowspan="3" width="65%" height="500" valign="top">
					
					<table align="center" width="100%">
					<tr>
						<td colspan="2" align="left"><h2>爱心人物查看</h2></td>
					</tr>
					
					<tr>
						<td colspan="2"><HR style="FILTER: alpha(opacity=90,finishopacity=0,style=3)" width="100%" color=#000000 SIZE=3></hr></td>
					</tr>
					<%
						//获取对象信息集合
						List<Characters>list=(List<Characters>)request.getAttribute("person");
						//判断集合是否有效
						if(list==null||list.size()<1){
							out.println("没有数据!");
						}
						else{
						//遍历集合中的数据
						for(Characters person:list){
					%>
					<tr>
						<td rowspan="2" align="center"><img src="<%=person.getPhotoUrl()%>" style="width:130"><br><font face="楷体"><%=person.getCharacName()%></font></td>
						<td><h3>主要事迹</h3></td>
					</tr>
					<tr>
					<%
						String msg=person.getStory();
						if(msg.length()>150)
							msg=msg.substring(0,151)+"...";
					%>			
						<td valign="top" colspan="2" width="500"><%=msg%></td>
					</tr>
					<tr>
						<td colspan="2"><hr></hr></td>
					</tr>
					<%
						}
					}
					%>	
					<tr>
						<td colspan="2" align="center"><input type="button" value="返回" onclick="returnBack()"></td>
					</tr>
							
					</table>

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
					<td colspan="3" align="center"><HR style="FILTER: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#000000 SIZE=3></td>
				</tr>
				<tr>
					<td colspan="3" align="center">Copyright © 2013   All Rights Reserved</td>
				</tr>
			</body>
		</table>
	</body>
</html>