<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax</title>	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function ajaxTest() {			//버튼에 대한 메소드만 주고 받음
		$.ajax({					//jquery문법
			url:"ajax_result",		//"ajax",		//경로
			type:"GET",				//get/method방식
			success:function(data){	//data : 성공했다면 서버로부터 전달 받는 값
				$("#count").text(data)
				console.log('성공')},	
			error:function(){alert('통신 실패')}		//실패했다면
		})
	}
</script>
</head>
<body>
	<h1>ajax : 비동기 통신 방식</h1>
	: 특정 부분만 서버와 통신하는 방식
	<h2>일</h2> <h2>일</h2> <h2>일</h2> <h2>일</h2>
	<h2>일</h2> <h2>일</h2> <h2>일</h2> <h2>일</h2> 
	<button type="button" onclick="ajaxTest()"> 클릭</button>
	<label id="count">0</label>
</body>
</html>