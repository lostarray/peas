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

<%
	String operation = request.getParameter("operation");
	String deletecourseno = request.getParameter("courseno");
	String deleteclassno = request.getParameter("classno");
	if(operation != null && operation.equals("remove")) {
		boolean doDeleteSuccess = total.courseDelete((currentYear - 1) + "-" + currentYear, currentTerm, deletecourseno, deleteclassno);
		if(doDeleteSuccess)
			out.println("<script>alert(\"删除成功\")</script>");
		else
			out.println("<script>alert(\"删除失败\")</script>");
	}
%>

<div id="Function">
	<form action="dean/courseManage/query.jsp" method="post">
	<p>
	<label for="">课程类型	</label>
	<select style="vertical-align:middle;" name="coursetype">
		<option value="专业课">专业课</option>
		<option value="通识课">通识课</option>
		<option value="公选课">公选课</option>
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
	<script type="text/javascript"> 
	function show_confirm() 
	{ 
		var r=confirm("确定要删除该课程吗？!"); 
		return r;
	} 
	</script> 
<%
	int index = 0;
	coursetype = new String(coursetype.getBytes("ISO-8859-1"), "UTF-8");
	ResultSet result = total.courseSearch(username, (currentYear - 1) + "-" + currentYear, currentTerm, coursetype);
	while(result.next()) {
		String courseno = result.getString("courseno");
		String classno = result.getString("classno");
		out.println("<tr valign=\"baseline\"  class=\"TABLE_TR_0" + (++index % 2 + 1) + "\">");
		out.println("<td align=\"center\" vAlign=\"middle\">" + index + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("coursename") + "</td>");
		out.println("<td vAlign=\"middle\">" + courseno + "</td>");
		out.println("<td vAlign=\"middle\">" + classno + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("schoolarea") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("grade") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("coursetime") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("classroom") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("TeacherInfo.name") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("startweek") + "-" + result.getString("endweek") + "周" + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("classhour") + "</td>");
		out.println("<td vAlign=\"middle\">" + result.getString("maxelec") + "</td>");
		out.println("<td vAlign=\"middle\"><a href=\"dean/courseManage/operation.jsp?operation=modify&courseno=" + courseno + "&classno=" + classno + "\" style=\"color:blue;\">修改");
		out.println("&nbsp;&nbsp;<a href=\"dean/courseManage/query.jsp?operation=remove&courseno=" + courseno + "&classno=" + classno + "\" onclick=\"return show_confirm()\" style=\"color:blue;\">删除</td>");
	}
%>
	</table>
<%
	}
%>
</div>