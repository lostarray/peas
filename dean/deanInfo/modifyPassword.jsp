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

<%
String username = (String) session.getAttribute("username");
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");
String newPasswordConfirm = request.getParameter("newPasswordConfirm");
String method = request.getParameter("method");
if (method != null && method.equals("doModify")) {
	if (oldPassword.isEmpty() || newPassword.isEmpty() || newPasswordConfirm.isEmpty()) {
		out.println("<script>alert(\"请填写完整信息\")</script>");
	} else if (!newPassword.equals(newPasswordConfirm)) {
		out.println("<script>alert(\"新密码不一致\")</script>");
	} else {
		boolean result = total.passwordAlter(username, oldPassword, newPassword);
		if (result)
			out.println("<script>alert(\"修改成功\")</script>");
		else
			out.println("<script>alert(\"修改失败\")</script>");
	}
}
%>

<script>
	function clearInput() {
		document.getElementsByName("oldPassword")[0].value="";
		document.getElementsByName("newPassword")[0].value="";
		document.getElementsByName("newPasswordConfirm")[0].value="";
	}
</script>

<body>
<jsp:include page="../header.jsp" />

<div id="Function" style="font-size:13px">
	<form action="dean/deanInfo/modifyPassword.jsp" method="post">
		<input type="hidden" name="method" value="doModify" />
		<table width="25%" align="center" bordercolor="#777777" border="1" style="border-collapse:collapse">
			<tr>
				<td width="30%" align="center"><label for="">旧密码</label></td>
				<td><input type="password" size="40" name="oldPassword" /></td>
			</tr>
			<tr>
				<td width="30%" align="center"><label for="">新密码</label></td>
				<td><input type="password" size="40" name="newPassword" /></td>
			</tr>
			<tr>
				<td width="30%" align="center"><label for="">新密码确认</label></td>
				<td><input type="password" size="40" name="newPasswordConfirm" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="修改" />
					&nbsp;&nbsp;
					<input type="button" value="重置" onClick="clearInput()" />
				</td>
			</tr>
		</table>
	</form>
</div>

<div class="Line"></div>

</body>
</html>