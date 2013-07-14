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
	<ul>
		<li><a href="dean/studentManage/searchStudent.jsp"><img src="image/common/3.png" alt="" /><br />学生查询</a></li>
		<li><a href="dean/studentManage/studentStatics.jsp"><img src="image/common/6.png" alt="" /><br />学生统计</a></li>
		<li><a href="dean/studentManage/teacherManage.jsp"><img src="image/common/5.png" alt="" /><br />导师管理</a></li>
		<li><a href="dean/studentManage/teacherAndStudent.jsp"><img src="image/common/1.png" alt="" /><br />师生互联</a></li>
		<li><a href=""><img src="" alt="" /><br />超期管理</a></li>
		<li><a href=""><img src="" alt="" /><br />毕业信息管理</a></li>
	</ul>
</div>

<div class="Line"></div>

</body>
</html>