<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
<form action="student/personalInfo/naturalInfo.jsp" method="post">
	<table width="80%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
		<tr>
			<th colspan="6" class="TABLE_TH" >基本信息</th>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">学号</td>
			<td class="TABLE_TD_01">101220013</td>
			<td class="TABLE_TD_02">姓名</td>
			<td class="TABLE_TD_01">陈欣</td>
			<td class="TABLE_TD_02">性别</td>
			<td class="TABLE_TD_01">男</td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">出生日期</td>
			<td class="TABLE_TD_01">1991年09月27日</td>
			<td class="TABLE_TD_02">身份证号</td>
			<td colspan="3" class="TABLE_TD_01">320304199109270416</td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">所在院系</td>
			<td class="TABLE_TD_01">计算机科学与技术系</td>
			<td class="TABLE_TD_02">所在专业</td>
			<td class="TABLE_TD_01">计算机科学与技术</td>
			<td class="TABLE_TD_02">专业方向</td>
			<td class="TABLE_TD_01"></td>
		</tr>
		<tr height="27">
			<td class="TABLE_TD_02">入学年级</td>
			<td class="TABLE_TD_01">2010</td>
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
		<tr>
			<td class="TABLE_TD_01" colspan="6">
				<center><input type="submit" value="保存" name="save" /></center>
			</td>
		</tr>
	</table>		
</form>
</div>

<div class="Line"></div>

</body>
</html>