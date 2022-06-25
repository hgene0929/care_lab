<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodTherapy</title>
<style type="text/css">
	* {
		margin: 0;
	}
	
	.login {
		width: 450px;
		margin: auto;
	}
</style>
</head>
<body>
<%@ include file="../default/header1.jsp" %>

<br>
<h3 align="center"></h3>
<br>

<div class="login">
	<form action="user_check" method="post" class="was-validated">
		<div class="form-group">
	      <input type="text" class="form-control" id="uname" placeholder="Enter userID" name="id" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pw" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	      <input type="checkbox" name="autoLogin">로그인 상태 유지 
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      <input type="submit" class="btn btn-dark" value="로그인">
		  <a href="register_form">회원가입</a>	
	    </div>
	</form>
</div>
</body>
</html>