<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.scau.caterZhong.upload_msg.Upload_msg"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.scau.caterZhong.user.User"%>
<html>
	<head>
		<title>取出数据库中的news_info内容</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	</head>
	<body>
		<%
			try{
				Class.forName("com.mysql.jdbc.Driver");   //加载数据库驱动
			
				String username="root";                  //数据库用户名
				String password="root";                    //数据库密码
			
				Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/mldn",username,password); // 创建连接
				
				Statement statement = connection.createStatement();//创建语句
	
				ResultSet resultSet = statement.executeQuery("select * from news_info"); //执行查询语句
				
				List<Upload_msg> up_msg_list = new ArrayList<Upload_msg>();      //建立ArrayList用于储存数据库中的各个元组，
																				//每个元组为一个Upload_msg对象、

				while(resultSet.next()){	
				    Upload_msg upload_msg = new Upload_msg();  //建立Upload_msg对象储存元组属性
					upload_msg.setNewsId(resultSet.getInt("newsId"));
					upload_msg.setUserId(resultSet.getString("userId"));
					upload_msg.setNewsNote(resultSet.getString("newsNote"));
					upload_msg.setPhotoUrl(resultSet.getString("photoUrl"));
					upload_msg.setNewsTitle(resultSet.getString("newsTitle"));
					up_msg_list.add(upload_msg);              //把对象加入到ArrayList中
				}
			
				request.setAttribute("up_msg_list",up_msg_list);   //将用户上传信息集合放到request中，给下一个展示页面使用
			
				resultSet.close();      //关闭ResultSet
				statement.close();     //关闭Statement
				connection.close();     //关闭连接
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}catch(SQLException e){
				e.printStackTrace();
			}
			request.getRequestDispatcher("show_news_info.jsp").forward(request,response);
		%>
	</body>
</html>			
		