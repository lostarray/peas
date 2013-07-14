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
	String studentNo = request.getParameter("studentNo");
	ResultSet resultset = total.getBasicInfo(studentNo);
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
			<td class="TABLE_TD_02">所在专业</td>
			<td class="TABLE_TD_01"><%=resultset.getString("speciality")%></td>
			<td class="TABLE_TD_02">入学时间</td>
			<td class="TABLE_TD_01"><%=resultset.getString("admissiontime")%></td>
			<td class="TABLE_TD_02">导师</td>
			<td class="TABLE_TD_01"><%=resultset.getString("TeacherInfo.name")%></td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">硕士/博士</td>
			<td class="TABLE_TD_01"><%=resultset.getString("master_doctor")%></td>
			<td class="TABLE_TD_02">学籍状态</td>
			<td class="TABLE_TD_01"><%=resultset.getString("schoolrollstate")%></td>
			<td class="TABLE_TD_02">国籍</td>
			<td class="TABLE_TD_01"><%=resultset.getString("nationality")%></td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">身份证号</td>
			<td class="TABLE_TD_01" colspan="5"><%=resultset.getString("personid")%></td>
		</tr>
	</table>
</div>

</body>
</html>