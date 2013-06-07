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
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if (username.isEmpty() || password.isEmpty()) {
		response.sendRedirect("index.jsp?errormsg=blank_username_or_password");
		return;
	}

	ResultSet resultset = total.login(username, password);
	if (resultset.next()) {
		session.setAttribute("username", username);
		session.setAttribute("name", resultset.getString(2));
		session.setAttribute("role", resultset.getInt("role"));
		switch (resultset.getInt("role")) {
			case 0:	response.sendRedirect("admin");	break;
			case 1:	response.sendRedirect("dean");	break;
			case 2:	response.sendRedirect("student");	break;
		}
	} else {
		response.sendRedirect("index.jsp?errormsg=wrong_username_or_password");
	}
%>
</body>
</html>