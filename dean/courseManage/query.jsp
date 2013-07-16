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
	int currentYear = Integer.parseInt((String) application.getAttribute("currentYear"));
	String currentTerm = (String) application.getAttribute("currentTerm");
%>

<div id="Function">
	<form action="" method="post">
	<p>
	<label for="">课程类型	</label>
	<select style="vertical-align:middle;" name="coursetype">
		<option value="专业课">专业课</option>
		<option value="通识课">通识课</option>
		<option value="选修课">选修课</option>
	</select>
	</p>
	<p><input type="submit" value="查询" /></p>
	</form>
<%
	String coursetype = request.getParameter("coursetype");
	if(username != null && currentTerm != null && coursetype != null) {
%>
	<table class="TABLE_BODY" align="center" width="90%" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
	<tr align="center" class="TABLE_TH">
		<th align="center">序号</th>
		<th>课程名称</th>
		<th align="center" >课程编号</th>
		<th>班级编号</th>
		<th>校区</th>
		<th>年级</th>
		<th>时间</th>
		<th>地点</th>
		<th>教师</th>
		<th>起止周数</th>
		<th>学时</th>
		<th>安排人数</th>
		<th>操作</th>
	</tr>
<%
	int index = 0;
	coursetype = new String(coursetype.getBytes("ISO-8859-1"), "UTF-8");
	ResultSet result = total.courseSearch(username, (currentYear - 1) + "-" + currentYear, currentTerm, coursetype);
	while(result.next()) {
		out.println("<tr valign=\"baseline\"  class=\"TABLE_TR_0" + (++index % 2 + 1) + "\">");
		out.println("<td align=\"center\" vAlign=\"middle\">" + index + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("coursename") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("courseno") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("classno") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("schoolarea") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("grade") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("coursetime") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("classroom") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("TeacherInfo.name") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("startweek") + "-" + result.getString("endweek") + "周" + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("classhour") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("maxelec") + "</td>");
		out.println("<td vAlign=\"middle\"><a href=\"dean/courseManage/operation.jsp?operation=modify\" style=\"color:blue;\">修改</td>");
	}
%>
	</table>
<%
	}
%>
</div>