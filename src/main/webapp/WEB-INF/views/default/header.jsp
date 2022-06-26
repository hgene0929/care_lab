<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style type="text/css">
* {
	margin: 0;
}

.wrap {
	width: 1000px;
	margin: auto;
}

.header {
	width: 1000px;
	background-color: white;
}

.navdiv {
	width: 100%;
	background-color: rgb(2, 25, 64);
}

nav {
	background-color: rgb(2, 25, 64);
	width: 1000px;
}

nav ul {
	list-style: none;
	display: flex;
	justify-content: flex-end;
}

nav ul li {
	margin: 0 3px;
	padding: 10px 10px;
}

nav ul li a {
	text-decoration: none;
	color: white;
}

nav ul li a:hover {
	color: rgb(198, 200, 204);
	padding-bottom: 3px; /* a태그 밑줄과 글씨 간격*/
	border-bottom: 1px solid gray;
	transition: all 0.25s;
}

.title { /*오른, 아래, 번짐*/
	
	font-size: 70pt;
	text-align: center;
	margin-top: 10px;
	padding-bottom: 10px;
	color: rgb(89, 90, 92);
	font-family: Lucida Console;
}

.content {
	margin-top: 50px;
}
</style>

</head>
<body>
	<div class="wrap">
		<div class="header">
			<h1 class="title">CARE LAB</h1>
		</div>
	</div>
	<div class="navdiv">
		<div class="wrap">
			<nav>
				<ul>
					<li><a href="/root">HOME</a></li>
					<li>
						<a href="/root/member/memberInfo">MEMBER_SHIP</a>
					</li>
					<li>
						<a href="/root/board/boardAllList">BOARD</a>
					</li>
					<li>
						<c:if test="${loginUser == null }">
							<a href="/root/member/login">SIGN_IN</a>
						</c:if>
						<c:if test="${loginUser != null }">
							<a href="/root/member/logout">SIGN_OUT</a>
						</c:if>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>



