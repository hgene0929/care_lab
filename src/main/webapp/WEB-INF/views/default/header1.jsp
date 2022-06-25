<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>FoodTherapy</title>
<style type="text/css">
	* {
		margin: 0;
	}
	
	.wrap {
		width: 1000px;
		margin: auto;
	}
</style>
</head>

<body>
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>FoodTherapy</h1>
  <p>Bon appetit!</p> 
</div>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="#">menu</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="/root">home</a>
      </li>
      <li class="nav-item">
      <c:if test="${loginUser == null }">
        <a class="nav-link" href="/root/member/login">members</a>
      </c:if>
      <c:if test="${loginUser != null }">
        <a class="nav-link" href="/root/member/memberInfo">members</a>
      </c:if>
      </li>
      <li class="nav-item">
      <c:if test="${loginUser == null }">
        <a class="nav-link" href="/root/member/login">sign_in</a>
      </c:if>
      <c:if test="${loginUser != null }">
        <a class="nav-link" href="/root/member/logout">sign_out</a>
      </c:if>
      </li>
    </ul>
  </div>  
</nav>
<br>
</body>
</html>