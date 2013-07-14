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
// request.setCharacterEncoding("utf-8");
String method = request.getParameter("method");
String admissionTime = request.getParameter("admissionTime");
String degree = request.getParameter("degree");
String schoolrollstate = request.getParameter("schoolrollstate");
String stuno = request.getParameter("stuno");
if (admissionTime == null) {
	admissionTime = "2010";
	degree = "硕士";
	schoolrollstate = "1";
} else {
	degree = new String(degree.getBytes("ISO-8859-1"), "UTF-8");
}
%>

<div id="Function" style="font-size:13px">
<%
if (method == null) {
%>
	<form action="dean/studentManage/graduateManage.jsp" method="post">
		<label for="">学号</label>
		&nbsp;&nbsp;
		<input type="text" size="21" name="stuno" value="<%=(stuno == null ? "" : stuno)%>" />
		&nbsp;&nbsp;
		<input type="submit" value="查找" />
		<input type="hidden" name="doSearch" value="stuno" />
	</form>

	<form action="dean/studentManage/graduateManage.jsp" method="post">
		<label for="">入学时间</label>
		<select style="vertical-align:middle;" name="admissionTime">
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
		</select>
		&nbsp;&nbsp;
		<label for="">攻读学位</label>
		<select style="vertical-align:middle;" name="degree">
			<option value="硕士">硕士</option>
			<option value="博士">博士</option>
		</select>
		&nbsp;&nbsp;
		<label for="">学籍状态</label>
		<select style="vertical-align:middle;" name="schoolrollstate">
			<option value="0">离校</option>
			<option value="1">在校</option>
		</select>
		&nbsp;&nbsp;
		<input type="submit" name="doSearch" value="查找" />
		<script>
			document.getElementsByName("admissionTime")[0].value="<%=admissionTime%>";
			document.getElementsByName("degree")[0].value="<%=degree%>";
			document.getElementsByName("schoolrollstate")[0].value="<%=schoolrollstate%>";
		</script>
	</form>
	<br />

	<table width="90%" bordercolor="#777777" border="1" style="border-collapse:collapse">
		<tr class="TABLE_TH">
			<td align="center">序号</td>
			<td align="center">学号</td>
			<td align="center">姓名</td>
			<td align="center">性别</td>
			<td align="center">入学年份</td>
			<td align="center">培养性质</td>
			<td align="center">出生日期</td>
			<td align="center">专业</td>
			<td align="center">导师</td>
			<td align="center">学籍状态</td>
			<td align="center">毕业证书编号</td>
			<td align="center">毕业时间</td>
			<td align="center">其他</td>
		</tr>

	<%
	String doSearch = request.getParameter("doSearch");
	if (doSearch != null) {
		if (doSearch.equals("stuno")) {
			ResultSet rs1 = total.getBasicInfo(stuno);
			if (rs1.first()) {
				admissionTime = rs1.getString("admissiontime");
				degree = rs1.getString("master_doctor");
				schoolrollstate = rs1.getString("schoolrollstate");
			} else {
				return;
			}
			ResultSet rs = total.graduateMange(username, admissionTime, degree, Integer.parseInt(schoolrollstate));
			while (rs.next()) {
				if (rs.getString("stuno").equals(stuno)) {
				%>
					<tr class="TABLE_TD_02">
						<td align="center">1</td>
						<td align="center"><%=rs.getString("stuno")%></td>
						<td align="center"><%=rs.getString("stuname")%></td>
						<td align="center"><%=rs.getString("StudentInfo.gender")%></td>
						<td align="center"><%=rs.getString("admissiontime")%></td>
						<td align="center"><%=rs.getString("culturednature")%></td>
						<td align="center"><%=rs.getString("birthdate")%></td>
						<td align="center"><%=rs.getString("MajorInfo.speciality")%></td>
						<td align="center"><%=rs.getString("TeacherInfo.name")%></td>
						<td align="center"><%=rs.getString("schoolrollstate")%></td>
						<td align="center"><%=rs.getString("certificate_no")%></td>
						<td align="center"><%=rs.getString("graduatedate")%></td>
						<td align="center">
							<a href="dean/studentManage/graduateManage.jsp?method=modify&stuno=<%=rs.getString("stuno")%>">修改</a>
						</td>
					</tr>
				<%
				}
			}
			
		}
		else {
			ResultSet rs = total.graduateMange(username, admissionTime, degree, Integer.parseInt(schoolrollstate));
			int index = 0;
			while (rs.next()) {
			%>
				<tr class="TABLE_TD_0<%=(++index % 2 + 1)%>">
					<td align="center"><%=index%></td>
					<td align="center"><%=rs.getString("stuno")%></td>
					<td align="center"><%=rs.getString("stuname")%></td>
					<td align="center"><%=rs.getString("StudentInfo.gender")%></td>
					<td align="center"><%=rs.getString("admissiontime")%></td>
					<td align="center"><%=rs.getString("culturednature")%></td>
					<td align="center"><%=rs.getString("birthdate")%></td>
					<td align="center"><%=rs.getString("MajorInfo.speciality")%></td>
					<td align="center"><%=rs.getString("TeacherInfo.name")%></td>
					<td align="center"><%=rs.getString("schoolrollstate")%></td>
					<td align="center"><%=rs.getString("certificate_no")%></td>
					<td align="center"><%=rs.getString("graduatedate")%></td>
					<td align="center">
						<a href="dean/studentManage/graduateManage.jsp?method=modify&stuno=<%=rs.getString("stuno")%>">修改</a>
					</td>
				</tr>
			<%
			}
		}
	}
	%>
	</table>
<%
} else if (method.equals("modify")) {
	ResultSet rs = total.graduateStu(username, stuno);
	ResultSet rs1 = total.getBasicInfo(stuno);
	rs.first();
	rs1.first();
%>
	<form action="dean/studentManage/graduateManage.jsp" method="post">
	<table width="80%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
		<tr>
			<th colspan="6" class="TABLE_TH" >毕业信息</th>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">学号</td>
			<td class="TABLE_TD_01"><input type="text" readonly="readonly" name="stuno" value="<%=rs.getString("stuno")%>" /></td>
			<td class="TABLE_TD_02">姓名</td>
			<td class="TABLE_TD_01"><input type="text" readonly="readonly" name="stuname" value="<%=rs.getString("stuname")%>" /></td>
			<td class="TABLE_TD_02">性别</td>
			<td class="TABLE_TD_01"><input type="text" readonly="readonly" name="gender" value="<%=rs.getString("gender")%>" /></td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">导师</td>
			<td class="TABLE_TD_01">
				<select style="vertical-align:middle;" name="teacherno">
					<%
					ResultSet rs2 = total.findAllTeachers(username);
					while (rs2.next()) {
						out.println("<option value=\"" + rs2.getString("teacherno") + "\">" + rs2.getString("name") + "</option>");
					}
					%>
				</select>
				<script>document.getElementsByName("teacherno")[0].value="<%=rs.getString("TeacherInfo.teacherno")%>"</script>
			</td>
			<td class="TABLE_TD_02">毕业时间</td>
			<td class="TABLE_TD_01"><input type="text" name="graduatedate" value="<%=rs.getString("graduatedate")%>" /></td>
			<td class="TABLE_TD_02">证书编号</td>
			<td class="TABLE_TD_01"><input type="text" name="certificate_no" value="<%=rs.getString("certificate_no")%>" /></td>
		</tr>
		<tr height="27">
			<td align="center" colspan="6">
				<input type="submit" value="修改" />
				<input type="hidden" name="method" value="doModify" />
				&nbsp;&nbsp;
				<input type="button" value="取消" onClick="location.href='dean/studentManage/graduateManage.jsp?admissionTime=<%=rs1.getString("admissiontime")%>&degree=<%=rs1.getString("master_doctor")%>&schoolrollstate=<%=rs1.getString("schoolrollstate")%>&doSearch=1'" />
			</td>
		</tr>
	</table>
	</form>
<%
} else if (method.equals("doModify")) {
	request.setCharacterEncoding("utf-8");
	ResultSet rs1 = total.getBasicInfo(stuno);
	rs1.first();
	String certificate_no = request.getParameter("certificate_no");
	String graduatedate = request.getParameter("graduatedate");
	String teacherno = request.getParameter("teacherno");
	boolean doModifySuccess = total.altergraduateInfo(stuno, certificate_no, graduatedate, teacherno, "");
	if (doModifySuccess)
		out.println("<script>alert(\"修改毕业信息成功\")</script>");
	else
		out.println("<script>alert(\"修改毕业信息失败\")</script>");
%>
	<script>
		location.href='dean/studentManage/graduateManage.jsp?admissionTime=<%=rs1.getString("admissiontime")%>&degree=<%=rs1.getString("master_doctor")%>&schoolrollstate=<%=rs1.getString("schoolrollstate")%>&doSearch=1'
	</script>
<%
}
%>
</div>

<div class="Line"></div>

</body>
</html>