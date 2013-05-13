<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String uname = (String) session.getAttribute("uname");
if (uname == null) { %>
	<jsp:forward page="/peas" /><%
} %>

<div id="Header">
	<div id="Logo"><a href="student"><img src="image/Logo.png" alt="" border="0" /></a></div>
	<div id="TopLink">
		<a href="/peas/student"><img src="image/Icon_Help.gif" alt="" />帮助</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/peas/logout.jsp"><img src="image/Icon_Exit.gif" alt="" />退出</a>
	</div>
	<div id="UserInfo">欢迎您：<%=uname%>&nbsp;&nbsp;&nbsp;&nbsp;当前身份：学生</div>			
	<div id="Nav">
		<ul>
			<li><a href="student">首  页</a></li>
			<li><a href="student/personalInfo">个人信息</a></li>
			<li><a href="student/electivePlan">选课安排</a></li>
			<li><a href="student/scoreQuery">成绩查看</a></li>
		</ul>
	</div>
</div>

