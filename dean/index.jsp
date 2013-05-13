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
<jsp:include page="header.jsp" />

<div id="Function">
	<ul>
		<li><a href="dean/studentManage"><img src="image/dean/studentmanage.png" alt="" /><br />学生管理</a></li>
		<li><a href="dean/scoreManage"><img src="image/dean/scoremanage.png" alt="" /><br />成绩管理</a></li>
		<li><a href="dean/courseManage"><img src="image/dean/coursemanage.png" alt="" /><br />课程管理</a></li>
		<li><a href="dean/deanInfo"><img src="image/dean/deaninfo.png" alt="" /><br />教务员信息</a></li>
	</ul>
</div>

<div class="Line"></div>

</body>
</html>