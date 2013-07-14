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
%>

<div id="Function">
	<form action="" method="post">
		<p>国籍	<input type="text" name="nationality" /></p>
		<label for="">培养性质	</label>
		<select style="vertical-align:middle;" name="culturednature">
			<option value="定向">定向</option>
			<option value="非定向">非定向</option>
		</select>
		<label for="">年级	</label>
		<select style="vertical-align:middle;" name="admissiontime">
		<%
			for(int i = 1990; i <= 2020; i++)
				out.println("<option value=\"" + i + "\">" + i + "</option>");
		%>
		</select>
		<label for="">性别	</label>
		<select style="vertical-align:middle;" name="gender">
			<option value="男">男</option>
			<option value="女">女</option>
		</select>
		<label for="">学籍状态	</label>
		<select style="vertical-align:middle;" name="schoolrollstate">
			<option value="0">0</option>
			<option value="1">1</option>
		</select>
		<label for="">攻读学位	</label>
		<select style="vertical-align:middle;" name="master_doctor">
			<option value="master">master</option>
			<option value="doctor">doctor</option>
		</select>
		<label for="">导师	</label>
		<select style="vertical-align:middle;" name="teacherno">
		<%
			ResultSet result = total.findAllTeachers(username);
			while(result.next()) {
				String s = result.getString("name");
				out.println("<option value=\"" + s + "\">" + s + "</option>");
			}
		%>
		</select>
		<p><input type="submit" value="查询" /></p>
	</form>
</div>

<%
	String nationality = request.getParameter("nationality");
	String culturednature = request.getParameter("culturednature");
	String admissiontime = request.getParameter("admissiontime");
	String gender = request.getParameter("gender");
	String schoolrollstate = request.getParameter("schoolrollstate");
	String master_doctor = request.getParameter("master_doctor");
	String teacherno = request.getParameter("teacherno");
	if(nationality != null && culturednature != null && admissiontime != null && gender != null && schoolrollstate != null && master_doctor != null && username != null) {
%>
	<table class="TABLE_BODY" align="center" width="90%" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
	<tr align="center" class="TABLE_TH">
		<th align="center">序号</th>
		<th>学生姓名</th>
		<th align="center" >学号</th>
		<th>性别</th>
		<th>培养性质</th>
		<th>出生日期</th>
		<th>专业</th>
		<th>导师</th>
		<th>学籍状态</th>
		<th>详细信息</th>
	</tr>
<%
	int index = 0;
	ResultSet result = total.filterStudent(nationality , culturednature, admissiontime, gender, Integer.parseInt(schoolrollstate), master_doctor, teacherno, username);
	while(result.next()) {
		out.println("<tr valign=\"baseline\"  class=\"TABLE_TR_0" + (++index % 2 + 1) + "\">");
		out.println("<td align=\"center\" vAlign=\"middle\">" + index + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("stuname") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("stuno") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("StudentInfo.gender") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("culturednature") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("birthdate") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("speciality") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("TeacherInfo.name") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("schoolrollstate ") + "</td>");
		out.println("<td vAlign=\"middle\"><a href=\"dean/studentManage/staticInfo.jsp?studentNo=" + result.getString("stuno") + "\" style=\"color:blue;\">详细信息</td>");
	}
%>
	</table>
<%
	}
%>