<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax01</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function ajax() {
		var n = $("#name").val();
		var a = document.getElementById("age").value;
		var form = {name:n, age:a}		//JSON : key와 value(값)으로 이루어진 문자열 스타일, 현재 작성 방식은 javascript의 Object타입
		console.log(form)
		
		$.ajax({
			url : "ajax_result01",
			type : "POST",
			data : JSON.stringify(form),						//data:서버로 보낼 데이터, form형식이 JSON의 문자열 형식으로 전달{name:n, age:a}
			dataType : "json",									//서버로부터 돌려받는 값의 타입 지정(리턴타입 지정)
			contentType : "application/json; cahrset=utf-8",	//서버로 보내는 데이터 타입에 대한 설정
			success : function(result){
				$("#label").text(result.name + " : " + result.age)},
			error : function() {alert("문제 발생")}
		})
	}
</script>
</head>
<body>
	<input type="text" id="name" placeholder="name"><br>
	<input type="text" id="age" placeholder="age"><br>
	<input type="button" onclick="ajax()" value="저장">
	<br><hr><br>
	결과 [ <label id="label"></label> ]
	
</body>
</html>