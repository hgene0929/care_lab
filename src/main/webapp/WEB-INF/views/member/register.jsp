<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap" align="center">
	<form action="register" method="post">
		<table>
			<tr>
				<td>
					<input type="text" name="id", placeholder="아이디를 입력하세요."><br>
					<input type="password" name="pw", placeholder="비밀번호를 입력하세요."><br>
					<input type="text" name="addr", placeholder="주소를 입력하세요."><br>
					<input type="submit" value="확인">			
				</td>
			</tr>
		</table>
		
		<br>
	</form>
</div>
</body>
</html>