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

<div id="Function">
	<body class="BODY"  leftmargin="50" rightmargin="50" onLoad="javascript:Init();">
	<div  align="center" style="width: 100%">
    <table width="100%"  height="100%" align="left" >
	<tr>
		<td height="15"></td>
	</tr>
    <tr>
	<%
		int currentYear = Integer.parseInt((String) application.getAttribute("currentYear"));
		int currentTerm = Integer.parseInt((String) application.getAttribute("currentTerm"));
		out.println("<td colspan=\"2\" align=\"center\" style=\"color:blue; \">" + (currentYear - 1) + "-" + currentYear + "学年第" + currentTerm +"学期</td>");
	%>
    </tr>
    <tr align="left">
		<td width="10" >&nbsp;</td>
        <td align="left" valign="top">
			<table width="95%"  class="TABLE_BODY" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
				<tr class="TABLE_TH">
					<th>课程编号</th>
					<th>课程名称</th>
					<th>校区</th>
					<th>教师</th>
					<th>上课时间及地点</th>
					<th>选课类型</th>
				</tr>
				<%
					int index = 0;
					String username = (String) session.getAttribute("username");
					ResultSet result = total.getMyCourseInfo(username, (currentYear-1) + "-" + currentYear, String.valueOf(currentTerm));
					while(result.next()) {
						out.println("<tr align=\"left\"  class=\"TABLE_TR_0" + (++index % 2 + 1) + "\">");
						out.println("<td valign=\"middle\">" + result.getString("CourseInfo.courseno") + "</td>");
						out.println("<td valign=\"middle\">" + result.getString("coursename") + "</td>");
						out.println("<td valign=\"middle\">" + result.getString("schoolarea") + "</td>");
						out.println("<td valign=\"middle\">" + result.getString("TeacherInfo.name") + "</td>");
						out.println("<td valign=\"middle\">" + result.getString("coursetime") + result.getString("startweek") + "-" + result.getString("endweek") + "周　　" +  result.getString("classroom") + "</td>");
						out.println("<td valign=\"middle\">" + result.getString("property") + "</td>");
						out.println("</tr>");
					}
				%>
			</table>
		</td>
    </tr>
    </table>
	</div>
	</body>
</div>

<div class="Line"></div>

</body>
</html>