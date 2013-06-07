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
	</style>
	<body class="BODY"  leftmargin="50" rightmargin="50" >
	<div  align="center">
	<table width="100%"  height="100%" align="left" >
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr align="left"></tr>
      	<td width="50">&nbsp;</td>
        <td width="150"  align="right" valign="top">
			<div>
				<table  width="100%" height="100%" border="0"  bordercolor="#3366CC">
					<tr class="TEXT_TITLE">
					<td>请选择学期 </td>
					</tr>
					
					<tr height="5">
					<td > </td>
					</tr>
					
					<tr align="center" height="22">
					<td><a  href="student/scoreQuery/test.jsp"/>2012-2013学年第一学期</a> </td>
					</tr>
					  
					<tr align="center" height="22">
					<td><a  href="student/scoreQuery/test.jsp"/>2011-2012学年第二学期</a> </td>
					</tr>
					  
					<tr align="center" height="22">
					<td><a  href="student/scoreQuery/test.jsp"/>2011-2012学年第一学期</a> </td>
					</tr>
					  
					<tr align="center" height="22">
					<td><a  href="student/scoreQuery/test.jsp"/>2010-2011学年第二学期</a> </td>
					</tr>
					  
					<tr align="center" height="22">
					<td><a  href="student/scoreQuery/test.jsp"/>2010-2011学年第一学期</a> </td>
					</tr>
					
				    <tr ></tr>
					<tr ></tr>
					   
				    <tr height="5">
					<td > </td>
					</tr>
				    
				</table>
			</div>
		</td>
		<td width="10" >&nbsp;</td>
        <td align="left" valign="top">
	        <div align=center style="margin-bottom: 5px">
				<a style="font-size: 14px; text-align: center;font-weight: bold;"></a>
			</div>
			<table width="95%" class="TABLE_BODY" bordercolor="#777777" border="1" style="border-collapse:collapse">
				<tr class="TABLE_TH">
					<th align="center">序号</th>
					<th align="center">课程编号</th>
					<th align="center">课程名称</th>
					<th align="center">英文名称</th>
					<th align="center">课程类型</th>
					<th align="center">学分</th>
					<th align="center">成绩</th>
					<th align="center">备注</th>
					<!--  <th align="center">交换成绩对应课程</th>-->
					<!--  <th align="center">操作</th>-->
				</tr>
			</table>
		</td>
</div>

<div class="Line"></div>

</body>
</html>