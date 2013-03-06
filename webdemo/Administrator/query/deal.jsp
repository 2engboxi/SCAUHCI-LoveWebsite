<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.scau.caterZhong.user.User"%>
<html>
	<head>
		<title>取出数据库数据</title>
	</head>
	<body>
			
	    
			<%
				Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动

				String url="jdbc:mysql://localhost:";   //数据库名
				String username="root";				//数据库用户名
				String password="root";             //数据库密码

				Connection connection=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/mldn",username,password); // 创建连接

			    Statement statement = connection.createStatement();// 创建语句

				ResultSet resultSet = statement.executeQuery("select * from user_info");// 执行语句	
				
				boolean print = true; // 处理ResultSet
				List<User> list = new ArrayList<User>();
				while (resultSet.next()) {
					User newUser = new User();
					newUser.setUserid(resultSet.getString(1));
					newUser.setUsername(resultSet.getString(2));
					newUser.setUserpass(resultSet.getString(3));
					newUser.setEmail(resultSet.getString(4));
					newUser.setSex(resultSet.getString(5));
					newUser.setAuthority(resultSet.getString(6));
					list.add(newUser);
				}	
				request.setAttribute("list",list);

				resultSet.close();
				statement.close();
				connection.close();// 关闭连接

				//根据点击按钮的不同，转发到不同的页面显示
				request.setCharacterEncoding("utf-8");
				
				String alOrDe = session.getAttribute("alOrDe").toString();
				String condition="sdf";
				if(alOrDe.equals("2")){
					condition = request.getParameter("Submit");
				}
                
				if(condition.equals("查看用户信息")){
			%>
					
					<jsp:forward page="showUsers.jsp"/>

			<%
				}else if(condition.equals("修改用户信息")||alOrDe.equals("0")){
			%>

					<jsp:forward page="showAlterUsers.jsp"/>

			<%
				}else{				    
			%>	
			
				<jsp:forward page="showDeleteUsers.jsp"/>
            
			<%  
				}
			%>

		     
	</body>
</html>


