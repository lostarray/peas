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
	ResultSet resultset = total.getNaturalInfo(username);
	resultset.next();
%>
<form action="student/personalInfo/naturalInfo.jsp" method="post">
	<table width="80%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
		<tr>
			<th colspan="6" class="TABLE_TH" >自然信息</th>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">拼音姓名</td>
			<td class="TABLE_TD_01"><%=resultset.getString("pinyin")%></td>
			<td class="TABLE_TD_02">家庭住址</td>
			<td class="TABLE_TD_01"><%=resultset.getString("familyaddr")%></td>
			<td class="TABLE_TD_02">家庭所在地车站名</td>
			<td class="TABLE_TD_01"><%=resultset.getString("stationname")%></td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">家庭电话</td>
			<td class="TABLE_TD_01"><%=resultset.getString("homephone")%></td>
			<td class="TABLE_TD_02">手机号码</td>
			<td class="TABLE_TD_01"><%=resultset.getString("phonenum")%></td>
			<td class="TABLE_TD_02">电子邮箱</td>
			<td class="TABLE_TD_01"><%=resultset.getString("email")%></td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">邮编</td>
			<td class="TABLE_TD_01" colspan="5"><%=resultset.getString("zip")%></td>
		</tr>
		<tr>
			<td class="TABLE_TD_01" colspan="6">
				<center><input type="submit" value="修改" name="save" /></center>
			</td>
		</tr>
	</table>
</form>
</div>

<div class="Line"></div>

</body>
</html>