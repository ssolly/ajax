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
					html += "<b>나이 : </b>"+list[i].age+"살<hr>"
				}*/
				let html="";
				$.each(list,function(index,item) {		//jquery의 foreach문
					html += "<b>이름 : </b>"+item.name+"님<br>"
					html += "<b>나이 : </b>"+item.age+"살<hr>"
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
						html += "<b>나이 : </b>"+dto.age+"살<hr>"
					$("#users").html(html)
				}
			})
		}
		
		function modify() {
			let name = $("#name").val();
			let age = $("#age").val();
			let form = {name:name, age:age}
			$.ajax({
				url : "modify", type : "put", dataType : "json",
				data : JSON.stringify(form),
				contentType : "application/json; charset=utf-8",	//보내는타입
				success : function(dto) {
					let html=""
						html += "<b>이름 : </b>"+dto.name+"님<br>"
						html += "<b>나이 : </b>"+dto.age+"살<hr>"
					$("#users").html(html)
				}
			})
		}
		
		function membership() {
			/*
			let uId = $("#uId").val();
			let uName = $("#uName").val();
			let uAge = $("#uAge").val();
			let uAddr = $("#uAddr").val();
			let uPhone = $("#uPhone").val();
			let form={uId:uId, uName:uName, uAge:uAge, uAddr:uAddr, uPhone:uPhone}
			*/
			let form={}
			let arr=$("#fo").serializeArray()	//fo의 태그 안에 있는 것들을 배열로 만들어주는 메소드, name이란 속성 필요
			console.log(arr)
			for(var i=0; i<arr.length;i++) {
				form[arr[i].name]/*키*/ = arr[i].value/*값*/	
			}
			console.log("form:"+form)
			$.ajax({
				url:"membership", type:"post", dataType:"json",
				data:JSON.stringify(form), contentType:"application/json; charset=utf-8",
				success:function(test) { 
					alert("저장 성공")
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
	<hr>
	<input type="text" id="name" placeholder="이름 입력"><br>
	<input type="text" id="age" placeholder="수정할 나이 입력"><br>
	<button type="button" onclick="modify()">수정</button>
	<hr>
	<h3>회원가입</h3>
	<form id="fo">
		<input type="text" id="uId" name="uId" placeholder="id"><br>
		<input type="text" id="uName" name="uName" placeholder="uName"><br>
		<input type="text" id="uAge" name="uAge" placeholder="uAge"><br>
		<input type="text" id="uAddr" name="uAddr" placeholder="uAddr"><br>
		<input type="text" id="uPhone" name="uPhone" placeholder="uPhone"><br>
		<input type="button" onclick="membership()" value="회원가입"><br>
	</form>
</body>
</html>