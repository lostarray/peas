<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="peas.*" %>
<jsp:useBean id="total" class="peas.Total" scope="application" />

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>研究生教务系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<base href="/peas/" />
	<link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico" />
	<link rel="stylesheet" href="style.css" />
</head>

<body>
<jsp:include page="../header.jsp" />

<script>
	function confirm_delete() {
		var r = confirm("确定要删除该导师吗?"); 
		return r;
	}
</script>

<%
String username = (String) session.getAttribute("username");
request.setCharacterEncoding("utf-8");
String method = request.getParameter("method");
String teacherno = request.getParameter("teacherno");
String name = request.getParameter("name");
String ename = request.getParameter("ename");
String gender = request.getParameter("gender");
String title = request.getParameter("title");
String remark = request.getParameter("remark");
%>

<div id="Function" style="font-size:13px">
<%
if (method == null) {
	ResultSet resultset = total.teacherManage(username);
	resultset.last();
	out.println("共有" + resultset.getRow() + "名导师");
	resultset.beforeFirst();
%>
	&nbsp;&nbsp;
	<a href="dean/studentManage/teacherManage.jsp?method=add">添加导师</a>
	<br /><br />

	<table id="tbCourseList" width="90%" bordercolor="#777777" border="1" style="border-collapse:collapse">
		<tr class="TABLE_TH">
			<td align="center">编号</td>
			<td align="center">姓名</td>
			<td align="center">英文名</td>
			<td align="center">职称</td>
			<td align="center">备注</td>
			<td align="center">其他操作</td>
		</tr>

		<%
		int index = 0;
		while (resultset.next()) {
		%>
			<tr class="TABLE_TD_0<%=(++index % 2 + 1)%>">
				<td align="center"><%=resultset.getString("teacherno")%></td>
				<td align="center"><%=resultset.getString("name")%></td>
				<td align="center"><%=resultset.getString("ename")%></td>
				<td align="center"><%=resultset.getString("title")%></td>
				<td align="center"><%=resultset.getString("remark")%></td>
				<td align="center">
					<a href="dean/studentManage/teacherManage.jsp?method=modify&teacherno=<%=resultset.getString("teacherno")%>">修改</a>
					&nbsp;&nbsp;
					<a href="dean/studentManage/teacherManage.jsp?method=doDelete&teacherno=<%=resultset.getString("teacherno")%>" onClick="return confirm_delete()">删除</a>
				</td>
			</tr>
		<% } %>
	</table>
<%
} else if (method.equals("add")) {
%>
<form action="dean/studentManage/teacherManage.jsp" method="post">
	<input type="hidden" name="method" value="doAdd" />
	<table width="30%" align="center" bordercolor="#777777" border="1" style="border-collapse:collapse">
		<tr>
			<td width="30%" align="center"><label for="">编号</label></td>
			<td><input type="text" size="46" name="teacherno" id="" /></td>
		</tr>
		<tr>
			<td width="30%" align="center"><label for="">姓名</label></td>
			<td><input type="text" size="46" name="name" id="" /></td>
		</tr>
		<tr>
			<td width="30%" align="center"><label for="">英文名</label></td>
			<td><input type="text" size="46" name="ename" id="" /></td>
		</tr>
		<tr>
			<td width="30%" align="center"><label for="">性别</label></td>
			<td><input type="text" size="46" name="gender" id="" /></td>
		</tr>
		<tr>
			<td width="30%" align="center"><label for="">职称</label></td>
			<td><input type="text" size="46" name="title" id="" /></td>
		</tr>
		<tr>
			<td width="30%" align="center"><label for="">备注</label></td>
			<td><input type="text" size="46" name="remark" id="" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="确定" />
				&nbsp;&nbsp;
				<input type="button" value="取消" onClick="location.href='dean/studentManage/teacherManage.jsp'" />
			</td>
		</tr>
	</table>
</form>
<%
} else if (method.equals("doAdd")) {
	boolean doAddSuccess = total.teacherAdd(username, teacherno, name, ename, gender, title, remark);
	if (doAddSuccess)
		out.println("<script>alert(\"添加导师成功\")</script>");
	else
		out.println("<script>alert(\"添加导师失败\")</script>");
%>
	<script>location.href='dean/studentManage/teacherManage.jsp'</script>
<%
} else if (method.equals("modify")) {
	ResultSet rs = total.teacherManage(username);
	do {
		rs.next();
	} while (!rs.getString("teacherno").equals(teacherno));
%>
<form action="dean/studentManage/teacherManage.jsp" method="post">
	<input type="hidden" name="method" value="doModify" />
	<table width="30%" align="center" bordercolor="#777777" border="1" style="border-collapse:collapse">
		<tr>
			<td width="30%" align="center"><label for="">编号</label></td>
			<td><input type="text" size="46" name="teacherno" value="<%=teacherno%>" id="" /></td>
		</tr>
		<tr>
			<td width="30%" align="center"><label for="">姓名</label></td>
			<td><input type="text" size="46" name="name" value="<%=rs.getString("name")%>" readonly="readonly" id="" /></td>
		</tr>
		<tr>
			<td width="30%" align="center"><label for="">英文名</label></td>
			<td><input type="text" size="46" name="ename" value="<%=rs.getString("ename")%>" id="" /></td>
		</tr>
		<tr>
			<td width="30%" align="center"><label for="">职称</label></td>
			<td><input type="text" size="46" name="title" value="<%=rs.getString("title")%>" id="" /></td>
		</tr>
		<tr>
			<td width="30%" align="center"><label for="">备注</label></td>
			<td><input type="text" size="46" name="remark" value="<%=rs.getString("remark")%>" id="" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="确定" />
				&nbsp;&nbsp;
				<input type="button" value="取消" onClick="location.href='dean/studentManage/teacherManage.jsp'" />
			</td>
		</tr>
	</table>
</form>
<%
} else if (method.equals("doModify")) {
	boolean doModifySuccess = total.teacherAlter(teacherno, ename, title, remark);
	if (doModifySuccess)
		out.println("<script>alert(\"修改导师成功\")</script>");
	else
		out.println("<script>alert(\"修改导师失败\")</script>");
%>
	<script>location.href='dean/studentManage/teacherManage.jsp'</script>
<%
} else if (method.equals("doDelete")) {
	boolean doDeleteSuccess = total.teacherDelete(teacherno);
	if (doDeleteSuccess)
		out.println("<script>alert(\"删除导师成功\")</script>");
	else
		out.println("<script>alert(\"删除导师失败\")</script>");
%>
	<script>location.href='dean/studentManage/teacherManage.jsp'</script>
<%
}
%>
</div>

<div class="Line"></div>

</body>
</html>