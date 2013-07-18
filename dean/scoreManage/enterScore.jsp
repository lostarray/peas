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
String schoolyear = request.getParameter("schoolyear");
String schoolterm = request.getParameter("schoolterm");
String coursetype = request.getParameter("coursetype");
String courseno = request.getParameter("courseno");
String classno = request.getParameter("classno");
String stuno = request.getParameter("stuno");
String method = request.getParameter("method");
if (coursetype == null) {
	schoolyear = "2012-2013";
	schoolterm = "2";
	coursetype = "专业课";
} else {
	coursetype = new String(coursetype.getBytes("ISO-8859-1"), "UTF-8");
}
%>

<div id="Function" style="font-size:13px">
<%
if (method == null) {
%>
	<form action="dean/scoreManage/enterScore.jsp" method="post" name="myform">
		<label for="">学年</label>
		<select name="schoolyear" onchange="document.myform.submit()">
			<option value="2012-2013">2012-2013</option>
			<option value="2011-2012">2011-2012</option>
			<option value="2010-2011">2010-2011</option>
		</select>
		&nbsp;&nbsp;
		<label for="">学期</label>
		<select name="schoolterm" onchange="document.myform.submit()">
			<option value="1">上学期</option>
			<option value="2">下学期</option>
		</select>
		&nbsp;&nbsp;
		<label for="">课程类型</label>
		<select name="coursetype" onchange="document.myform.submit()">
			<option value="专业课">专业课</option>
			<option value="通识课">通识课</option>
			<option value="公选课">公选课</option>
		</select>
		&nbsp;&nbsp;
		<label for="">课程</label>
		<select name="courseno" onchange="document.myform.submit()">
			<%
			ResultSet rsCourse = total.speciality_CourseInfo(username, schoolyear, schoolterm, coursetype);
			while (rsCourse.next()) {
				out.println("<option value=\"" + rsCourse.getString("courseno") + "\">" + rsCourse.getString("coursename") + "</option>");
			}
			%>
		</select>
		&nbsp;&nbsp;
		<label for="">班级</label>
		<select name="classno">
			<%
			ResultSet rsClass = total.getChosenCourseInfo(courseno, schoolyear, schoolterm);
			while (rsClass.next()) {
				out.println("<option value=\"" + rsClass.getString("classno") + "\">" + rsClass.getString("classno") + "</option>");
			}
			%>
		</select>
		&nbsp;&nbsp;
		<input type="submit" value="查看" />
		<br /><br />

		<script>
		document.getElementsByName("schoolyear")[0].value="<%=schoolyear%>";
		document.getElementsByName("schoolterm")[0].value="<%=schoolterm%>";
		document.getElementsByName("coursetype")[0].value="<%=coursetype%>";
		document.getElementsByName("courseno")[0].value="<%=courseno%>";
		document.getElementsByName("classno")[0].value="<%=classno%>";
		</script>
	</form>

	<%
	if (classno != null) {
	%>
		<a href="dean/scoreManage/enterScore.jsp?method=add&schoolyear=<%=schoolyear%>&schoolterm=<%=schoolterm%>&coursetype=<%=coursetype%>&courseno=<%=courseno%>&classno=<%=classno%>">录入成绩</a>
		<br /><br />

		<table width="80%" bordercolor="#777777" border="1" style="border-collapse:collapse">
			<tr class="TABLE_TH">
				<td align="center">序号</td>
				<td align="center">学号</td>
				<td align="center">姓名</td>
				<td align="center">成绩</td>
				<td align="center">其他</td>
			</tr>

			<%
			ResultSet rs = total.importGrade(username, schoolyear, schoolterm, courseno, Integer.parseInt(classno));
			int index = 0;
			while (rs.next()) {
			%>
				<tr class="TABLE_TD_0<%=(++index % 2 + 1)%>">
					<td align="center"><%=index%></td>
					<td align="center"><%=rs.getString("stuno")%></td>
					<td align="center"><%=rs.getString("stuname")%></td>
					<td align="center"><%=rs.getString("score")%></td>
					<td align="center">
						<a href="dean/scoreManage/enterScore.jsp?method=modify&stuno=<%=rs.getString("stuno")%>&schoolyear=<%=schoolyear%>&schoolterm=<%=schoolterm%>&coursetype=<%=coursetype%>&courseno=<%=courseno%>&classno=<%=classno%>">修改</a>
						&nbsp;&nbsp;
						<a href="dean/scoreManage/enterScore.jsp?method=doDelete&stuno=<%=rs.getString("stuno")%>&schoolyear=<%=schoolyear%>&schoolterm=<%=schoolterm%>&coursetype=<%=coursetype%>&courseno=<%=courseno%>&classno=<%=classno%>" onclick="return confirm_delete()">删除</a>
					</td>
				</tr>
			<%
			}
		}
		%>
	</table>
<%
} else if (method.equals("add")) {
%>
	<form action="dean/scoreManage/enterScore.jsp" method="post">
		<input type="hidden" name="method" value="doAdd" />
		<input type="hidden" name="schoolyear" value="<%=schoolyear%>" />
		<input type="hidden" name="schoolterm" value="<%=schoolterm%>" />
		<input type="hidden" name="coursetype" value="<%=coursetype%>" />
		<input type="hidden" name="courseno" value="<%=courseno%>" />
		<input type="hidden" name="classno" value="<%=classno%>" />
		<table width="30%" align="center" bordercolor="#777777" border="1" style="border-collapse:collapse">
			<tr>
				<td width="30%" align="center"><label for="">学号</label></td>
				<td><input type="text" size="46" name="stuno" /></td>
			</tr>
			<tr>
				<td width="30%" align="center"><label for="">姓名</label></td>
				<td><input type="text" size="46" name="stuname" /></td>
			</tr>
			<tr>
				<td width="30%" align="center"><label for="">成绩</label></td>
				<td><input type="text" size="46" name="score" /></td>
			</tr>
			<tr>
				<td width="30%" align="center"><label for="">备注</label></td>
				<td><input type="text" size="46" name="remark" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="确定" />
					&nbsp;&nbsp;
					<input type="button" value="取消" onClick="location.href='dean/scoreManage/enterScore.jsp?schoolyear=<%=schoolyear%>&schoolterm=<%=schoolterm%>&coursetype=<%=coursetype%>&courseno=<%=courseno%>&classno=<%=classno%>'" />
				</td>
			</tr>
		</table>
	</form>
<%
} else if (method.equals("doAdd")) {
	String stuname = request.getParameter("stuname");
	if (stuname != null)
		stuname = new String(stuname.getBytes("ISO-8859-1"), "UTF-8");
	String score = request.getParameter("score");
	String remark = request.getParameter("remark");
	if (remark != null)
		remark = new String(remark.getBytes("ISO-8859-1"), "UTF-8");

	boolean doAddSuccess = total.addGrade(schoolyear, schoolterm, courseno, Integer.parseInt(classno), stuno, stuname, Integer.parseInt(score), remark);
	if (doAddSuccess)
		out.println("<script>alert(\"添加成功\")</script>");
	else
		out.println("<script>alert(\"添加失败\")</script>");
%>
	<script>location.href='dean/scoreManage/enterScore.jsp?schoolyear=<%=schoolyear%>&schoolterm=<%=schoolterm%>&coursetype=<%=coursetype%>&courseno=<%=courseno%>&classno=<%=classno%>'</script>
<%
} else if (method.equals("modify")) {
	ResultSet rs = total.importGrade(username, schoolyear, schoolterm, courseno, Integer.parseInt(classno));
	do {
		rs.next();
	} while (!rs.getString("stuno").equals(stuno));
	String stuname = rs.getString("stuname");
	String score = rs.getString("score");
%>
	<form action="dean/scoreManage/enterScore.jsp" method="post">
		<input type="hidden" name="method" value="doModify" />
		<input type="hidden" name="schoolyear" value="<%=schoolyear%>" />
		<input type="hidden" name="schoolterm" value="<%=schoolterm%>" />
		<input type="hidden" name="coursetype" value="<%=coursetype%>" />
		<input type="hidden" name="courseno" value="<%=courseno%>" />
		<input type="hidden" name="classno" value="<%=classno%>" />
		<table width="30%" align="center" bordercolor="#777777" border="1" style="border-collapse:collapse">
			<tr>
				<td width="30%" align="center"><label for="">学号</label></td>
				<td><input type="text" size="46" name="stuno" value="<%=stuno%>" /></td>
			</tr>
			<tr>
				<td width="30%" align="center"><label for="">姓名</label></td>
				<td><input type="text" size="46" name="stuname" value="<%=stuname%>" /></td>
			</tr>
			<tr>
				<td width="30%" align="center"><label for="">成绩</label></td>
				<td><input type="text" size="46" name="score" value="<%=score%>" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="确定" />
					&nbsp;&nbsp;
					<input type="button" value="取消" onClick="location.href='dean/scoreManage/enterScore.jsp?schoolyear=<%=schoolyear%>&schoolterm=<%=schoolterm%>&coursetype=<%=coursetype%>&courseno=<%=courseno%>&classno=<%=classno%>'" />
				</td>
			</tr>
		</table>
	</form>
<%
} else if (method.equals("doModify")) {
	String score = request.getParameter("score");
	boolean doModifySuccess = total.alterGrade(schoolyear, schoolterm, courseno, Integer.parseInt(classno), stuno, Integer.parseInt(score));
	if (doModifySuccess)
		out.println("<script>alert(\"修改成功\")</script>");
	else
		out.println("<script>alert(\"修改失败\")</script>");
%>
	<script>location.href='dean/scoreManage/enterScore.jsp?schoolyear=<%=schoolyear%>&schoolterm=<%=schoolterm%>&coursetype=<%=coursetype%>&courseno=<%=courseno%>&classno=<%=classno%>'</script>
<%
} else if (method.equals("doDelete")) {
	boolean doDeleteSuccess = total.deleteGrade(schoolyear, schoolterm, courseno, Integer.parseInt(classno), stuno, 0);
	if (doDeleteSuccess)
		out.println("<script>alert(\"删除成功\")</script>");
	else
		out.println("<script>alert(\"删除失败\")</script>");
%>
	<script>location.href='dean/scoreManage/enterScore.jsp?schoolyear=<%=schoolyear%>&schoolterm=<%=schoolterm%>&coursetype=<%=coursetype%>&courseno=<%=courseno%>&classno=<%=classno%>'</script>
<%
}
%>
</div>

<script>
	function confirm_delete() {
		var r = confirm("确定要删除该学生的成绩吗?"); 
		return r;
	}
</script>

<div class="Line"></div>

</body>
</html>