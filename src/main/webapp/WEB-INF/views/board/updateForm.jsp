<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Care Lab</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../default/header.jsp" %>

<div class="wrap" align="center" style="width: 500px; margin: 0 auto;">
	<br>
	<h3 align="center">게 시 글 수 정</h3>
	<br>
	<form action="update" method="post" enctype="multipart/form-data">
	<b>작성자</b>
	<input type="text" name="id" value="${data.id }" readonly><hr>
	<b>제목</b>
	<input type="text" size="50" name="title" value="${data.title }"><hr>
	<b>내용</b>
	<textarea rows="10" cols="55" name="content" value="${data.content }"></textarea><hr>
	<b>이미지 파일 첨부</b>
	<input type="file" name="image_file_name" onchange="readURL(this)">
	<img src="#" width="100" height="100" id="preview"><hr>
	<div align="right">
		<input type="submit" value="수정">
		<a href="/root/board/boardAllList">목록이동</a>
	</div>
</form>
</div>
</body>
</html>