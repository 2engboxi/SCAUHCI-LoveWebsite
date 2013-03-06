<%@ page contentType="text/html" pageEncoding="GBK"%>
<html>
<head>
	<title>扶贫网站聊天室</title>
	<link type="text/css" rel="stylesheet" href="main.css">
	<script language="javascript" src="JS/AjaxRequest.js"></script>
	<script language="JavaScript">
		function inner(){
			online.innerHTML="哈哈";
		}
		function showOnline(){
			 var loader=new net.AjaxRequest("online.jsp?nocache="+new Date().getTime(),deal_online,onerror,"GET");
			 //一定要加代码“?nocache="+new Date().getTime()”，否则将出现在线人员列表不更新的情况
		}
		function deal_online(){
			online.innerHTML=this.req.responseText;
		}
		function set(selectPerson){               //自动添加聊天对象
		    if(selectPerson!="<%=session.getAttribute("username")%>"){
				if(form1.isPrivate.checked && selectPerson=="所有人"){
                  alert("请选择私聊对象！");
				}else{
                  form1.to.value=selectPerson;
				}
			}else{
				alert("请重新选择聊天对象！");
			}
		}
	    function send(){       //验证聊天信息并发送
		 if(form1.to.value==""){
			    alert("请选择聊天对象！");return false;
		}
		if(form1.content1.value==""){
			    alert("发送信息不可以为空！");form1.content1.focus();return false;
		}
		if(form1.isPrivate.checked){
			    isPrivate="true";
		 }else{
			    isPrivate="false";
		}
		  var param="from="+form1.from.value+"&face="+form1.face.value+"&color="+form1.color.value+
			          "&to="+form1.to.value+"&content="+form1.content1.value+"&isPrivate="+isPrivate; 
		 var loader=new net.AjaxRequest("MessagesAction?action=sendMessage",deal_send,onerror,"POST",param);
		}

		function deal_content(){
			 var returnValue=this.req.responseText;         //获取Ajax处理页的返回值
			 var h=returnValue.replace(/\s/g,"");              //去除字符串中的Unicode空白符
			if(h=="error"){                             //判断在获取信息时是否产生错误，如果是则退出聊天室
				 Exit();
			}else{
					content.innerHTML=sysBBS+returnValue+"</span>";   //显示聊天内容
			}
		}

		
		window.setInterval("showContent();",1000);
		window.onload=function(){
			 showContent();                            //当页面载入后显示聊天内容
		}

		//window.setInterval("showOnline()",1000);
		window.setInterval("showOnline()",1000);
		window.onload=function(){
			showOnline();                              //当页面载入后显示在线人员列表
		}
	</script>
</head>
<body>
	<div class="whole">
	<div class="top">
		<img src="images/top.jpg" alt="top"/>
	</div>
	<div class="content">
		这里显示聊天内容
	</div>
	<div id="online">
		这里显示在线人员列表
		<input type="button" value="点击" onClick="inner()">
	</div>
	<div class="function">

		<form action="" name="form1" method="post" >
			<input name="from" type="hidden" value="<%=session.getAttribute("username")%>">[<%=session.getAttribute("username")%> ]对
			<input name="to" type="text" value="" size="35" readonly="readonly">
					表情
			<select name="face" class="wenbenkuang">
					<option  value="无表情的">无表情的</option>
					<option value="微笑着" selected>微笑着</option>
					<option value="笑呵呵地">笑呵呵地</option>
					 <!--引处省略了添加其他列表项的代码-->
					<option value="无精打采的">无精打采的</option>
			</select>
					说： 悄悄话
			<input name="isPrivate" type="checkbox" class="noborder" id="isPrivate" value="true" onClick="checkIsPrivate()">
					滚屏
			<input name="scrollScreen" type="checkbox" class="noborder" id="scrollScreen" onClick="checkScrollScreen()" value="1" checked>
			    	 字体颜色：
			<select name="color" size="1" class="wenbenkuang" id="select">
					<option selected>默认颜色</option>
					<option style="color:#FF0000" value="FF0000">红色热情</option>
					<option style="color:#0000FF" value="0000ff">蓝色开朗</option>
					 <!--引处省略了添加其他列表项的代码-->
					 <option style="color:#999999" value="999999">烟雨蒙蒙</option>
		   </select>
					<input name="content1" type="text" size="70" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}">
					<input name="Submit2" type="button" class="btn_blank" value="发送" onClick="send()">
					<input name="button_exit" type="button" class="btn_orange" value="退出聊天室" onClick="Exit()">
		</form>
	</div>
	<div class="bottom">
		这里显示的是网页底部
	</div>
	</div>
</body>
</html>