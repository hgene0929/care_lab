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
            	addr = data.roadAddress
            } else {
            	addr = data.zibunAddress
            }
            
            $("#addr1").val(data.zonecode)
            $("#addr2").val(addr)
            $("#addr3").val("")
            $("#addr3").val("").focus()
        }
    }).open();
}

function setPost() {
	let str = '${data.addr}'
	let arr = str.split(",")
	
	$("#addr1").val(arr[0])
    $("#addr2").val(arr[1])
    $("#addr3").val(arr[2])
}

</script>
</head>
<body onload="setPost()">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../default/header.jsp" %>

<div class="wrap" align="center" style="width: 500px; margin: 0 auto;">
	<br>
	<h3 align="center">회 원 정 보 수 정</h3>
	<br>
	<form id="fo" action="update" method="post">
		<table>
			<tr>
				<td>
					<input type="text" name="id" readonly value=${data.id }><br>
					<input type="text" name="pw" readonly value="**********"><br>
					<input type="text" name="addr" id="addr1" readonly>
					<button type="button" onclick="daumPost()">우편번호 찾기</button><br>
					<input type="text" name="addr" id="addr2" readonly>
					<input type="text" name="addr" id="addr3"><br>
					<input type="submit" value="수정">			
				</td>
			</tr>
		</table>
		
		<br>
	</form>
</div>
</body>
</html>