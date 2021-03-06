<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Care Lab</title>
<style type="text/css">
	#modal_wrap {
		display: none;
		position: fixed; z-index: 9; margin: auto;
		top: 0; left: 0; right: 0; width: 100%;
		height: 100%; background-color: rgba(0,0,0,0.4)
	}
	#first {
		display: none;
		position: fixed; z-index: 10; margin: auto;
		top: 30px; left: 0; right: 0; width: 350px;
		height: 450px; background-color: rgba(207, 211, 212, 0.9)
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function slideClick() {
	$("#first").slideDown("slow");
	$("#modal_wrap").show();
}
function slide_hide() {
	$("#first").hide();
	$("#modal_wrap").hide();
}
function rep() {
	let from={}
	let arr = $("#frm").serializeArray();
	for(let i=0;i <arr.length; i++){
		from[arr[i].name] = arr[i].value
	}
	$.ajax({
		url : "addReply", type : "post",
		data : JSON.stringify(from),
		contentType : "application/json;charset=utf8",
		success : function() {
			alert('댓글이 달렸습니다.');
			slide_hide()
			replyData()
		}
	})
}
function replyData() {
	$.ajax({
		url: "replyData/"+${data.writeNo}, 
		type: "get", dataType:"json",
		success : function(rep) {
			let html=""
			rep.forEach(function(data) {
				let date = new Date(data.write_date)
				let wd = date.getFullYear()+"년"
				wd += date.getMonth()+1+"월"
				wd += date.getDate()+"일"
				wd += date.getHours()+"시"
				wd += date.getMinutes()+"분"
				wd += date.getSeconds()+"초"
				
				html += "<div align='left'><b>아이디 : </b>"+data.id+" 님</br>"
				html += "<b>작성일 : </b>"+wd+"<br>"
				html += "<b>제 목 : </b>"+data.title+"<br>"
				html += "<b>내 용 : </b>"+data.content+"<hr></div>"
			})
			$("#reply").html(html)
		}
	})
}
function login() {
	alert('로그인이 필요한 기능입니다.')
	location.href="/root/member/login"
}
</script>
</head>
<body onload="replyData()">
<%@ include file="../default/header.jsp" %>

<div id="modal_wrap">
	<div id="first" style="height: 500px">
		<div style="width: 250px; margin: auto; padding-top: 20px;">
		<form id="frm">
			<input type="hidden" name="write_no" value="${data.writeNo }">
			<b>Reply</b><hr>
			<div class="form-group">
				<label for="id">작성자:</label>
				<input class="form-control" type="text" name="id", id="id" value="${loginUser }" readonly>
			</div>
			<div class="form-group">
				<label for="title">제목:</label>
				<input class="form-control" type="text" size="30" name="title" id="title">
			</div>
			<div class="form-group">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="5" cols="33" name="content" id="content"></textarea>
			</div>
			<c:if test="${loginUser == null }">
				<button class="btn btn-primary" type="button" onclick="login()">reply</button>
			</c:if>
			<c:if test="${loginUser != null }">
				<button class="btn btn-primary" type="button" onclick="rep()">reply</button>
			</c:if>
			<button class="btn btn-outline-primary" type="button" onclick="slide_hide()">reset</button>
		</form>
		</div>
	</div>
</div>

<div class="wrap" align="center">
<div style="width:600px; margin: auto;">
	<table class="table">
	<br>
		<tr>
			<th width="100" style="background-color: rgb(225, 225, 247);">글 번호</th><td width="200">${data.writeNo }</td>
			<th width="100" style="background-color: rgb(225, 225, 247);">작성자</th><td width="200">${data.id }</td>
		</tr>
		<tr>
			<th style="background-color: rgb(225, 225, 247);">제목</th><td>${data.title }</td>
			<th style="background-color: rgb(225, 225, 247);">등록일자</th><td>${data.saveDate }</td>
		</tr>
		<tr>
			<th style="background-color: rgb(225, 225, 247);">내용</th><td>${data.content }</td>
			<th colspan="2">
				<img width="200px" height="100px" src="download?imageFileName=${data.imageFileName }">
			</th>
		</tr>
		<tr>
		<td align="right" colspan="4">
			<c:if test="${loginUser == data.id }">
				<input type="button" class="btn btn-outline-secondary" onclick="location.href='delete?writeNo=${data.writeNo}&imageFileName=${data.imageFileName }'" value="delete">
				<input type="button" class="btn btn-secondary" onclick="location.href='update_form?writeNo=${data.writeNo}'" value="update">
			</c:if>
				<input type="button" class="btn btn-outline-primary" onclick="slideClick()" value="reply">
				<input type="button" class="btn btn-primary" onclick="location.href='boardAllList'" value="back">
		</td>
		</tr>
		
		<tr>
			<td colspan="4"><div id="reply"></div></td>
		</tr>
	</table>
</div>
</div>
</body>
</html>







