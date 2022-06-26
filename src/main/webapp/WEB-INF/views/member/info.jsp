<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Care Lab</title>
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
<%@ include file="../default/header.jsp" %>

<div class="wrap">
	<br>
	<h3 align="center">개 인 정 보</h3>
	<br>
	<table class="table table-striped">
		<tr><th>아이디</th> <td>${data.id }</td></tr>
		<tr><th>비밀번호</th> <td>${data.pw }</td></tr>
		<tr><th>주소</th> <td>${data.addr }</td></tr>
		<c:if test="${loginUser == data.id }">
			<tr>
				<td colspan="2" align="right">
					<button type="button" onclick="location.href='update_form?id=${data.id}'">수정</button>
					&nbsp; &nbsp;
					<button type="button" onclick="del()">탈퇴</button>
				</td>
			</tr>
		</c:if>
	</table>
</div>
</body>
</html>