<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Care Lab</title>
<script type="text/javascript">
function del() {
	let result = confirm("정말로 삭제 하시겠습니까?")
	if(result) {
		alert('게시글 삭제')
		location.href="delete?writeNo=${data.writeNo}"
	}
}
</script>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../default/header.jsp" %>

<div class="wrap">
	<br>
	<h3 align="center">${data.title })</h3>
	<br>
	<table class="table">
		<tr><th>글 번호</th> <td>${data.writeNo }</td> <th>작성자</th> <td>${data.id }</td></tr>
		<tr><th>제목</th> <td>${data.title }</td> <th>등록일자</th> <td>${data.saveDate }</td></tr>
		<tr><th>내용</th> <td>${data.content }</td> <th colspan="2"></th><td><img width="200px" height="100px" src="download?imageFileName=${data.imageFileName }"></td></tr>
		<tr>
			<td colspan="2" align="right">
				<c:if test="${loginUser == data.id }">
					<button type="button" onclick="location.href='update_form?writeNo=${data.writeNo}'">수정</button>
					<button type="button" onclick="del()">삭제</button>
				</c:if>
					<button type="button" onclick="location.href=''">댓글</button>
					<button type="button" onclick="location.href='boardAllList'">목록</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>