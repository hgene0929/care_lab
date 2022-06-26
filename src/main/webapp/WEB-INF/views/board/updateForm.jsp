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
	<form action="update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="writeNo" value="${data.writeNo }">
		<input type="hidden" name="originFileName" value="${data.imageFileName }">
		<div class="form-group">
			<label for="title">제목:</label>
			<input class="form-control" type="text" size="50" name="title" id="title" value="${data.title }">
		</div>
		<div class="form-group">
			<label for="content">내용:</label>
			<textarea class="form-control" rows="10" cols="55" name="content" id="content">${data.content }</textarea>
		</div>
		<div class="form-group">
			<img src="download?imageFileName=${data.imageFileName }" width="200px" height="100px" id="preview"><br>
			<input type="file" name="imageFileName" onchange="readURL(this)">
		</div>
		<div align="right">
				<input class="btn btn-primary" type="submit" value="update">
				<input class="btn btn-outline-primary" type="button" onclick="location.href='/root/board/boardAllList'" value="reset">
		</div>
	</form>
</div>

</body>
</html>