<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String name = (String) session.getAttribute("name");
if (name == null) { %>
	<jsp:forward page="/peas/index.jsp" /><%
} %>

<div id="Header">
	<div id="Logo"><a href="dean"><img src="image/Logo.png" alt="" border="0" /></a></div>
	<div id="TopLink">
		<a href="/peas/dean"><img src="image/Icon_Help.gif" alt="" />帮助</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/peas/logout.jsp"><img src="image/Icon_Exit.gif" alt="" />退出</a>
	</div>
	<div id="UserInfo">欢迎您：<%=name%>&nbsp;&nbsp;&nbsp;&nbsp;当前身份：教务员</div>			
	<div id="Nav">
		<ul>
			<li><a href="dean">首  页</a></li>
			<li><a href="dean/studentManage">学生管理</a></li>
			<li><a href="dean/scoreManage">成绩管理</a></li>
			<li><a href="dean/courseManage">课程管理</a></li>
			<li><a href="dean/deanInfo">教务员信息</a></li>
		</ul>
	</div>
</div>

