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
String stuno = request.getParameter("stuno");
String info = request.getParameter("info");
if (info == null)
	info = "basic";
%>

<div id="Function">
<%
if (info.equals("basic")) {
	ResultSet resultset = total.getBasicInfo(stuno);
	resultset.next();
%>
	<table width="80%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
		<tr>
			<th colspan="6" class="TABLE_TH" >
				基本信息
				<a href="dean/studentManage/studentDetail.jsp?stuno=<%=stuno%>&info=natural">自然信息</a>
				<a href="dean/studentManage/studentDetail.jsp?stuno=<%=stuno%>&info=graduate">毕业信息</a>
			</th>
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
<%
} else if (info.equals("natural")) {
	ResultSet resultset = total.getNaturalInfo(stuno);
	resultset.next();
%>
	<table width="80%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
		<tr>
			<th colspan="6" class="TABLE_TH" >
				<a href="dean/studentManage/studentDetail.jsp?stuno=<%=stuno%>&info=basic">基本信息</a>
				自然信息
				<a href="dean/studentManage/studentDetail.jsp?stuno=<%=stuno%>&info=graduate">毕业信息</a>
			</th>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">拼音姓名</td>
			<td class="TABLE_TD_01">
				<input type="text" name="pinyin" size="30" readonly="readonly" value="<% out.println(resultset.getString("pinyin") == null ? "" : resultset.getString("pinyin")); %>" />
			</td>
			<td class="TABLE_TD_02">家庭住址</td>
			<td class="TABLE_TD_01">
				<input type="text" name="familyaddr" size="30" value="<% out.println(resultset.getString("familyaddr") == null ? "" : resultset.getString("familyaddr")); %>" />
			</td>
			<td class="TABLE_TD_02">家庭所在地车站名</td>
			<td class="TABLE_TD_01">
				<input type="text" name="stationname" size="30" value="<% out.println(resultset.getString("stationname") == null ? "" : resultset.getString("stationname")); %>" />
			</td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">家庭电话</td>
			<td class="TABLE_TD_01">
				<input type="text" name="homephone" size="30" value="<% out.println(resultset.getString("homephone") == null ? "" : resultset.getString("homephone")); %>" />
			</td>
			<td class="TABLE_TD_02">手机号码</td>
			<td class="TABLE_TD_01">
				<input type="text" name="phonenum" size="30" value="<% out.println(resultset.getString("phonenum") == null ? "" : resultset.getString("phonenum")); %>" />
			</td>
			<td class="TABLE_TD_02">电子邮箱</td>
			<td class="TABLE_TD_01">
				<input type="text" name="email" size="30" value="<% out.println(resultset.getString("email") == null ? "" : resultset.getString("email")); %>" />
			</td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">邮编</td>
			<td class="TABLE_TD_01" colspan="5">
				<input type="text" name="zip" size="30" value="<% out.println(resultset.getString("zip") == null ? "" : resultset.getString("zip")); %>" />
			</td>
		</tr>
	</table>
<%
} else if (info.equals("graduate")) {
	ResultSet resultset = total.getGraduateInfo(stuno);
	resultset.next();
%>
	<table width="80%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
		<tr>
			<th colspan="6" class="TABLE_TH" >
				<a href="dean/studentManage/studentDetail.jsp?stuno=<%=stuno%>&info=basic">基本信息</a>
				<a href="dean/studentManage/studentDetail.jsp?stuno=<%=stuno%>&info=natural">自然信息</a>
				毕业信息
			</th>
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
			<td class="TABLE_TD_02">导师</td>
			<td class="TABLE_TD_01"><%=resultset.getString("TeacherInfo.name")%></td>
			<td class="TABLE_TD_02">毕业时间</td>
			<td class="TABLE_TD_01"><%=resultset.getString("graduatedate")%></td>
			<td class="TABLE_TD_02">证书编号</td>
			<td class="TABLE_TD_01"><%=resultset.getString("certificate_no")%></td>
		</tr>
	</table>
<%
}
%>
</div>

<div class="Line"></div>

</body>
</html>