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
	<table width="100%"  height="100%" align="left" >
		<tr align="left"></tr>
        <td width="150"  align="right" valign="top">
			<div>
				<table  width="100%" height="100%" border="0"  bordercolor="#3366CC">
					<tr class="TEXT_TITLE">
						<td>请选择学期</td>
					</tr>
					<tr height="5"><td> </td></tr>
					<%
					int currentYear = 2013, currentTerm = 1;
					int year = 2010;
					for (int i = currentYear; i > year; i--) {
						if (i == currentYear) {
							if (currentTerm == 2)
								out.println("<tr align=\"center\" height=\"22\"><td><a href=\"student/scoreQuery/test.jsp\"/>" + (i-1) + "-" + i + "学年" + "第二学期</a></td></tr>");
							out.println("<tr align=\"center\" height=\"22\"><td><a href=\"student/scoreQuery/test.jsp\"/>" + (i-1) + "-" + i + "学年" + "第一学期</a></td></tr>");
						} else {
							out.println("<tr align=\"center\" height=\"22\"><td><a href=\"student/scoreQuery/test.jsp\"/>" + (i-1) + "-" + i + "学年" + "第二学期</a></td></tr>");
							out.println("<tr align=\"center\" height=\"22\"><td><a href=\"student/scoreQuery/test.jsp\"/>" + (i-1) + "-" + i + "学年" + "第一学期</a></td></tr>");
						}
					}
					%>
				</table>
			</div>
		</td>

		<td width="10" >&nbsp;</td>

        <td align="left" valign="top">
	        <div align=center style="margin-bottom: 5px">
				<a style="font-size:14px; text-align:center; font-weight:bold;"></a>
			</div>
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
			</table>
		</td>
	</table>
</div>

<div class="Line"></div>

</body>
</html>