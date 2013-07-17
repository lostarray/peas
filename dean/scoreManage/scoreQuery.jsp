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
String method = request.getParameter("method");
String stuno = request.getParameter("stuno");
String schoolyear = request.getParameter("schoolyear");
String schoolterm = request.getParameter("schoolterm");
String coursetype = request.getParameter("coursetype");
String courseno = request.getParameter("courseno");
String teacherno = request.getParameter("teacherno");
if (method == null) {
	method = "searchStuno";
} else if (method.equals("searchCourse")) {
	if (coursetype == null) {
		schoolyear = "2012-2013";
		schoolterm = "2";
		coursetype = "专业课";
	} else {
		coursetype = new String(coursetype.getBytes("ISO-8859-1"), "UTF-8");
	}
}
%>

<div id="Function" style="font-size:13px">
<form action="dean/scoreManage/scoreQuery.jsp" method="post" name="myform">
	<label for="">查找方式</label>
	<select name="method" onchange="document.myform.submit()">
		<option value="searchStuno">学号</option>
		<option value="searchCourse">课程</option>
	</select>
	<script>document.getElementsByName("method")[0].value="<%=method%>"</script>
	&nbsp;&nbsp;
<%
if (method.equals("searchStuno")) {
%>
	<input type="text" name="stuno" size="25" />
<%	
} else if (method.equals("searchCourse")) {
%>
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
	<label for="">任课教师</label>
	<select name="teacherno">
		<%
		ResultSet rsTeacher = total.getChosenCourseInfo(courseno, schoolyear, schoolterm);
		while (rsTeacher.next()) {
			out.println("<option value=\"" + rsTeacher.getString("teacherno") + "\">" + rsTeacher.getString("TeacherInfo.name") + "</option>");
		}
		%>
	</select>
	&nbsp;&nbsp;
	<script>
		document.getElementsByName("schoolyear")[0].value="<%=schoolyear%>";
		document.getElementsByName("schoolterm")[0].value="<%=schoolterm%>";
		document.getElementsByName("coursetype")[0].value="<%=coursetype%>";
		document.getElementsByName("courseno")[0].value="<%=courseno%>";
		document.getElementsByName("teacherno")[0].value="<%=teacherno%>";
	</script>
<%	
}
%>
	<input type="submit" value="查看" />
</form>
<br />

<%
if (method.equals("searchStuno") && stuno != null) {
%>
	<table width="95%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-collapse:collapse">
		<tr class="TABLE_TH">
			<th align="center">序号</th>
			<th align="center">课程编号</th>
			<th align="center">课程名称</th>
			<th align="center">英文名称</th>
			<th align="center">课程类型</th>
			<th align="center">学分</th>
			<th align="center">成绩</th>
		</tr>

		<%
		int index = 0;
		ResultSet rs = total.gradeInfo_stu(stuno);
		while (rs.next()) {
			out.println("<tr class=\"TABLE_TD_0" + (++index % 2 + 1) + "\">");
			out.println("<td align=\"center\">" + index + "</td>");
			out.println("<td align=\"center\">" + rs.getString("courseno") + "</td>");
			out.println("<td align=\"center\">" + rs.getString("coursename") + "</td>");
			out.println("<td align=\"center\">" + rs.getString("ename") + "</td>");
			out.println("<td align=\"center\">" + rs.getString("coursetype") + "</td>");
			out.println("<td align=\"center\">" + rs.getInt("credit") + "</td>");
			out.println("<td align=\"center\">" + rs.getInt("score") + "</td>");
			out.println("</tr>");
		}
		%>
	</table>
<%	
} else if (method.equals("searchCourse") && teacherno != null) {
%>
	<table width="85%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-collapse:collapse">
		<tr class="TABLE_TH">
			<td align="center">序号</td>
			<td align="center">学号</td>
			<td align="center">姓名</td>
			<td align="center">成绩</td>
		</tr>
	<%
	ResultSet rs = total.gradeInfo_course(courseno, schoolyear, schoolterm, teacherno);
	int index = 0;
	while (rs.next()) {
	%>
		<tr class="TABLE_TD_0<%=(++index % 2 + 1)%>">
			<td align="center"><%=index%></td>
			<td align="center"><%=rs.getString("stuno")%></td>
			<td align="center"><%=rs.getString("stuname")%></td>
			<td align="center"><%=rs.getString("score")%></td>
		</tr>
	<%
	}
	%>
	</table>
<%
}
%>
</div>

<div class="Line"></div>

</body>
</html>