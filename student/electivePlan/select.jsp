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

<script>
	function enableSubmit() {
		document.getElementsByName("chooseSubmit")[0].removeAttribute("disabled");
	}
</script>

<%
String username = (String) session.getAttribute("username");
String classkind = request.getParameter("classkind");
int currentYear = Integer.parseInt((String) application.getAttribute("currentYear"));
String schoolyear = (currentYear-1) + "-" + currentYear;
String schoolterm = (String) application.getAttribute("currentTerm");
if (classkind == null)
	classkind = "专业课";
else
	classkind = new String(classkind.getBytes("ISO-8859-1"), "UTF-8");

String courseno = request.getParameter("courseno");
String classno = request.getParameter("classno");
if (classno != null) {
	boolean chooseSuccess = total.chooseCourse(courseno, username, schoolyear, schoolterm, 0, "", Integer.parseInt(classno));
	if (chooseSuccess) %>
		<script>alert("选课成功");</script>
<%
	else %>
		<script>alert("选课失败");</script>
<%
}
%>

<div id="Function" style="font-size:14px">
	<form action="student/electivePlan/select.jsp" method="post">
		<label for="">课程类型: </label>
		<select style="vertical-align:middle;" name="classkind">
			<option value="专业课">专业课</option>
			<option value="通识课">通识课</option>
			<option value="公选课">公选课</option>
		</select>
		<script>
			document.getElementsByName("classkind")[0].value="<%=classkind%>";
		</script>
		<input type="submit" value="查询" />
		<br /><br />
	</form>

		<table width="100%">
		<tr>
		<td width="50%" valign="top">
			<table id="tbCourseList" width="90%" bordercolor="#777777" border="1" style="border-collapse:collapse">
				<tr class="TABLE_TH">
					<td align="center">课程号</td>
					<td align="center">课程名</td>
					<td align="center">学分</td>
					<td align="center">学时</td>
					<td align="center">类型</td>
					<td align="center">性质</td>
					<td align="center">开课院系</td>
					<td align="center">校区</td>
					<td align="center">状态</td>
				</tr>

				<%
				int index = 0;
				ResultSet resultset = total.displayCourseInfo(username, classkind, schoolyear, schoolterm);
				while (resultset.next()) {
					out.println("<tr class=\"TABLE_TD_0" + (++index % 2 + 1) + "\">");
					out.println("<td align=\"center\">" + resultset.getString("courseno") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("coursename") + "</td>");
					out.println("<td align=\"center\">" + resultset.getInt("credit") + "</td>");
					out.println("<td align=\"center\">" + resultset.getInt("classhour") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("coursetype") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("property") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("speciality") + "</td>");
					out.println("<td align=\"center\">" + resultset.getString("schoolarea") + "</td>");
					out.println("<td align=\"center\"><a href=\"student/electivePlan/select.jsp?classkind=" + classkind + "&courseno=" + resultset.getString("courseno") + "\">" + (total.isSelected(username, resultset.getString("courseno"), schoolyear, schoolterm) > 0 ? "已选" : "未选") + "</a>" + "</td>");
					out.println("</tr>");
				}
				%>
			</table>
		</td>

		<td width="45%" valign="top">
			<%
			if (courseno != null) {
			%>
			<form action="student/electivePlan/select.jsp" method="post">
				<table id="tbCourseList" width="80%" bordercolor="#777777" border="1" style="border-collapse:collapse">
					<tr class="TABLE_TH">
						<th align="center">班级</th>
						<th align="center">上课地点</th>
						<th align="center">上课时间</th>
						<th align="center">教师</th>
						<th align="center">选课人数</th>
						<th align="center">选择</th>
					</tr>
					<input type="hidden" name="courseno" value="<%=courseno%>" />

					<%
					int index2 = 0;
					int selected = total.isSelected(username, courseno, schoolyear, schoolterm);
					boolean allowSubmit = true;
					ResultSet resultset2 = total.getChosenCourseInfo(courseno, schoolyear, schoolterm);
					while (resultset2.next()) {
						out.println("<tr class=\"TABLE_TD_0" + (++index2 % 2 + 1) + "\">");
						out.println("<td align=\"center\">" + resultset2.getString("classno") + "</td>");
						out.println("<td align=\"center\">" + resultset2.getString("classroom") + "</td>");
						out.println("<td align=\"center\">" + resultset2.getString("coursetime") + "</td>");
						out.println("<td align=\"center\">" + resultset2.getString("TeacherInfo.name") + "</td>");
						out.println("<td align=\"center\">" + resultset2.getInt("numofelec") + "/" + resultset2.getInt("maxelec") + "</td>");
						if (selected > 0 || (resultset2.getInt("numofelec") >= resultset2.getInt("maxelec"))) {
							out.println("<td align=\"center\"><input type=\"radio\" name=\"classno\" value=\"" + resultset2.getInt("classno") + "\" disabled=\"disabled\" /></td>");
							allowSubmit = false;
						} else {
							out.println("<td align=\"center\"><input type=\"radio\" onclick=\"enableSubmit()\" name=\"classno\" value=\"" + resultset2.getInt("classno") + "\" /></td>");
						}
						out.println("</tr>");
					}
					out.println("<td align=\"center\" colspan=\"6\">");
					if (allowSubmit)
						out.println("<input type=\"submit\" name=\"chooseSubmit\" value=\"提交\" />");
					else
						out.println("<input type=\"submit\" name=\"chooseSubmit\" value=\"提交\" disabled=\"disabled\" />");
					out.println("</td>");
					%>
					<script>
						var obj = document.getElementsByName("classno");
						var allowSubmit = false;
						for(i = 0; i < obj.length; i++) {
							if(obj[i].value == <%=selected%>) {
								obj[i].checked = true;
								allowSubmit = true;
							}
						}
						if (!allowSubmit) {
							document.getElementsByName("chooseSubmit")[0].setAttribute("disabled", "disabled");
						}
					</script>
				</table>
			</form>
			<% } %>
		</td>
		</tr>
		</table>
</div>

<div class="Line"></div>

</body>
</html>