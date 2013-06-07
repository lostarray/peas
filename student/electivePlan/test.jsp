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
<link href="css/student/elective/specialityCourse.css" rel="stylesheet" type="text/css">
选课专业：
<select style="vertical-align:middle;" id="specialityList" name="specialityList" onchange="javascript:specialityChange()">
	<option value="220" selected="selected">计算机科学类</option>
</select>
年级：
<select style="vertical-align:middle;" id="gradeList" name="gradeList" onchange="javascript:specialityChange()">
	<option value="2013">2013</option>
	<option value="2012">2012</option>
	<option value="2011">2011</option>
	<option value="2010" selected="selected">2010</option>
	<option value="2009">2009</option>
	<option value="2008">2008</option>
	<option value="2007">2007</option>
	<option value="2006">2006</option>
	<option value="2005">2005</option>
	<option value="2004">2004</option>
	<option value="2003">2003</option>
	<option value="2002">2002</option>
</select>
<br><br>
<table id="tbCourseList" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse">
	<thead>
	<tr>
		<td>课程号</td>
		<td width="150">课程名</td>
		<td>学分</td>
		<td>学时</td>
		<td>类型</td>
		<td>性质</td>
		<td>开课院系</td>
		<td>状态</td>
	</tr>
	</thead>
	<tbody>
	<tr onclick="javascript:showClassInfo('000030A', '', '01', '220', '2010')" class="TABLE_TR_01">
		<td>000030A</td>
		<td width="150">毛泽东思想和中国特色社会主义理论体系概论（理论部分）</td>
		<td align="center">3</td>
		<td align="center">3</td>
		<td>通修</td>
		<td>必选</td>
		<td>公共课程</td>
		<td id="tdSelected000030A">已选</td>
	</tr>
	<tr onclick="javascript:showClassInfo('221030', '', '01', '220', '2010')" class="TABLE_TR_01">
		<td>221030</td>
		<td width="150">算法设计与分析</td>
		<td align="center">4</td>
		<td align="center">4</td>
		<td>平台</td>
		<td>必选</td>
		<td>计算机科学与技术系</td>
		<td id="tdSelected221030"><a style="color:red;">未选</a></td>
	</tr>
	<tr onclick="javascript:showClassInfo('221050', '', '01', '220', '2010')" class="TABLE_TR_01">
		<td>221050</td>
		<td width="150">计算机网络</td>
		<td align="center">4</td>
		<td align="center">4</td>
		<td>平台</td>
		<td>必选</td>
		<td>计算机科学与技术系</td>
		<td id="tdSelected221050"><a style="color:red;">未选</a></td>
	</tr>
	<tr onclick="javascript:showClassInfo('221060', '', '01', '220', '2010')" class="TABLE_TR_01">
		<td>221060</td>
		<td width="150">计算机网络实验</td>
		<td align="center">2</td>
		<td align="center">2</td>
		<td>平台</td>
		<td>必选</td>
		<td>计算机科学与技术系</td>
		<td id="tdSelected221060">已选</td>	
	</tr>
	<tr onclick="javascript:showClassInfo('221100', ',0', '02', '220', '2010')" class="TABLE_TR_01">
		<td>221100</td>
		<td width="150">高级程序设计</td>
		<td align="center">4</td>
		<td align="center">4</td>
		<td>选修</td>
		<td>可选</td>
		<td>计算机科学与技术系</td>
		<td id="tdSelected221100"><a style="color:red;">未选</a></td>
	</tr>
	<tr onclick="javascript:showClassInfo('221110', '', '03', '220', '2010')" class="TABLE_TR_01">
		<td>221110</td>
		<td width="150">数据库概论</td>
		<td align="center">4</td>
		<td align="center">4</td>
		<td>选修</td>
		<td>指选</td>
		<td>计算机科学与技术系</td>
		<td id="tdSelected221110"><a style="color:red;">未选</a></td>
	</tr>
	<tr onclick="javascript:showClassInfo('221120', ',51388,51392,51390', '04', '220', '2010')" class="TABLE_TR_01">
		<td>221120</td>
		<td width="150">编译原理</td>
		<td align="center">4</td>
		<td align="center">4</td>
		<td>选修</td>
		<td>可选</td>
		<td>计算机科学与技术系</td>
		<td id="tdSelected221120">已选</td>	
	</tr>
	<tr onclick="javascript:showClassInfo('221220', ',51394', '02', '220', '2010')" class="TABLE_TR_01">
		<td>221220</td>
		<td width="150">多媒体技术</td>
		<td align="center">3</td>
		<td align="center">3</td>
		<td>选修</td>
		<td>可选</td>
		<td>计算机科学与技术系</td>
		<td id="tdSelected221220"><a style="color:red;">未选</a></td>
	</tr>
	<tr onclick="javascript:showClassInfo('221230', ',51397', '02', '220', '2010')" class="TABLE_TR_01">
		<td>221230</td>
		<td width="150">数据挖掘导论</td>
		<td align="center">2</td>
		<td align="center">2</td>
		<td>选修</td>
		<td>可选</td>
		<td>计算机科学与技术系</td>
		<td id="tdSelected221230">已选</td>
	</tr>
	</tbody>		
</table>
<div style="padding-left:10px;padding-top: 20px;color: #0000FF;">
选课说明：<br>1、选课性质中只有“可选”课才需要同学们选择，“必选”课和“指选”由管理人员帮同学们自动选好。不需要同学们去点。<br>
2、如果课程分多个班级上课，请根据安排选择自己所在班级。<br>
3、如专业课表与你现在所在专业不符，请与教务员老师联系。
</div>
</div>
<div class="Line"></div>
</body>
</html>