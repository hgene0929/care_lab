<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Care Lab</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function readURL(input) {
	let file = input.files[0] //파일의 정보
	if(file != "") {
		let reader = new FileReader()
		reader.readAsDataURL(file) //파일의 정보를 토대로 파일 읽기
		reader.onload = function(e) {//파일 로드한 값 표현
			//e : 이벤트 안에 result 값이 파일의 정보를 가지고 있다
			$("#preview").attr("src", e.target.result)
		}
	}
}
</script>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../default/header.jsp" %>

<div id="wrap" style="width: 400px; margin: auto; margin-bottom: 120px; margin-top: 50px;">
	<h1 style="text-align: center;">care board</h1><br>
	<form action="/root/board/writeSave" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="id">작성자:</label>
			<input class="form-control" type="text" name="id", id="id" value="${loginUser }" readonly>
		</div>
		<div class="form-group">
			<label for="title">제목:</label>
			<input class="form-control" type="text" size="50" name="title" id="title">
		</div>
		<div class="form-group">
			<label for="content">내용:</label>
			<textarea class="form-control" rows="10" cols="55" name="content" id="content"></textarea>
		</div>
		<div class="form-group">
			<label for="img">이미지 파일 첨부:</label>
			<input type="file" name="image_file_name" onchange="readURL(this)" id="img">
			<img src="#" width="100" height="100" id="preview">
		</div>
		<div align="right">
				<input class="btn btn-primary" type="submit" value="upload">
				<input class="btn btn-outline-primary" type="button" onclick="location.href='/root/board/boardAllList'" value="back">
		</div>
	</form>
</div>
</body>
</html>