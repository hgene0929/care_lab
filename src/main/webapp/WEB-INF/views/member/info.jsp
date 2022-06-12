<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../default/header.jsp" %>

<div class="wrap">
	<br>
	<h3 align="center">개 인 정 보</h3>
	<br>
	<table class="table table-striped">
		<tr><th>아이디</th> <td>${data.id }</td></tr>
		<tr><th>비밀번호</th> <td>${data.pw }</td></tr>
		<tr><th>주소</th> <td>${data.addr }</td></tr>
	</table>
</div>
</body>
</html>