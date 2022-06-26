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

<div align="center">
	<table border="1">
		<tr>
			<th>번호</th> <th>ID</th> <th>제목</th>
			<th>날짜</th> <th>조회수</th> <th>이미지</th>
		</tr>
		
		<c:if test="${boardAllList.size() == 0 }">
			<tr><th colspan="6">등록된 글이 없습니다.</th></tr>
		</c:if>
		<c:forEach var="dto" items="${boardAllList }">
			<tr>
				<td>${dto.writeNo }</td> <td>${dto.id }</td> <td><a href="contentView?writeNo=${dto.writeNo }">${dto.title }</a></td>
				<td>${dto.saveDate }</td> <td>${dto.hit }</td> <td>${dto.imageFileName }</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="6" align="right">
				<a href="/root/board/writeForm">글작성</a>
			</td>
		</tr>
	</table>
</div>
</body>
</html>