<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/login.css">
<title>login page</title>
</head>
<body>
	<form action="login" method="post">
		<div align="center">
			<h1>Login</h1>
			<div class="loginbox" align="center">
				</br>
				<label for="username:">username:</label> <input type="text"
					id="username:" name="uname" placeholder="enter username"></br> <label
					for="password:">password:</label>&nbsp <input type="password"
					id="password:" name="pwd" placeholder="enter password"></br> <input
					id="login" type="submit" value="login"> <input id="login"
					type="submit" value="signup" formaction="signup.jsp">
			</div>
		</div>
	</form>
	
</body>
</html>