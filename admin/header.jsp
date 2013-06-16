<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String name = (String) session.getAttribute("name");
if (name == null) { %>
	<script>location.href='index.jsp';</script>
<%}%>

<div id="Header">
	<div id="Logo"><a href="admin"><img src="image/Logo.png" alt="" border="0" /></a></div>
	<div id="TopLink">
		<a href="/peas/admin"><img src="image/Icon_Help.gif" alt="" />帮助</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/peas/logout.jsp"><img src="image/Icon_Exit.gif" alt="" />退出</a>
	</div>
	<div id="UserInfo">欢迎您：<%=name%>&nbsp;&nbsp;&nbsp;&nbsp;当前身份：管理员</div>
	<div id="Nav">
		<ul>
			<li><a href="admin">首  页</a></li>
			<li><a href="admin/studentInfo">学籍信息</a></li>
			<li><a href="admin/courseManage">选课安排</a></li>
			<li><a href="admin/scoreManage">成绩管理</a></li>
		</ul>
	</div>
</div>

