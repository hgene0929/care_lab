<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Care Lab</title>
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap" align="right">
<div class="form-group">
	<form action="user_check" method="post">
		<input type="text" name="id" size="30" style="margin-bottom: 5px", placeholder="Enter your ID"><br>
		<input type="password" name="pw" size="30", placeholder="Enter your password"><br>
		<div style="margin: 6px"></div>
		<a href="register_form">register</a>
		<input class="btn btn-primary" type="submit" value="sign_in" style="margin-bottom: 5px"><br>
		<input type="checkbox" name="autoLogin" style="margin-bottom: 15px">Remember me<br>
	</form>
</div>
</div>
</body>
</html>