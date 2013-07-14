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

<%
String username = (String) session.getAttribute("username");
request.setCharacterEncoding("utf-8");
String method = request.getParameter("method");
String admissionYear = request.getParameter("admissionYear");
String degree = request.getParameter("degree");
if (degree == null)
	degree = "硕士";
else
	degree = new String(degree.getBytes("ISO-8859-1"), "UTF-8");
%>

<div id="Function" style="font-size:13px">
<%
if (method == null) {
%>
	<form action="dean/studentManage/teacherAndStudent.jsp" method="get">
		<label for="">入学年份</label>
		<input type="text" name="admissionYear" value="<%=(admissionYear == null ? "" : admissionYear)%>" id="" />
		&nbsp;&nbsp;
		<label for="">学位</label>
		<select style="vertical-align:middle;" name="degree">
			<option value="硕士">硕士</option>
			<option value="博士">博士</option>
		</select>
		<script>document.getElementsByName("degree")[0].value="<%=degree%>"</script>
		&nbsp;&nbsp;
		<input type="submit" value="查询" />
	</form>
	<br />

	<table width="80%" bordercolor="#777777" border="1" style="border-collapse:collapse">
		<tr class="TABLE_TH">
			<td align="center">序号</td>
			<td align="center">学生姓名</td>
			<td align="center">学号</td>
			<td align="center">导师</td>
			<td align="center">导师备注</td>
			<td align="center">修改</td>
		</tr>

	<%
	if (admissionYear != null) {
		ResultSet rs = total.teacherAndstudent(username, admissionYear, degree);
		int index = 0;
		while (rs.next()) {
	%>
			<tr class="TABLE_TD_0<%=(++index % 2 + 1)%>">
				<td align="center"><%=index%></td>
				<td align="center"><%=rs.getString("stuname")%></td>
				<td align="center"><%=rs.getString("stuno")%></td>
				<td align="center"><%=rs.getString("TeacherInfo.name")%></td>
				<td align="center"><%=rs.getString("TeacherInfo.remark")%></td>
				<td align="center">
					<a href="dean/studentManage/teacherAndStudent.jsp?method=modify&stuno=<%=rs.getString("stuno")%>">修改</a>
				</td>
			</tr>
	<%
		}
	}
	%>
	</table>
<%
} else if (method.equals("modify")) {
	String stuno = request.getParameter("stuno");
	ResultSet rs1 = total.getBasicInfo(stuno);
	rs1.first();
%>
	<form action="dean/studentManage/teacherAndStudent.jsp" method="post">
		<input type="hidden" name="method" value="doModify" />
		<table width="30%" align="center" bordercolor="#777777" border="1" style="border-collapse:collapse">
			<tr>
				<td width="30%" align="center"><label for="">学生学号</label></td>
				<td><input type="text" size="46" name="stuno" value="<%=stuno%>" readonly="readonly" id="" /></td>
			</tr>
			<tr>
				<td width="30%" align="center"><label for="">学生姓名</label></td>
				<td><input type="text" size="46" name="stuname" value="<%=rs1.getString("stuname")%>" readonly="readonly" id="" /></td>
			</tr>
			<tr>
				<td width="30%" align="center"><label for="">导师</label></td>
				<td>
					<select style="vertical-align:middle;" name="teacherno">
						<%
						ResultSet rs2 = total.findAllTeachers(username);
						while (rs2.next()) {
							out.println("<option value=\"" + rs2.getString("teacherno") + "\">" + rs2.getString("name") + "</option>");
						}
						%>
					</select>
					<script>document.getElementsByName("teacherno")[0].value="<%=rs1.getString("TeacherInfo.teacherno")%>"</script>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="确定" />
					&nbsp;&nbsp;
					<input type="button" value="取消" onClick="location.href='dean/studentManage/teacherAndStudent.jsp?admissionYear=<%=rs1.getString("admissiontime")%>&degree=<%=rs1.getString("master_doctor")%>'" />
				</td>
			</tr>
		</table>
	</form>
<%
} else if (method.equals("doModify")) {
	String stuno = request.getParameter("stuno");
	String teacherno = request.getParameter("teacherno");
	ResultSet rs1 = total.getBasicInfo(stuno);
	rs1.first();
	boolean doModifySuccess = total.optionalteacher(stuno, teacherno);
	if (doModifySuccess)
		out.println("<script>alert(\"关联导师成功\")</script>");
	else
		out.println("<script>alert(\"关联导师失败\")</script>");
%>
	<script>location.href='dean/studentManage/teacherAndStudent.jsp?admissionYear=<%=rs1.getString("admissiontime")%>&degree=<%=rs1.getString("master_doctor")%>'</script>
<%
}
%>
</div>

<div class="Line"></div>

</body>
</html>