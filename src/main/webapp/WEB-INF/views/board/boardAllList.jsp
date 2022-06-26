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
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../default/header.jsp" %>

<div align="center">
<br>
	<table class="table" style="width:900px; margin: 0 auto;">
		<tr style="background-color:rgb(220, 220, 222); ">
			<th><div>번호</div></th> <th><div>ID</div></th> <th><div>제목</div></th>
			<th><div>날짜</div></th> <th><div>조회수</div></th> <th><div>이미지</div></th>
		</tr>
		
		<c:if test="${boardAllList.size() == 0 }">
			<tr><th colspan="6">등록된 글이 없습니다.</th></tr>
		</c:if>
		<c:forEach var="dto" items="${boardAllList }">
			<tr>
				<td><div>${dto.writeNo }</div></td> <td><div>${dto.id }</div></td> 
				<td><div><a href="contentView?writeNo=${dto.writeNo }">${dto.title }</a></div></td>
				<td><div>${dto.saveDate }</div></td> <td><div>${dto.hit }</div></td> <td><div>${dto.imageFileName }</div></td>
			</tr>
		</c:forEach>
	</table>
	<div align="center" style="width: 890px; margin-top: 8px">
		<div align="right">
			<input class="btn btn-outline-primary" type="button" onclick="location.href='/root/board/writeForm'" value="upload">
		</div>
		<div align="center">
			<c:forEach var="num" begin="1" end="${repeat }">
				<a href="boardAllList?num=${num }">${num } &nbsp;</a>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>