<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
				$("#label").html("<b>길이가 짧습니다.</b>")
			} else { //중복된 아이디 입니다
				$("#label").html("<b>중복된 아이디입니다.</b>")
			}
		}
	})
}
</script>
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap" align="center">
	<form id="fo" action="register" method="post">
		<table>
			<tr>
				<td>
					<input type="text" name="id" id="id", placeholder="아이디" oninput="idCheck()">
					<label id="label"></label><br>
					
					<input type="password" name="pw" id="pw", placeholder="패스워드"><br>
					<input type="text" name="addr" id="addr1" readonly, placeholder="우편번호">
					<button type="button" onclick="daumPost()">우편번호 찾기</button><br>
					<input type="text" name="addr" id="addr2" readonly, placeholder="주소">
					<input type="text" name="addr", placeholder="주소성격"><br>
					<input type="button" onclick="reg()" value="확인">			
				</td>
			</tr>
		</table>
		
		<br>
	</form>
</div>
</body>
</html>