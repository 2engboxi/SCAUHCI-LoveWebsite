<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="com.scau.zengboxi.MySecurity"%>
<html>
	<head>
		<title>Send Mail Demo</title>
	</head>
	<%
		InternetAddress[] address =null;
		String mailServer="scau.cn";
		String from="zbx@scau.cn";
		String to="315964958@qq.com";
		String subject="Testing";
		String messageText="不是不是~~是我发的 再来一个 ~";
		java.util.Properties props=null;
		props=System.getProperties();
		props.put("mail.smtp.host",mailServer);
		props.put("mail.smtp.auth","true");
		MySecurity msec =new MySecurity("zbx","19911024");
		Session mailSession=Session.getDefaultInstance(props,msec);
		mailSession.setDebug(false);
		Message msg=new MimeMessage(mailSession);
		msg.setFrom(new InternetAddress(from));
		address=InternetAddress.parse(to,false);
		msg.setRecipients(Message.RecipientType.TO,address);
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		msg.setText(messageText);
		Transport.send(msg,msg.getAllRecipients());
		out.println("发送成功");
	%>
</html>