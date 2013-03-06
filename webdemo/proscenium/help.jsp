<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<link rel="stylesheet" href="scaulove.css" />
	<title>我要求助</title>
	<script type="text/javascript">
	var M001="例如：2011级";
	var M002="请尽量书写清楚求助人的姓名、性别、年龄以及基本情况，另标明联系方式，以便日后联系帮助！";
	var M003='年级不能为空';
	var M004='标题不能为空';
	var M005='简介不能为空';
	function delContent(value,id)
	{
		var value=document.getElementById(id).value;
		if(value==M001||value==M002)
		{
			document.getElementById(id).value="";
		}
	}
	function checkValue(obj)
	{
		var id=obj.id;
		var value=obj.value.replace(/^\s+/,'').replace(/\s+$/,'');
		//检查年级
		if(id=="grade")
		{
			if(value=="")
			{
				document.getElementById("gradeError").innerHTML="<span class='error'>"+M003+"</span>";
			}
			else
			{
			    document.getElementById("gradeError").innerHTML="<span class='success'>"&nbsp;"</span>";
		    }
		}
		//检查标题
		if(id=="help_title")
		{
			if(value=="")
			{
				document.getElementById("help_titleError").innerHTML="<span class='error'>"+M004+"</span>";
			}
			else
			{
			    document.getElementById("help_titleError").innerHTML="<span class='success'>"&nbsp;"</span>";
		    }
		}
		//检查资料
		if(id=="information")
		{
			if(value=="")
			{
				document.getElementById("informationError").innerHTML="<span class='error'>"+M005+"</span>";
			}
			else
			{
				document.getElementById("informationError").innerHTML="<span class='success'>"&nbsp;"</span>";
			}
		}	
	}
	</script>
</head>
<body>
	<div class="span">
		<span class="span"><a href="scaulove.jsp">回到首页</a></span>
	    <span class="span">/求助审核</span>
	</div>
	<!--help_content begin-->
	<div id="help_content">
		<div class="helpinfomation">
			<form name="helpform" action="/webdemo/User/smartupload.jsp" method="post" enctype="multipart/form-data">
				<ul>
					<li>
						<label for="grade">年级:</label>
					    <input type="text" id="grade" value="例如：2011级" onblur="checkValue(this);" onfocus="delContent(this.value,this.id);"/>
					    <span for="gradeError" id="gradeError">请填写您真实的年级</span>
				    </li>
					<li>
						<label for="institude">学院:</label>
						<select name="institude" id="institude" >
							<option value=""></option>
							<option value="">农学院</option>
							<option value="">资源环境学院</option>
							<option value="">经济管理学院</option>
							<option value="">园艺学院</option>
							<option value="">兽医学院</option>
							<option value="">工程学院</option>
							<option value="">生命科学学院</option>
							<option value="">动物科学学院</option>
							<option value="">食品学院</option>
							<option value="">林学院</option>
							<option value="">人文与法学学院</option>
							<option value="">理学院</option>
							<option value="">信息学院 软件学院</option>
							<option value="">艺术学院</option>
							<option value="">外国语学院</option>
				            <option value="">水利与土木工程学院</option>
						    <option value="">公共管理学院</option>
						    <option value="">思想政治理论课教学部</option>
						    <option value="">体育教学研究部</option>
						    <option value="">继续教育学院</option>
						    <option value="">珠江学院</option>
						</select>
						<span id="institudeError">请选择您所在的学院</span>
					</li>
					<li>
						<label for="id">学号:</label>
					    <input type="text" id="id" name="uId"value="你的学号" onblur="checkValue(this);" onfocus="delContent(this.value,this.id);"/>
				    </li>
					<li>
						<label for="">标题:</label>
						<input type="text" id="help_title" name="title" onblur="checkValue(this);"/>
						<span id="help_titleError"></span>
					</li>
				    <li>
					    <label for="introduction">求助资料:</label>
					    <textarea name="textarea" id="information" cols="30" rows="10" onfocus="delContent(this.value,this.id);" onblur="checkValue(this);" >请尽量书写清楚求助人的姓名、性别、年龄以及基本情况，另标明联系方式，以便日后联系帮助！</textarea>
					    <span id="informationError"></span>
				    </li>
                    <li>
                    	<span>
                    		<label for="viewfile">上传图片：</label>
                    		<input type="text" name="viewfile" id="viewfile" class="viewfile" />
                    	</span> 
                        <input type="button" value="浏览" onclick="pic.click()" style="border: 1px solid #38597a;background: #4e7ba9;cursor: pointer;color: white;width: 80px;">  
                        <input type="file" name="pic" id="pic" style="display:none" onchange="viewfile.value=this.value" accept="image/gif, image/jpeg">
				    </li>
				    <li>
					    <input class="help_submit" type="submit"  value="提交"/>
					    <a href="register.html">要注册？</a>
				    </li>
				</ul>
			</form>
		</div>
		<div class="helpwarning">
			<h2>求助须知</h2>
			<p>1.求助信息的审核，需要用户注册成为我们网站的用户</p>
			<p>2.为确保您的信息审核通过，请如实填写左侧表单</p>
			<p>3.本网站旨在提供一个平台给需要帮助的校内学生</p>
		</div>
	</div>
	<!--help_content end-->
	
</body>
</html>