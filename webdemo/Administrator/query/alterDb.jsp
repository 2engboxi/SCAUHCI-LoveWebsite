<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>修改数据库</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String alOrDe = (String)session.getAttribute("alOrDe");
			out.println(alOrDe);
			try{
				
				String userid = request.getParameter("userid");        //获取用户ID
				String username = request.getParameter("username");    //获取用户名
				String userpass = request.getParameter("userpass");    //获取用户密码
				String email = request.getParameter("email");          //获取用户邮箱
				String sex = request.getParameter("sex");              //获取用户性别  
				String authority = request.getParameter("authority");  //获取用户权限 

				Class.forName("com.mysql.jdbc.Driver");     //加载数据库驱动

				String url="jdbc:mysql://localhost:3306/mldn";       //数据库名
				String userDbName="root";				        //数据库用户名
				String password="root";                     //数据库密码

				Connection connection=DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/mldn",userDbName,password); // 创建连接

                if(alOrDe.equals("0")){
					String alterName = "update user_info set username=? where userid=?";
					PreparedStatement ps = connection.prepareStatement(alterName);// 创建语句
					ps.setString(1,username);
					ps.setString(2,userid);
					ps.executeUpdate();                              //更新用户名
	
					String alterPass = "update user_info set userpass=? where userid=?";
					ps = connection.prepareStatement(alterPass);// 创建语句
					ps.setString(1,userpass);
					ps.setString(2,userid);    
					ps.executeUpdate();                             //更新密码

					String alterEmail = "update user_info set email=? where userid=?";
					ps = connection.prepareStatement(alterEmail);// 创建语句
					ps.setString(1,email);
					ps.setString(2,userid); 
					ps.executeUpdate();                              //更新用户邮箱

					String alterSex = "update user_info set sex=? where userid=?";
					ps = connection.prepareStatement(alterSex);// 创建语句
					ps.setString(1,sex);
					ps.setString(2,userid);
					ps.executeUpdate();								//更新用户性别

					String alterAuthority = "update user_info set authority=? where userid=?";
					ps = connection.prepareStatement(alterAuthority);// 创建语句
					ps.setString(1,authority);
					ps.setString(2,userid);
					ps.executeUpdate();                              //更新用户权限                        
				

					ps.close();                          //关闭PreparedStatement
					connection.close();                  //关闭connection
		%>

					<script language="javaScript">
						alert("修改成功！");
						window.location.href="deal.jsp";
		           </script>

		<%
				}else{
					String DeleteName = "delete from user_info where userid=?";     //删除数据库中数据的语句
					userid=request.getParameter("id");
					PreparedStatement ps1 = connection.prepareStatement(DeleteName);// 创建语句
					ps1.setString(1,userid);
					ps1.executeUpdate();                          //删除用户
					
					ps1.close();                          //关闭PreparedStatement
					connection.close();                  //关闭connection
		%>


					<script language="javaScript">
						alert("删除成功！");
						window.location.href="deal.jsp";
		           </script>

		<%
				}

			}catch(Exception e){
					e.printStackTrace();
			}
		%>

	</body>
</html>