<%@ page contentType="text/html; charset=gbk" language="java" import="java.util.*" %>
<%@ page import="org.zbx.chatRoom.UserInfo"%>
<% request.setCharacterEncoding("gbk"); %>
<%
	UserInfo list=UserInfo.getInstance();
	Vector vector=list.getList();                                             //��ȡ������Ա�б� 
	int amount=0;
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td height="32" align="center" class="word_orange ">��ӭ��scau��ƶ��վ�����ң�</td>
  </tr>
  <tr>
	<td height="23" align="center"><a  href="#" onclick="set('������')">������</a></td>
  </tr>  
 <%
	if(vector!=null&&vector.size()>0){
      String username="";  
      amount=vector.size();
      for(int i=0;i<amount;i++){
           username=(String)vector.elementAt(i);           //��ȡ�����û����û���
 %>
  <tr>
    <td height="23" align="center">                                <!--��ʾ�����û����û���-->
            <a href="#" onclick="set('<%=username%>')"><%=username%></a></td>
  </tr>
<%}}%>
<tr><td height="30" align="center">��ǰ����[<font color="#FF6600"><%=amount%></font>]��</td></tr>                                                                                   <!--��ʾ��������-->
</table>