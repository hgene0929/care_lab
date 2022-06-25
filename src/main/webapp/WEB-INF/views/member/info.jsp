<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodTherapy</title>
<script>
function del() {
	let result = confirm("정말로 탈퇴 하시겠습니까?")
	if(result) {
		alert('회원 탈퇴')
		location.href="delete?id=${data.id}"
	}
}
</script>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../default/header1.jsp" %>

<div class="wrap">
	<br>
	<h3 align="center">개 인 정 보</h3>
	<br>
	<table class="table table-hover">
		<tr><th>아이디</th> <td>${data.id }</td></tr>
		<tr><th>비밀번호</th> <td>${data.pw }</td></tr>
		<tr><th>주소</th> <td>${data.addr }</td></tr>
	</table>
	<c:if test="${loginUser == data.id }">
		<div align="right">
			<button type="button" class="btn btn-dark" onclick="location.href='update_form?id=${data.id}'">
			수정</button> &nbsp;
			<button type="button" class="btn btn-dark" onclick="del()">탈퇴</button>
		</div>
	</c:if>
</div>
</body>
</html>