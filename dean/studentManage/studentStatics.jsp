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
		<label for="">国籍	</label>
		<select style="vertical-align:middle;" name="nationality">
			<option value="中国大陆" selected="selected">中国大陆</option>
			<option value="中国台湾">中国台湾</option>
			<option value="美国">美国</option>
			<option value="英国">英国</option>
			<option value="新加坡">新加坡</option>
		</select>
		<label for="">培养性质	</label>
		<select style="vertical-align:middle;" name="culturednature">
			<option value="定向">定向</option>
			<option value="非定向" selected="selected">非定向</option>
		</select>
		<label for="">年级	</label>
		<select style="vertical-align:middle;" name="admissiontime">
		<%
			for(int i = 1990; i <= 2020; i++)
				if(i == 2010)
					out.println("<option value=\"" + i + "\" selected=\"selected\"\">" + i + "</option>");
				else
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
			<option value="1" selected="selected">1</option>
		</select>
		<label for="">攻读学位	</label>
		<select style="vertical-align:middle;" name="master_doctor">
			<option value="硕士">硕士</option>
			<option value="博士">博士</option>
		</select>
		<label for="">导师	</label>
		<select style="vertical-align:middle;" name="teacher">
		<%
			ResultSet teachers = total.findAllTeachers(username);
			while(teachers.next()) {
				String s1 = teachers.getString("teacherno");
				String s2 = teachers.getString("name");
				out.println("<option value=\"" + s1 + " " + s2 +"\">" + s1 + " " + s2 + "</option>");
			}
		%>
		</select>
		<p><input type="submit" value="查询" /></p>
	</form>
<%
	String nationality = request.getParameter("nationality");
	String culturednature = request.getParameter("culturednature");
	String admissiontime = request.getParameter("admissiontime");
	String gender = request.getParameter("gender");
	String schoolrollstate = request.getParameter("schoolrollstate");
	String master_doctor = request.getParameter("master_doctor");
	String combination = request.getParameter("teacher");
	if(nationality != null && culturednature != null && admissiontime != null && gender != null && schoolrollstate != null && master_doctor != null 
		&& combination != null && username != null) {
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
	nationality = new String(request.getParameter("nationality").getBytes("ISO-8859-1"), "UTF-8");
	culturednature = new String(request.getParameter("culturednature").getBytes("ISO-8859-1"), "UTF-8");
	admissiontime = new String(request.getParameter("admissiontime").getBytes("ISO-8859-1"), "UTF-8");
	gender = new String(request.getParameter("gender").getBytes("ISO-8859-1"), "UTF-8");
	schoolrollstate = new String(request.getParameter("schoolrollstate").getBytes("ISO-8859-1"), "UTF-8");
	master_doctor = new String(request.getParameter("master_doctor").getBytes("ISO-8859-1"), "UTF-8");
	combination = new String(request.getParameter("teacher").getBytes("ISO-8859-1"), "UTF-8");
	String teacherno = combination.split(" ")[0];
	int index = 0;
	out.println(nationality);
	out.println(culturednature);
	out.println(admissiontime);
	out.println(gender);
	out.println(schoolrollstate);
	out.println(master_doctor);
	out.println(teacherno);
	out.println(username);
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
		out.println("<td vAlign=\"middle\">" + result.getString("schoolrollstate") + "</td>");
		out.println("<td vAlign=\"middle\"><a href=\"dean/studentManage/staticInfo.jsp?studentNo=" + result.getString("stuno") + "\" style=\"color:blue;\">详细信息</td>");
	}
%>
	</table>
<%
	}
%>
</div>