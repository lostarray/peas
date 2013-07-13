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
String searchMethod = request.getParameter("searchMethod");
String inputContent = request.getParameter("inputContent");
if (searchMethod == null)
	searchMethod = "stuname";
%>

<div id="Function">
	<form action="dean/studentManage/searchStudent.jsp" method="post">
		<label for="">搜索方式: </label>
		<select style="vertical-align:middle;" name="searchMethod">
			<option value="stuname">姓名</option>
			<option value="stuno">学号</option>
		</select>
		<script>document.getElementsByName("searchMethod")[0].value="<%=searchMethod%>"</script>
		&nbsp;&nbsp;
		<input type="text" name="inputContent" id="" />
		&nbsp;&nbsp;
		<input type="submit" value="查找" />
		<br /><br />

		<table id="tbCourseList" width="90%" bordercolor="#777777" border="1" style="border-collapse:collapse">
			<tr class="TABLE_TH">
				<td align="center">学号</td>
				<td align="center">姓名</td>
				<td align="center">性别</td>
				<td align="center">专业</td>
				<td align="center">出生日期</td>
				<td align="center">入学时间</td>
				<td align="center">导师</td>
				<td align="center">培养性质</td>
				<td align="center">硕士/博士</td>
				<td align="center">学籍状态</td>
				<td align="center">详细信息</td>
			</tr>

			<%
			if (inputContent != null) {
				inputContent = new String(inputContent.getBytes("ISO-8859-1"), "UTF-8");
				ResultSet resultset;
				if (searchMethod.equals("stuname"))
					resultset = total.searchStudentname(inputContent, username);
				else
					resultset = total.searchStudentno(inputContent, username);

				int index = 0;
				while (resultset.next()) {
					out.println("<tr class=\"TABLE_TD_0" + (++index % 2 + 1) + "\">");
					out.println("<td align=\"center\">" + resultset.getString("stuno") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("stuname") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("gender") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("MajorInfo.speciality") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("birthdate") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("admissiontime") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("TeacherInfo.name") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("culturednature") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("master_doctor") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("schoolrollstate") + "</td>");
					out.println("<td align=\"center\">" + "<a href=\"dean/studentManage/studentDetail.jsp?stuno=" + resultset.getString("stuno") + "\">详细信息</a>" + "</td>");
					out.println("</tr>");
				}
			}
			%>
		</table>
	</form>
</div>

<div class="Line"></div>

</body>
</html>