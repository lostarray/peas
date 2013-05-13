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
		<li><a href="student/personalInfo/basicInfo.jsp">
			<img src="image/common/2.png" alt="" /><br />基本信息查看</a>
		</li>
		<li><a href="student/personalInfo/modifyInfo.jsp">
			<img src="image/common/4.png" alt="" /><br />基本信息修改</a>
		</li>
		<li><a href="student/personalInfo/graduateInfo.jsp">
			<img src="image/common/1.png" alt="" /><br />毕业信息核对</a>
		</li>
	</ul>
</div>

<div class="Line"></div>

</body>
</html>