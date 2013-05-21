<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>研究生教务系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<base href="/peas/" />
	<link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico" />
	<link rel="stylesheet" href="homepage.css" /> 
</head>

<body>
<div id="Wrapper">
	<table width="740" height="100%" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="136">
				<div id="Logo">
					<a href="#"><img src="image/homepage/IndexLogo.png" border="0"> </a>
				</div>
			</td>
		</tr>
		<tr><td height="39"></td></tr>

		<tr>					
			<td height="341" id="Main">						    					
				<div id="Login">
					<font style="font-size: 12px;font-weight:bold;color: #FF0000"></font><br />
					<form action="login.jsp" method="post">
						<%
						String errormsg = request.getParameter("errormsg");
						if (errormsg == null);
						else if (errormsg.equals("blank_username_or_password"))
							%><font color="#FF0000">用户名或密码不能为空！</font><br /><%
						else if (errormsg.equals("wrong_username_or_password"))
							%><font color="#FF0000">用户名或密码错误！</font><br /><%
						%>
						<label for:"username">用户名</label>
						<input name="username" type="text" class="InputBox Username" /><br />
						<label for:"password">密　码</label>
						<input type="password" name="password" class="InputBox Password"><br />
						<input type="submit" class="Btn" value="" style="margin-left:42px;"/><br /><br /><br/>
					</form>
				</div>

				<div id="News">	
					<ul>
						<label style="color: red;font-size: 12px;">管理员登陆：</label>
						<li>用户名与初始密码为admin。</li><br/>
						<label style="color: red;font-size: 12px;">教师登录：</label>
						<li>用户名与初始密码为院系编号，如001。</li><br/>
						<label style="color: red;font-size: 12px;">学生登陆：</label>
						<li>用户名与初始密码为学号。</li><br/>
					</ul>
				</div>
			</td>					
		</tr>

		<tr>
			<td valign="top" id="Footer">
				Copyright &copy; 2013 All Rights Reserved. 版权所有：软件工程15组
				<a href="#">联系我们</a>
			</td>
		</tr>
	</table>
</div>

</body>
</html>