<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Care Lab</title>
<style type="text/css">
	th div { text-align: center; }
	td div { text-align: center; }
</style>
</head>
<body onload="setPost()">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../default/header.jsp" %>

<div class="wrap">
	<br>
	<table class="table" style="width:700px; margin: 0 auto;">
		<tr style="background-color:rgb(220, 220, 222); ">
			<th><div>아이디</div></th> 
			<th><div>비밀번호</div></th> 
			<th><div>주소</div></th>
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td><div><a href="info?id=${dto.id }">${dto.id }</a></div></td>
				<td><div>* * * * *</div></td>
				<td><div>${dto.addr }</div></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>