<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*" %>
<%!
	Connection connection;
	Statement statement;
	ResultSet resultset;
%>

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

	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
	}

	try {
		connection = DriverManager.getConnection("jdbc:mysql://114.212.134.13/pybdb","admin","pyb15");
		// out.println("Database connected");
		statement = connection.createStatement();
		String sql = "SELECT uname, role FROM user WHERE uid = '" + username + "' AND passwd = '" + password + "';";
		out.println(sql);
		resultset = statement.executeQuery(sql);
		if (resultset.next()) {
			session.setAttribute("uid", username);
			session.setAttribute("uname", resultset.getString("uname"));
			session.setAttribute("role", resultset.getInt("role"));
			switch (resultset.getInt("role")) {
				case 1:	response.sendRedirect("admin");	break;
				case 2:	response.sendRedirect("dean");	break;
				case 3:	response.sendRedirect("student");	break;
			}
		} else {
			response.sendRedirect("index.jsp?errormsg=wrong_username_or_password");
		}
		connection.close();
	} catch (SQLException e1) {
		out.println("SQL error!");
	}
%>
</body>
</html>