<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function ajaxTest() {	//버튼에 대한 메소드만 주고 받음
		$.ajax({			//jquery문법
			url:"ajax",		//경로
			type:"GET",		//get/method방식
			success:function(){console.log('성공')},	//성공했다면
			error:function(){alert('통신 실패')}		//실패했다면
		})
	}
</script>
</head>
<body>
	<h2>일</h2> <h2>일</h2> <h2>일</h2> <h2>일</h2>
	<h2>일</h2> <h2>일</h2> <h2>일</h2> <h2>일</h2> 
	<button type="button" onclick="ajaxTest()"> 클릭</button>
</body>
</html>