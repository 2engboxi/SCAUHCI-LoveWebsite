<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.Date,javax.mail.Message,javax.mail.Session,javax.mail.Transport,javax.mail.internet.InternetAddress,javax.mail.internet.MimeMessage"%>
<%@ page import="com.scau.caterZhong.mailSecurity.MySecurity"%>
<%@ page import="java.util.*"%>
<%@ page import="com.scau.caterZhong.user.User"%>
<%@ page import="java.io.File"%>
<%@ page import="javax.activation.DataHandler"%>
<%@ page import="javax.activation.DataSource"%>
<%@ page import="javax.activation.FileDataSource"%>
<%@ page import="javax.mail.BodyPart"%>
<%@ page import="javax.mail.Multipart"%>
<%@ page import="javax.mail.internet.MimeBodyPart"%>
<%@ page import="javax.mail.internet.MimeMultipart"%>
<%@ page import="java.File.*"%>

<html>
	<head>
		<title>发送邮件</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<% 
			response.setHeader("refresh","2;URL=E-mailSurface.jsp");
		%>
	</head>
	<body>

		<%
			InternetAddress[] address =  null;   //定义绑定地址
			String mailserver = "scaulove.cn";  //邮件服务器名称
			String from = "cater@scaulove.cn";  //发件人E-mail
			String to="cater168fs@163.com";    //收件人E-mail
			//String subject = "测试一";
			String subject=session.getAttribute("subject").toString();   //邮件标题
			//String messageText ="asdf";
			String messageText=session.getAttribute("messageText").toString();  //邮件内容
			String fileName = session.getAttribute("fileName").toString();
			String filePath = session.getAttribute("filePath").toString();
			
			java.util.Properties props = null;
			props = System.getProperties();      //设定Mail服务器和所使用的传输协议
			props.put("mail.smtp.host",mailserver);
			props.put("mail.smtp.auth","true");
			MySecurity msec = new MySecurity("cater","123456");//创建验证用户对象
			Session mailSession = Session.getDefaultInstance(props,msec);//产生新的Session对话
			mailSession.setDebug(false);  //不用调试
			Message msg = new MimeMessage(mailSession);//创建新的邮件信息
			msg.setFrom(new InternetAddress(from)); //设定传送邮件的发信人
			msg.setSubject(subject);//设定邮件的标题
			msg.setSentDate(new Date());//设定发送时间
			msg.setText(messageText); //设定邮件文字信息
			
	try{	Multipart multipart = new MimeMultipart(); //设定邮件内容
			BodyPart messageBodyPart = new MimeBodyPart(); //添加附件
			DataSource source = new FileDataSource("D:"+ File.separator+ filePath);//配置附件文件
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName(fileName);
			multipart.addBodyPart(messageBodyPart); //将附件加入到邮件内容中
			//添加邮件内容信息，传输html页面，以便使用文本编辑器
			messageBodyPart = new MimeBodyPart();
			//设置邮件具体内容，并设置编码防止出现乱码
			messageBodyPart.setContent(messageText,"text/html;charset=GBK");
			multipart.addBodyPart(messageBodyPart);
			msg.setContent(multipart);  //将邮件内容添加到邮件中
			
			
			String psOrAll = session.getAttribute("psOrAll").toString();
			if(psOrAll.equals("personal")){
				String receiver = session.getAttribute("receiver").toString();
				to = receiver;
				address = InternetAddress.parse(to,false);//设定传送邮件至收件人得信箱
				msg.setRecipients(Message.RecipientType.TO,address);//设定邮件的发送方式
				Transport.send(msg,msg.getAllRecipients()); //发送邮件	
				out.println("发送成功");
			}
			else{
				//获取用户邮箱
				List<User> email_list = (List<User>)(session.getAttribute("email_list"));
				
				//判断email_list是否有效，email_list中是否存在数据
				if(email_list==null||email_list.size()<1){
					out.println("不存在用户邮箱");
				}else{
					for(User user : email_list){
						to = user.getEmail();
						address = InternetAddress.parse(to,false);//设定传送邮件至收件人得信箱
						msg.setRecipients(Message.RecipientType.TO,address);//设定邮件的发送方式
						Transport.send(msg,msg.getAllRecipients()); //发送邮件	
							
					}	
					out.println("发送成功");	
				    
				}
			}	
			}catch(Exception e){
				out.println(e);
			}
			
		
		%>
	</body>
</html>