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
<%
	String username = (String) session.getAttribute("username");
	ResultSet resultset = total.getBasicInfo(username);
	resultset.next();
%>
	<table width="80%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
		<tr>
			<th colspan="6" class="TABLE_TH" >基本信息</th>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">学号</td>
			<td class="TABLE_TD_01"><%=resultset.getString("stuno")%></td>
			<td class="TABLE_TD_02">姓名</td>
			<td class="TABLE_TD_01"><%=resultset.getString("stuname")%></td>
			<td class="TABLE_TD_02">性别</td>
			<td class="TABLE_TD_01"><%=resultset.getString("gender")%></td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">出生日期</td>
			<td class="TABLE_TD_01">1991年09月27日</td>
			<td class="TABLE_TD_02">身份证号</td>
			<td colspan="3" class="TABLE_TD_01">320304199109270416</td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">所在专业</td>
			<td class="TABLE_TD_01"><%=resultset.getString("mname")%></td>
			<td class="TABLE_TD_02">导师</td>
			<td class="TABLE_TD_01"><%=resultset.getString("tname")%></td>
			<td class="TABLE_TD_02">培养性质</td>
			<td class="TABLE_TD_01"><%=resultset.getString("culturednature")%></td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">入学时间</td>
			<td class="TABLE_TD_01"><%=resultset.getString("admissiontime").substring(0, 10)%></td>
			<td class="TABLE_TD_02">所属年级</td>
			<td class="TABLE_TD_01">2010</td>
			<td class="TABLE_TD_02">学制</td>
			<td class="TABLE_TD_01">4.0</td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">学籍状态</td>
			<td class="TABLE_TD_01">有</td>
			<td class="TABLE_TD_02">班级编号</td>
			<td class="TABLE_TD_01"></td>
			<td class="TABLE_TD_02" >学科门类</td>
			<td class="TABLE_TD_01"></td>
		</tr>
	</table>
</div>

</body>
</html>