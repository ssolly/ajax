<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getuser</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function getUsers(){
		$.ajax({
			url : "users", type : "get", dataType : "json",
			success : function(list) {
				//$("#users").text(list) // [object,Object]로 출력
				console.log(list)		//데이터를 많이 가져올 때 처음에 Object로 나오기 때문에 console.log명령어로 데이터 확인하는 작업 필요
				/*
				let html = "<b>이름 : </b>"+ list[0].name+"님<br>"
				html += "<b>나이 : </b>"+list[0].age+"살<hr>"
				html += "<b>이름 : </b>"+ list[1].name+"님<br>"
				html += "<b>나이 : </b>"+list[1].age+"살<hr>"
				*/
				/*
				let html="";
				for(var i=0; i<list.length; i++) {
					html += "<b>이름 : </b>"+list[i].name+"님<br>"
					html += "<b>나이 : </b>"+list[i].age+"님<hr>"
				}*/
				let html="";
				$.each(list,function(index,item) {		//jquery의 foreach문
					html += "<b>이름 : </b>"+item.name+"님<br>"
					html += "<b>나이 : </b>"+item.age+"님<hr>"
				})
				//$("#users").html(html)
				$("#users").append(html)	//더보기 같이 이어서 리스트업
			}
		})
	}
		
		function userInfo() {
			var userId=$("#userId").val()
			$.ajax({
				//url : "user?id="+userId,	// -> @RequestParam 으로 받아줌
				url : "user/"+userId,		// -> 
				type:"get", dataType:"json",
				success : function(dto) {
					let html=""
						html += "<b>이름 : </b>"+dto.name+"님<br>"
						html += "<b>나이 : </b>"+dto.age+"님<hr>"
					$("#users").html(html)
				}
			})
		}
</script>
</head>
<body>
	<span id="users"></span>
	<hr>
	<button type="button" onclick="getUsers()">사용자 목록 보기</button>
	<hr>
	<input type="text" id="userId" placeholder="input id">
	<button type="button" onclick="userInfo()">개인 정보 보기</button>
</body>
</html>