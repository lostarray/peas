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
		<p>
		<label for="">国籍	</label>
		<select style="vertical-align:middle;" name="nationality">
			<option value="中国大陆" selected="selected">中国大陆</option>
			<option value="中国台湾">中国台湾</option>
			<option value="美国">美国</option>
			<option value="英国">英国</option>
			<option value="新加坡">新加坡</option>
		</select>
		</p>
		<p>
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
		</p>
		<label for="">攻读学位	</label>
		<select style="vertical-align:middle;" name="master_doctor">
			<option value="硕士">硕士</option>
			<option value="博士">博士</option>
		</select>
		<p><input type="submit" value="查询" /></p>
	</form>
<%
	String nationality = request.getParameter("nationality");
	String admissiontime = request.getParameter("admissiontime");
	String master_doctor = request.getParameter("master_doctor");
	if(nationality != null && admissiontime != null && master_doctor != null && username != null) {
%>
	<table class="TABLE_BODY" align="center" width="90%" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
	<tr align="center" class="TABLE_TH">
		<th align="center">序号</th>
		<th>学生姓名</th>
		<th align="center" >学号</th>
		<th>性别</th>
		<th>入学年份</th>
		<th>培养性质</th>
		<th>出生日期</th>
		<th>专业</th>
		<th>导师</th>
		<th>学籍状态</th>
		<th>详细信息</th>
	</tr>
<%
	int index = 0;
	admissiontime = new String(request.getParameter("admissiontime").getBytes("ISO-8859-1"), "UTF-8");
	master_doctor = new String(request.getParameter("master_doctor").getBytes("ISO-8859-1"), "UTF-8");
	nationality = new String(request.getParameter("nationality").getBytes("ISO-8859-1"), "UTF-8");
	ResultSet result = total.beyondtimeManage(admissiontime, master_doctor, nationality, username);
	while(result.next()) {
		out.println("<tr valign=\"baseline\"  class=\"TABLE_TR_0" + (++index % 2 + 1) + "\">");
		out.println("<td align=\"center\" vAlign=\"middle\">" + index + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("stuname") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("stuno") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("TeacherInfo.gender") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("admissiontime") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("culturednature") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("birthdate") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("speciality") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("name") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("schoolrollstate") + "</td>");
		out.println("<td vAlign=\"middle\"><a href=\"dean/studentManage/staticInfo.jsp?studentNo=" + result.getString("stuno") + "\" style=\"color:blue;\">详细信息</td>");
	}
%>
	</table>
<%
	}
%>
</div>