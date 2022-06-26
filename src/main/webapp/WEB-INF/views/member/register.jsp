<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Care Lab</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function daumPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            let addr = "";
            if(data.userSelectedType == 'R') {
            	addr = data.roadname
            } else {
            	addr = data.bname
            }
            
            $("#addr1").val(data.zonecode)
            $("#addr2").val(addr)
        }
    }).open();
}

function reg() {
	if($("#id").val() == "") {
		alert("아이디는 필수 항목 입니다.")
		$("#id").focus()
	} else if($("#pw").val() == "") {
		alert("비밀번호는 필수 항목 입니다.")
		$("#pw").focus()
	} else {
		fo.submit()
	}
}

function idCheck() {
	let id = $("#id").val()
	
	$.ajax({
		url : "idCheck/"+id, type : "get",
		success : function(result) {
			if(result == 0) {//사용가능한 아이디입니다
				$("#label").html("<b>"+id+"는 사용가능한 아이디입니다.</b>")
			} else if(result == -1) {//길이가 짧습니다
				$("#label").html("<b style='color:red;'>길이가 짧습니다</b>")
			} else { //중복된 아이디 입니다
				$("#label").html("<b style='color:blue;'>중복된 아이디 입니다</b>")
			}
		}
	})
}
</script>
</head>
<body>
<%@ include file="../default/header.jsp" %>

<div class="wrap">
	<div style="width:600px; margin: auto;">
	<br>
	<form id="fo" action="register" method="post">
		<table class="table">
			<tr>
				<th>아이디</th> 
				<td>
				<input type="text" name="id" id="id", placeholder="ID" oninput="idCheck()">
				<label id="label">아이디 중복 체크 전</label>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" id="pw", placeholder="Password"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
				<input type="text" name="addr" id="addr1" readonly, placeholder="post number">
				<button class="btn btn-info" type="button" onclick="daumPost()">우편번호 찾기</button><br>
				<input type="text" name="addr" id="addr2" readonly, placeholder="address">
				<input type="text" name="addr", placeholder="detail">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input class="btn btn-outline-primary" type="button" onclick="reg()" value="register">			
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>