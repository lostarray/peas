<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="peas.*" %>
<jsp:useBean id="total" class="peas.Total" scope="application" />
<% String username = (String) session.getAttribute("username"); %>

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
	<table width="70%" class="TABLE_BODY" style="margin-left: 100px">
		<tbody>
		<tr class="TABLE_TH">
			<th align="center">专业课</th>
			<th align="center">通识课</th>
			<th align="center">公选课</th>
			<th align="center">总　计</th>
		</tr>
		<tr class="TABLE_TR_02">
			<%
			int credit1 = total.creditStatistics(username, "专业课");
			int credit2 = total.creditStatistics(username, "通识课");
			int credit3 = total.creditStatistics(username, "公选课");
			%>
			<td align="center"><%=credit1%></td>
			<td align="center"><%=credit2%></td>
			<td align="center"><%=credit3%></td>
			<td align="center"><%=(credit1 + credit2 + credit3)%></td>
		</tr>					
		</tbody>
	</table>
</div>

<div class="Line"></div>

</body>
</html>