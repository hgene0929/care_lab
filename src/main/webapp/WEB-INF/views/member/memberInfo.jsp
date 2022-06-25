<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodTherapy</title>
</head>
<body onload="setPost()">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../default/header1.jsp" %>

<div class="wrap">
	<br>
	<h3 align="center">회 원 정 보</h3>
	<br>
	<table class="table table-hover">
		<tr>
			<th>아이디</th> <th>비밀번호</th> <th>주소</th>
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td><a href="info?id=${dto.id }">${dto.id }</a></td>
				<td>* * * * *</td>
				<td>${dto.addr }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>