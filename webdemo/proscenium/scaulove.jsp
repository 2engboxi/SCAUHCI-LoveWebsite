<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.scau.caterZhong.upload_msg.Upload_msg"%>
<%@ page import="java.util.*"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="scaulove.css">
	<title></title>
</head>
<body>
	<script type="text/javascript" src="my.js"></script>
	<div id="header1">
		<div id="logo">
			<a href="logo.html" target="_blank" >
				<img src="img/logo.gif" alt="logo" />
			</a>
		</div>
		<!--login开始-->
		<div class="login">
			<%
					String loginname=session.getAttribute("loginname").toString();
					
			%>		
			
			<%
			try{
				//获取所有用户上传信息
				request.setCharacterEncoding("utf-8");
				List<Upload_msg> release_msg_list = (List<Upload_msg>)session.getAttribute("release_msg_list");
				
				//判断集合是否有效
				int pic_amount = release_msg_list.size();
				int pic_index = pic_amount-1;
				String mainPic0 = "img/banner1.jpg";   //定义主页面中横排四张图片的默认路径和标题
				String mainPic1 = "img/banner2.jpg";
				String mainPic2 = "img/banner3.jpg";
				String mainPic3 = "img/banner4.jpg";
				
				String mainPic0_title = "picture1";
				String mainPic1_title = "picture2";
				String mainPic2_title = "picture3";
				String mainPic3_title = "picture4";
				
				if(release_msg_list==null||pic_amount<1){
					out.println("没有用户上传信息");
				}else{
					mainPic0= release_msg_list.get(pic_index).getPhotoUrl();   //取数据库中发布表中最新的一张图和标题
					mainPic0_title = release_msg_list.get(pic_index--).getNewsTitle();
					
					if(pic_amount>1){
						mainPic1= release_msg_list.get(pic_index).getPhotoUrl();
						mainPic1_title = release_msg_list.get(pic_index--).getNewsTitle();
					}
					
					if(pic_amount>2){
						mainPic2= release_msg_list.get(pic_index).getPhotoUrl();
						mainPic2_title = release_msg_list.get(pic_index--).getNewsTitle();
					}
					
					if(pic_amount>3){
						mainPic3= release_msg_list.get(pic_index).getPhotoUrl();
						mainPic3_title = release_msg_list.get(pic_index--).getNewsTitle();
					}
					
				}
				if(loginname.equals("游客")){
			%>
			
				<form action="/webdemo/login and register/login_check.jsp" method="post">
				<ul>
					<li>
						<label for="">帐号</label>
						<input type="text" name="name" id="login_ID" value="会员名/注册邮箱/姓名" onfocus="changeLoginId(this.value,this.id);"/>
					</li>
					<li>
						<label for="">密码</label>
						<input type="password" name="password" onpaste="return false" oncopy="document.selection.empty()" />
					</li>
					<li>
						<input class="login_submit" type="submit" value="登录" />
						<a href="注册.html">注册</a>
						<a href="找回密码.html">忘记密码？</a>
					</li>
				</ul>	
			</form>
			<%
				}else{
			%>
				<h3><font face="楷体">你好，<%=loginname%></font></h3><h4><a href=logout.jsp>注销</a></h4>
				<input type="button" value="">
			<%
				}
			%>
			
			
		
			
		</div>
		<!--login结束-->
    </div>
    <!--header1结束-->

	<!--header开始-->
	<div class="header">
		<!--menu开始-->
		<div class="menu">
			<ul>
				<li id="home" ><a href="scaulove.jsp">首页</a></li>
				<li id="helpnews"><a href="consult.jsp">求助资讯</a></li>
				<li id="helpme"><a href="help.jsp">我要求助</a></li>
				<li id="lovers"><a href="charac.jsp">爱心人物</a></li>
				<li id="lovelist"><a href="board.jsp">留言板</a></li>
				<li id="laternews"><a href="follow_up.jsp">后续报道</a></li>
				<li id="aboutus"><a href="about.html">关于我们</a></li>
			</ul>
		</div>
		<!--menu结束-->
		<div class="undermenu">
			<img src="img/undermenu.png" alt="" />
		</div>
	</div>
	<!--header结束-->
    <!--banner开始-->
    <div class="banner">
		<ul>
			<li class="thumbnail"><a href="huang.html"><img src="<%=mainPic0%>" alt="<%=mainPic0_title%>" /></a></li>
			<li class="thumbnail"><a href="huang.html"><img src="<%=mainPic1%>" alt="<%=mainPic1_title%>" /></a></li>
			<li class="thumbnail"><a href="huang.html"><img src="<%=mainPic2%>" alt="<%=mainPic2_title%>" /></a></li>
			<li class="thumbnail"><a href="huang.html"><img src="<%=mainPic3%>" alt="<%=mainPic3_title%>" /></a></li>
		</ul>
	</div>
	<!--banner结束-->
	
	<%
		 String help_pic0 = "img/body_left1.jpg";      //定义他们需要你的帮助栏的图片路径和标题、内容
		 String help_pic1 = "img/body_left2.jpg";
		 String help_pic2 = "img/body_left3.jpg";
		 
		 String help_title0 ="天降不幸";
		 String help_title1 ="天降不幸";
		 String help_title2 ="天降不幸";
		 
		 String help_content0 ="民权县白云寺镇吴月同学克服化疗带来的巨大痛苦，坚持学习，在今年的期末考试中考了年级第一名；北关镇吴雪健、褚庙乡张洋小同学也都是聪明可人，品学兼优的孩子。夏邑县李集镇杨茂宇得病后，面对严重病情和巨额费用，万般无奈之下家长打算放弃治疗民权县白云寺镇吴月同学克服化疗带来的巨大痛苦，坚持学习，在今年的期末考试中考民权县白云寺镇吴月同学克服化疗带来的巨大痛苦，坚持学习，在今年的期末考试中考民权县白云寺镇吴月同学克服化疗带来的巨大痛苦，坚持学习，在今年的期末考试中考";
		 String help_content1 =help_content0;
		 String help_content2 =help_content0;
		 
		 if(pic_amount>4){
				help_pic0= release_msg_list.get(pic_index).getPhotoUrl();
				help_title0 = release_msg_list.get(pic_index).getNewsTitle();
				help_content0 = release_msg_list.get(pic_index--).getNewsNote();
		 }
		if(pic_amount>5){
				help_pic1= release_msg_list.get(pic_index).getPhotoUrl();
				help_title1 = release_msg_list.get(pic_index).getNewsTitle();
				help_content1 = release_msg_list.get(pic_index--).getNewsNote();
		 }
		if(pic_amount>6){
				help_pic2= release_msg_list.get(pic_index).getPhotoUrl();
				help_title2 = release_msg_list.get(pic_index).getNewsTitle();
				help_content2 = release_msg_list.get(pic_index--).getNewsNote();
		 }
		 
		if(help_content0.length()>150){
			help_content0 = help_content0.substring(0,150)+ "...";
		}
		
		if(help_content1.length()>200){
			help_content1 = help_content1.substring(0,150)+ "...";
		}
		
		if(help_content2.length()>200){
			help_content2 = help_content2.substring(0,150)+ "...";
		}
	%>
	<!--body开始-->
	<div class="body">
		<!--body_left开始-->
		<div class="body_left">
			<!--body_left1开始-->
			<div class="body_left1" >
				<h2 class="body_left1_maintitle"><a href="consult.html">他们需要您的援手</a><img src="img/line1.gif" alt="a line" /></h2>
				 
				<div class="body_left1_img">
					<a href="exam.html"><img id="img" src="<%=help_pic0%>" alt="<%=help_title0%>" /></a>
				</div>
                <div class="body_left1_main">
                    <h3 class="body_left1_title"><a href="exam.html"><%=help_title0%></a></h3>
                    <p class="body_left1_content"><a href="exam.html"><%=help_content0%></a>
                    </p>
                </div>
			</div>
			<!--body_left1结束-->
			<!--body_left2开始-->
			<div class="body_left2">
				<div class="body_left1_img"> 
					<a href="exam.html"><img id="img" src="<%=help_pic1%>" alt="<%=help_title1%>" /></a>
				</div>
                <div class="body_left2_main">
                    <h3 class="body_left2_title"><a href="exam.html"><%=help_title1%></a></h3>
                    <p class="body_left2_content"><a href="exam.html"><%=help_content1%></a>
                    </p>
                </div>
			</div>
			<!--body_left2结束-->
			<!--body_left3开始-->
			<div class="body_left3">
				<div class="body_left1_img">
					<a href="exam.html"><img id="img" src="<%=help_pic2%>" alt="<%=help_title2%>" /></a>
				</div>
                <div class="body_left3_main">
                    <h3 class="body_left3_title"><a href="exam.html"><%=help_title2%></a></h3>
                    <p class="body_left3_content"><a href="exam.html"><%=help_content2%></a>
                    </p>
                </div>
                <span class="more"><a href="consult.html">+更多</a></span>
			</div>
			<!--body_left3结束-->

			<!--body_left4_laternews开始-->
			<div class="body_left4_laternews">
				<h2  class="body_left1_maintitle"><a href="follow_up.html">后续报道</a><img src="img/line2.gif" alt="a line" /></h2>
				<div class="body_left4_content">
					<p class="body_left4_content1"><a href="hong.html">民权县白云寺镇吴月同学克服化疗带来的巨大痛苦，坚持学习，在今年的期末考试中考了年级第一名；北关镇吴雪健、褚庙乡张洋小同学也都是聪明可人，品学兼优的孩子。夏邑县李集镇杨茂宇得病后，面对严重病情和巨额费用，万般无奈之下家长打算放弃治疗民权县白云寺镇吴月同学克服化疗带来的巨大痛苦，坚持学习，在今年的期末考试中考民权县白云寺镇吴月同学克服化疗带来的巨大痛苦，坚持学习，在今年的期末考试中考民权县白云寺镇吴月同学克服化疗带来的巨大痛苦，坚持学习，在今年的期末考试中考</a>
					</p>
					<span class="body_left4_line">
					    <ul>
						    <li><a href="hong.html">小明小明小明的境况</a></li>
						    <li><a href="hong.html">小红小红小红的境况</a></li>
					    </ul>
				    </span>
				</div>
				<div class="body_left4_img"><img id="img" src="img/body_left4.jpg" alt="children" /></div>
				<span class="more"><a href="follow_up.html">+更多</a></span>
			</div>
			<!--body_left4_laternews结束-->
            
		</div>
		<!--body_left结束-->
		<!--solid开始-->
		<div class="solid">
			<!--solid1开始-->
			<div class="solid1">
				<a href="help.html">
				<div class="solid1_bg">
					<p class="p1">你有困难?</p>
				    <p class="p2">我们来帮你!</p>
				    <img src="img/solid1_img.png" alt="告诉我们你的困难" />
				</div>
				</a>
			</div>
			<!--solid1结束-->
			<!--solid2开始-->
			<div class="solid2">
				<div class="page foldtl page2">
		            <h2><a href="board.html">留言板</a></h2>
		            <p><a href="board.html">留言板留言板留言板留言板留言板</a></p>
	            </div>
			</div>
			<!--solid2结束-->
			
		</div>
		<!--solid结束-->
	</div>
	<!--body结束-->
	<!--lovers开始-->
	<div class="lovers_scroll">
	<h2><a href="charac.htmls">爱心人物</a></h2>
	<div class="scroll" id="scrollbox" onMouseMove="MoveDiv(event);" onMouseOut="MoveOutDiv();">
        <div id="scrollcon" >
            <table>
                <tbody>
                    <tr>
                        <td>                           
                            <table>
                                <tr>
                                    <td><a href="huang.html" target="_blank"><img src="img/lovers1.jpg" alt="huang" /></a></td>
                                    <td><a href="huang.html" target="_blank"><img src="img/lovers1.jpg" alt="huang" /></a></td>
                                    <td><a href="huang.html" target="_blank"><img src="img/lovers1.jpg" alt="huang" /></a></td>
                                    <td><a href="huang.html" target="_blank"><img src="img/lovers1.jpg" alt="huang" /></a></td>
                                    <td><a href="huang.html" target="_blank"><img src="img/lovers1.jpg" alt="huang" /></a></td>
                                    <td><a href="huang.html" target="_blank"><img src="img/lovers1.jpg" alt="huang" /></a></td>
                                    <td><a href="huang.html" target="_blank"><img src="img/lovers1.jpg" alt="huang" /></a></td>
                                </tr>
                            </table>
                        </td>
                        <td><div id="scrollcopy"></div></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    </div>
	<!--lovers_scroll接束-->
	<script type="text/javascript" src="my.js"></script>
	<!--footer开始-->
	<div class="footer">
		<p>copyright 曾柏羲、钟伟钊、方思霓、严思雯</p>
	</div>
	<!--footer结束-->
	
	<%
	}catch(Exception e){
	  out.println(e);
	}
	
	%>
</body>
</html>