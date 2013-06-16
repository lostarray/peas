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
int currentTerm = Integer.parseInt((String) application.getAttribute("currentTerm"));
String s = null, t = null;
s = request.getParameter("courseNo");
t = request.getParameter("classNo");
if(s != null && t != null) {
	total.withdrawCourse(username, s, (currentYear-1) + "-" + currentYear, (String) application.getAttribute("currentTerm"), Integer.parseInt(t));
}
%>

<div id="Function">
	<body class="BODY" onLoad="javascript:Init();">
    <div style="padding-top:20px;padding-left:20px;width: 90%;">
	<table class="TABLE_BODY" align="center" width="90%" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
	<tr align="center" class="TABLE_TH">
		<td align="center">序号</td>
		<td>课程编号</td>
		<td align="center" >课程名称</td>
		<td>教师</td>
		<td>校区</td>
		<th>选课类型</th>
		<td>操作</td>
	</tr>
	<script type="text/javascript"> 
	function show_confirm() 
	{ 
		var r=confirm("确定要退选该课程吗？!"); 
		return r;
	} 
	</script>
	<%
		int index = 0;
		ResultSet result = total.getMyCourseInfo(username, (currentYear-1) + "-" + currentYear, String.valueOf(currentTerm));

		while(result.next()) {
			out.println("<tr valign=\"baseline\"  class=\"TABLE_TR_0" + (++index % 2 + 1) + "\">");
			out.println("<td align=\"center\" vAlign=\"middle\">" + index + "</td>");
			String course = result.getString("CourseInfo.courseno");
			String classno = result.getString("CourseInfo.classno");
			out.println("<td vAlign=\"middle\">" + course + "</td>");
			out.println("<td vAlign=\"middle\">" + result.getString("coursename") + "</td>");
			out.println("<td vAlign=\"middle\">" + result.getString("TeacherInfo.name") + "</td>");
			out.println("<td vAlign=\"middle\">" + result.getString("schoolarea") + "</td>");
			String pt = result.getString("property");
			out.println("<td>" + pt + "</td>");
			if(pt != null && pt.equals("选修"))
				out.println("<td vAlign=\"middle\"><a href=\"student/electivePlan/quitCourse.jsp?courseNo=" + course + "&classNo=" + classno + "\" onclick=\"return show_confirm()\" style=\"color:blue;\">退选</td>");
			else
				out.println("<td vAlign=\"middle\"></td>");
		}
	%>
	</table>	
  	</div>
	</body>
</div>

<div class="Line"></div>

</body>
</html>