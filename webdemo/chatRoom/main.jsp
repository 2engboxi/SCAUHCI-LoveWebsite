<%@ page contentType="text/html" pageEncoding="GBK"%>
<html>
<head>
	<title>��ƶ��վ������</title>
	<link type="text/css" rel="stylesheet" href="main.css">
	<script language="javascript" src="JS/AjaxRequest.js"></script>
	<script language="JavaScript">
		function inner(){
			online.innerHTML="����";
		}
		function showOnline(){
			 var loader=new net.AjaxRequest("online.jsp?nocache="+new Date().getTime(),deal_online,onerror,"GET");
			 //һ��Ҫ�Ӵ��롰?nocache="+new Date().getTime()�������򽫳���������Ա�б����µ����
		}
		function deal_online(){
			online.innerHTML=this.req.responseText;
		}
		function set(selectPerson){               //�Զ�����������
		    if(selectPerson!="<%=session.getAttribute("username")%>"){
				if(form1.isPrivate.checked && selectPerson=="������"){
                  alert("��ѡ��˽�Ķ���");
				}else{
                  form1.to.value=selectPerson;
				}
			}else{
				alert("������ѡ���������");
			}
		}
	    function send(){       //��֤������Ϣ������
		 if(form1.to.value==""){
			    alert("��ѡ���������");return false;
		}
		if(form1.content1.value==""){
			    alert("������Ϣ������Ϊ�գ�");form1.content1.focus();return false;
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
			 var returnValue=this.req.responseText;         //��ȡAjax����ҳ�ķ���ֵ
			 var h=returnValue.replace(/\s/g,"");              //ȥ���ַ����е�Unicode�հ׷�
			if(h=="error"){                             //�ж��ڻ�ȡ��Ϣʱ�Ƿ����������������˳�������
				 Exit();
			}else{
					content.innerHTML=sysBBS+returnValue+"</span>";   //��ʾ��������
			}
		}

		
		window.setInterval("showContent();",1000);
		window.onload=function(){
			 showContent();                            //��ҳ���������ʾ��������
		}

		//window.setInterval("showOnline()",1000);
		window.setInterval("showOnline()",1000);
		window.onload=function(){
			showOnline();                              //��ҳ���������ʾ������Ա�б�
		}
	</script>
</head>
<body>
	<div class="whole">
	<div class="top">
		<img src="images/top.jpg" alt="top"/>
	</div>
	<div class="content">
		������ʾ��������
	</div>
	<div id="online">
		������ʾ������Ա�б�
		<input type="button" value="���" onClick="inner()">
	</div>
	<div class="function">

		<form action="" name="form1" method="post" >
			<input name="from" type="hidden" value="<%=session.getAttribute("username")%>">[<%=session.getAttribute("username")%> ]��
			<input name="to" type="text" value="" size="35" readonly="readonly">
					����
			<select name="face" class="wenbenkuang">
					<option  value="�ޱ����">�ޱ����</option>
					<option value="΢Ц��" selected>΢Ц��</option>
					<option value="Ц�Ǻǵ�">Ц�Ǻǵ�</option>
					 <!--����ʡ������������б���Ĵ���-->
					<option value="�޾���ɵ�">�޾���ɵ�</option>
			</select>
					˵�� ���Ļ�
			<input name="isPrivate" type="checkbox" class="noborder" id="isPrivate" value="true" onClick="checkIsPrivate()">
					����
			<input name="scrollScreen" type="checkbox" class="noborder" id="scrollScreen" onClick="checkScrollScreen()" value="1" checked>
			    	 ������ɫ��
			<select name="color" size="1" class="wenbenkuang" id="select">
					<option selected>Ĭ����ɫ</option>
					<option style="color:#FF0000" value="FF0000">��ɫ����</option>
					<option style="color:#0000FF" value="0000ff">��ɫ����</option>
					 <!--����ʡ������������б���Ĵ���-->
					 <option style="color:#999999" value="999999">��������</option>
		   </select>
					<input name="content1" type="text" size="70" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}">
					<input name="Submit2" type="button" class="btn_blank" value="����" onClick="send()">
					<input name="button_exit" type="button" class="btn_orange" value="�˳�������" onClick="Exit()">
		</form>
	</div>
	<div class="bottom">
		������ʾ������ҳ�ײ�
	</div>
	</div>
</body>
</html>