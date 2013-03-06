<%@ page contentType="text/html" pageEncoding="utf-8"%> 

<html> 
	<head>  
		<title>爱心信息管理</title> 
	</head> 
	<body> 
		<input type="button" value="查看用户信息">
		<input type="button" value="确定审核发布">
		<input type="button" value="添加表格" onClick="addTable()"/>
		<input type="button" value="删除表格" onClick="deleteTable()"/>
		<!--SPAN标记有一个重要而实用的特性，即它什么事也不会做，它的唯一目的就是围绕你的HTML代码中的其它元素，这样你就可以为它们指定样式了-->
		<span id="test"/>
		<script>
			function addTable()
		 {
			test.innerHTML="<table border=';1';><tr><td>Enjoy</td></tr><tr><td>Enjoy</td></tr><tr><td>Enjoy</td></tr><tr><td>Enjoy</td></tr><tr><td>Enjoy</td></tr><tr><td>Enjoy</td></tr><tr><td>Enjoy</td></tr></table>";
		 }
			function deleteTable()
		 {
			test.innerHTML="";
		 }
		</script>

	</body> 
</html>
