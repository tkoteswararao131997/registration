<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" method="post">
	mobilenumber:<input type="text" placeholder="mobilenumber" name="mobilenumber"></br>
	set password:<input type="text" placeholder="set password" name="password"></br>
	<input type="button" value="reset">
</form>
	<%
	
		String mobilenumber=request.getParameter("mobilenumber");
		String pass=request.getParameter("password");
		String query="select password from login";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "kevin", "password");
		PreparedStatement pst=con.prepareStatement(query);
		pst.executeUpdate();
		System.out.print("connected");
		pst.close();
		con.close();
	%>

	
	
</body>
</html>