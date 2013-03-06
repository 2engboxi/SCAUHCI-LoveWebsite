<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.scau.caterZhong.user.User"%>
<%@ page import="java.File.*"%>
<%@ page import="com.jspsmart.upload.*"%>

<html>
	<head>
		<title>取出数据库数据</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	</head>
	<body>
			<%
				try{
					SmartUpload su=new SmartUpload();	//实例化SmartUpload上传组件
					su.initialize(pageContext);			//初始化上传操作
					su.upload();						//上传准备
					su.save("upload");					//将上传文件保存在upload文件夹中
					String fileName=su.getFiles().getFile(0).getFileName();
					String photoPath=request.getContextPath()+"/upload/"+fileName;
					session.setAttribute("fileName",fileName);
					session.setAttribute("filePath",photoPath);
					
					String psOrAll = session.getAttribute("psOrAll").toString();//获得psOrAll记录发送单个人的邮件还是群发
					session.setAttribute("psOrAll",psOrAll);
							
					request.setCharacterEncoding("utf-8");
					String subject = su.getRequest().getParameter("subject");  //获取邮件标题
					session.setAttribute("subject",subject);
					
					String messageText = su.getRequest().getParameter("messageText"); //获取邮件内容
					session.setAttribute("messageText",messageText);
					
					String receiver;
					if(psOrAll.equals("personal")){
						receiver = su.getRequest().getParameter("receiver");   //获取收件人邮箱
						session.setAttribute("receiver",receiver);
					}
					else{
						Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动

						String url="jdbc:mysql://localhost:";   //数据库名
						String username="root";				//数据库用户名
						String password="root";             //数据库密码

						Connection connection=DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/mldn",username,password); // 创建连接

						Statement statement = connection.createStatement();// 创建语句

						ResultSet resultSet = statement.executeQuery("select * from user_info");// 执行语句	
						
						List<User> email_list = new ArrayList<User>();
						while (resultSet.next()) {
							User newUser = new User();
							newUser.setUserid(resultSet.getString(1));
							newUser.setUsername(resultSet.getString(2));
							newUser.setUserpass(resultSet.getString(3));
							newUser.setEmail(resultSet.getString(4));
							newUser.setSex(resultSet.getString(5));
							newUser.setAuthority(resultSet.getString(6));
							email_list.add(newUser);
					}	
						session.setAttribute("email_list",email_list);

						resultSet.close();
						statement.close();
						connection.close();// 关闭连接
					} 
					//转发到发邮件页面
					
				}
				catch(Exception e){
					out.println(e);
				}
				response.sendRedirect("CompleteUpload.jsp");
			%>
		     
	</body>
</html>


