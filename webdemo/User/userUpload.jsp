<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<html>
	<head>
		<title>用户信息上传</title>
	</head>
	<body>
		<center>
			<h2>用户资料上传</h2>                          
			 <form action="smartupload.jsp" method="post" enctype="multipart/form-data">
			 <table>
			 <tr>
				<td>
					上传者:
				</td>
				<td>
					<input type="text" name="uname" size="45">
				</td>
			 </tr>
			 <tr>
				<td>
					I&nbsp;&nbsp;D:
				</td>
				<td>
					<input type="text" name="uId" size="45">
				</td>
			 </tr>
			 <tr>
				<td>
					标&nbsp;&nbsp;题:
				</td>
				<td>
					<input type="text" name="title" size="45">
				</td>
			 </tr>
			 <tr>
				<td>
					正&nbsp;&nbsp;文:
				</td>
				<td>
					<textarea cols="45" rows="9" name="textarea"></textarea>
				</td>
			 </tr>
			 <tr>
				<td>
					图&nbsp;&nbsp;片:
				</td>
				<td>
					<input type="file" name="pic">
				</td>
			 </tr>
			 <tr>
				<td>
					<input type="submit" value="上传">
				</td>
				<td>
					<input type="reset" value="重置">
				</td>
			 </tr>
			</table>
			</form>
		</center>
	</body>
</html>