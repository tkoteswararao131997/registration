<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup page</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
	<form action="signup" method="post">
		<div align="center">
			<h1>Sign Up</h1>
			<div class="loginbox" align="center">
				<label for="fullname">Full Name:</label> <input type="text"
					placeholder="enter name" id="fullname" required="enter name"
					name="fullname"></br> <label for="password">password:</label> <input
					type="password" placeholder="enter password" id="password" required
					name="password"></br> <label for="email">email:</label> <input
					type="email" placeholder="enter email-id" id="email"
					required="enter email" name="email"></br> <label for="mno">mobilenumber:</label>
				<input type="text" placeholder="enter mobile number" id="mno"
					required="enter mobile number" name="mno"></br>
				<button type="submit" id="login">signup</button>
			</div>
		</div>
	</form>
</body>
</html>